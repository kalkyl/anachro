#![no_main]
#![no_std]

use embedded_hal::digital::v2::OutputPin;
use embedded_hal::blocking::delay::{DelayMs, DelayUs};
use nrf52840_hal::{
    self as hal,
    clocks::LfOscConfiguration,
    gpio::{p0::Parts as P0Parts, p1::Parts as P1Parts, Level},
    pac::{Peripherals, SPIS1, SPIM0, TIMER2, UARTE0},
    ppi::{Parts as PpiParts, Ppi0},
    spim::{Frequency, Pins as SpimPins, Spim, MODE_0, TransferSplit},
    spis::{Pins as SpisPins, Spis, Transfer, Mode},
    timer::{Timer, Periodic, Instance as TimerInstance},
    uarte::{Pins, Baudrate, Parity},
};
use key_003 as _; // global logger + panicking-behavior + memory layout
use bbqueue::{
    consts::*,
    BBBuffer,
    ConstBBBuffer,
    framed::FrameGrantW,
};

use anachro_server::{Broker, Uuid};
use anachro_client::{pubsub_table, Client, ClientIoError, Error};

use anachro_spi::{
    arbitrator::EncLogicHLArbitrator,
    component::EncLogicHLComponent,
};
use anachro_spi_nrf52::{
    arbitrator::NrfSpiArbLL,
    component::NrfSpiComLL,
};
use anachro_icd::Version;
use heapless::{consts, Vec as HVec};

use serde::{Deserialize, Serialize};

use groundhog_nrf52::GlobalRollingTimer;

use fleet_uarte::{
    buffer::UarteBuffer,
    buffer::UarteParts,
    anachro_io::AnachroUarte,
    cobs_buf::Buffer,
    irq::{UarteIrq, UarteTimer},
    app::UarteApp,
};

use core::sync::atomic::AtomicBool;

static FLEET_BUFFER: UarteBuffer<U2048, U2048> = UarteBuffer {
    txd_buf: BBBuffer( ConstBBBuffer::new() ),
    rxd_buf: BBBuffer( ConstBBBuffer::new() ),
    timeout_flag: AtomicBool::new(false),
};

#[derive(Debug, Serialize, Deserialize, Clone)]
pub struct Demo {
    foo: u32,
    bar: i16,
    baz: (u8, u8),
}

pubsub_table! {
    AnachroTable,
    Subs => {
        Something: "foo/bar/baz" => Demo,
        Else: "bib/bim/bap" => (),
    },
    Pubs => {
        Etwas: "short/send" => (),
        Anders: "send/short" => (),
    },
}

#[rtic::app(device = crate::hal::pac, peripherals = true, monotonic = groundhog_nrf52::GlobalRollingTimer)]
const APP: () = {
    struct Resources {
        client: Client,
        anachro_uarte: AnachroUarte<U2048, U2048, U512>,
        uarte_timer: UarteTimer<TIMER2>,
        uarte_irq: UarteIrq<U2048, U2048, Ppi0, UARTE0>,
    }

    #[init(spawn = [anachro_periodic])]
    fn init(ctx: init::Context) -> init::LateResources {
        defmt::info!("Hello, world!");

        let board = ctx.device;

        // Setup clocks
        let clocks = hal::clocks::Clocks::new(board.CLOCK);
        let clocks = clocks.enable_ext_hfosc();
        let clocks = clocks.set_lfclk_src_external(LfOscConfiguration::NoExternalNoBypass);
        clocks.start_lfclk();

        // Setup global timer
        GlobalRollingTimer::init(board.TIMER0);

        let gpios = P0Parts::new(board.P0);
        let ppis = PpiParts::new(board.PPI);

        let pin_rx = gpios.p0_15.into_floating_input().degrade();
        let pin_tx = gpios.p0_16.into_push_pull_output(Level::Low).degrade();

        let UarteParts { app, timer, irq } = FLEET_BUFFER.try_split(
            Pins {
                rxd: pin_rx,
                txd: pin_tx,
                cts: None,
                rts: None,
            },
            Parity::EXCLUDED,
            Baudrate::BAUD1M,
            board.TIMER2,
            ppis.ppi0,
            board.UARTE0,
            256,
            10_000,
        ).map_err(drop).unwrap();

        let an_uarte = AnachroUarte::new(
            app,
            Buffer::new(),
            Uuid::from_bytes([42u8; 16]),
        );


        let client = Client::new(
            "key-003",
            Version {
                major: 0,
                minor: 4,
                trivial: 1,
                misc: 123,
            },
            987,
            AnachroTable::sub_paths(),
            AnachroTable::pub_paths(),
            Some(250),
        );

        // Spawn periodic tasks
        ctx.spawn.anachro_periodic().ok();

        init::LateResources {
            client,
            anachro_uarte: an_uarte,
            uarte_timer: timer,
            uarte_irq: irq,
        }
    }

    #[task(resources = [client, anachro_uarte], schedule = [anachro_periodic])]
    fn anachro_periodic(ctx: anachro_periodic::Context) {
        static mut HAS_CONNECTED: bool = false;

        let res = ctx.resources
            .client
            .process_one::<_, AnachroTable>(ctx.resources.anachro_uarte);

        if !*HAS_CONNECTED && ctx.resources.client.is_connected() {
            defmt::info!("Connected!");
            *HAS_CONNECTED = true;
        }

        match res {
            Ok(Some(_msg)) => defmt::info!("Got a message!"),
            Ok(None) => {},
            Err(e) => defmt::error!("ERR: {:?}", e),
        }

        ctx.schedule
            .anachro_periodic(ctx.scheduled + 1_000) // 1ms
            .ok();
    }

    #[task(binds = TIMER2, resources = [uarte_timer])]
    fn timer2(ctx: timer2::Context) {
        // fleet uarte timer
        ctx.resources.uarte_timer.interrupt();
    }

    #[task(binds = UARTE0_UART0, resources = [uarte_irq])]
    fn uarte0(ctx: uarte0::Context) {
        // fleet uarte interrupt
        ctx.resources.uarte_irq.interrupt();
    }

    #[idle]
    fn idle(_ctx: idle::Context) -> ! {
        loop {
            // Don't WFI/WFE for now
            cortex_m::asm::nop();
        }
    }

    // Sacrificial hardware interrupts
    extern "C" {
        fn SWI1_EGU1();
    // fn SWI2_EGU2();
    // fn SWI3_EGU3();
    }
};

// #[cortex_m_rt::entry]
// fn main() -> ! {


//     client.process_one::<_, AnachroTable>(&mut an_uarte).ok();


//     key_003::exit()
// }