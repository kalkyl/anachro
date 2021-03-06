use nrf52840_hal::{
    gpio::{Output, Pin, PushPull},
    spis::{Instance, Mode, Spis, TransferSplit},
};

use embedded_hal::digital::v2::{OutputPin, StatefulOutputPin};

use anachro_spi::{arbitrator::EncLogicLLArbitrator, Error, Result};

use crate::{ConstRawSlice, MutRawSlice};

unsafe impl<S> Send for Periph<S> where S: Instance + Send {}

enum Periph<S>
where
    S: Instance + Send,
{
    Idle(Spis<S>),
    Pending(TransferSplit<S, ConstRawSlice, MutRawSlice>),
    Aborted(TransferSplit<S, ConstRawSlice, MutRawSlice>),
    Unstable,
}

pub struct NrfSpiArbLL<S>
where
    S: Instance + Send,
{
    periph: Periph<S>,
    go_pin: Pin<Output<PushPull>>,
}

impl<S> NrfSpiArbLL<S>
where
    S: Instance + Send,
{
    pub fn new(spis: Spis<S>, mut go_pin: Pin<Output<PushPull>>) -> Self {
        defmt::trace!("New Arbitrator LL Created");
        go_pin.set_high().ok();
        spis.set_default_char(0x00)
            .set_orc(0x00)
            .set_mode(Mode::Mode0)
            .auto_acquire(true)
            .reset_events();
        spis.try_acquire().ok();
        spis.disable();

        Self {
            periph: Periph::Idle(spis),
            go_pin,
        }
    }
}

impl<S> EncLogicLLArbitrator for NrfSpiArbLL<S>
where
    S: Instance + Send,
{
    fn process(&mut self) -> Result<()> {
        defmt::trace!("LL Arb Processing");

        let mut current = Periph::Unstable;
        core::mem::swap(&mut current, &mut self.periph);

        self.periph = match current {
            Periph::Idle(p) => {
                defmt::trace!("Idle.");
                Periph::Idle(p)
            }
            Periph::Pending(p) => {
                defmt::trace!("Pending");
                Periph::Pending(p)
            }
            Periph::Aborted(mut p) => {
                if p.is_acquired() {
                    defmt::trace!("Aborted and Done");
                    let (_tx, _rx, p) = p.wait();
                    Periph::Idle(p)
                } else {
                    defmt::trace!("Aborted");
                    let (_tx, _rx, p) = p.bail();
                    Periph::Idle(p)
                }
            }
            Periph::Unstable => {
                defmt::error!("Unstable!");
                return Err(Error::UnstableFailure);
            }
        };

        Ok(())
    }

    fn has_exchange_begun(&self) -> Result<bool> {
        Ok(true)
    }

    fn notify_go(&mut self) -> Result<()> {
        self.go_pin.set_low().map_err(|_| Error::GpioError)
    }

    fn clear_go(&mut self) -> Result<()> {
        self.go_pin.set_high().map_err(|_| Error::GpioError)
    }

    fn is_go_active(&mut self) -> Result<bool> {
        self.go_pin.is_set_low().map_err(|_| Error::GpioError)
    }

    fn prepare_exchange(
        &mut self,
        data_out: *const u8,
        data_out_len: usize,
        data_in: *mut u8,
        data_in_max: usize,
    ) -> Result<()> {
        defmt::trace!("Preparing exchange");

        let mut old_periph = Periph::Unstable;
        core::mem::swap(&mut self.periph, &mut old_periph);

        let spis = match old_periph {
            Periph::Idle(spis) => spis,
            Periph::Pending(_) | Periph::Aborted(_) | Periph::Unstable => {
                defmt::error!("Arbitrator in wrong state for exchange!");
                self.periph = old_periph;
                return Err(Error::IncorrectState);
            }
        };

        let _spis_ref = match spis.try_acquire() {
            Ok(sr) => sr,
            Err(_e) => {
                defmt::error!("Arbitrator unable to acquire SPIS!");
                self.periph = Periph::Idle(spis);
                return Err(Error::SpiError);
            }
        };

        spis.enable();
        let txfr = match spis.transfer_split(
            ConstRawSlice {
                ptr: data_out,
                len: data_out_len,
            },
            MutRawSlice {
                ptr: data_in,
                len: data_in_max,
            },
        ) {
            Ok(t) => {
                defmt::trace!("started arb transfer");
                t
            }
            Err((_e, p, _tx, _rx)) => {
                defmt::error!("Failed to start arb transfer!");
                self.periph = Periph::Idle(p);
                return Err(Error::SpiError);
            }
        };

        self.periph = Periph::Pending(txfr);
        self.notify_go().ok();

        Ok(())
    }

    fn is_exchange_active(&self) -> Result<bool> {
        match self.periph {
            Periph::Idle(_) => Ok(false),
            Periph::Pending(_) => Ok(true),
            Periph::Aborted(_) => Ok(true), // maybe?
            Periph::Unstable => Err(Error::UnstableFailure),
        }
    }

    fn complete_exchange(&mut self) -> Result<usize> {
        let mut current = Periph::Unstable;
        core::mem::swap(&mut self.periph, &mut current);

        let amt = match current {
            Periph::Idle(p) => {
                defmt::error!("Idle on exchange completion!");
                self.periph = Periph::Idle(p);
                return Err(Error::IncorrectState);
            }
            Periph::Aborted(p) => {
                defmt::error!("txfr aborted prior to completion!");
                self.periph = Periph::Aborted(p);
                return Err(Error::TransactionAborted);
            }
            Periph::Unstable => {
                return Err(Error::UnstableFailure);
            }
            Periph::Pending(mut p) => {
                if p.is_acquired() {
                    let (tx, rx, p) = p.wait();
                    let (amt_rx, amt_tx) = p.amounts();

                    if (amt_rx == 0) && (amt_tx == 0) {
                        defmt::error!("Empty message?");
                        self.periph = Periph::Idle(p);
                        self.clear_go().ok();
                        return Err(Error::TransactionAborted);
                    } else {
                        defmt::info!("Transaction done - tx: {:?} rx: {:?} (expected to send {:?} and rx {:?})", amt_tx, amt_rx, tx.len, rx.len);
                        if (amt_tx as usize != tx.len) || (amt_rx as usize != rx.len) {
                            defmt::error!("Size mismatch!");
                            self.periph = Periph::Idle(p);
                            self.clear_go().ok();
                            return Err(Error::TransactionAborted);
                        }
                        p.disable();
                        self.periph = Periph::Idle(p);
                        amt_rx as usize
                    }
                } else {
                    defmt::trace!("Stil pending...");
                    self.periph = Periph::Pending(p);
                    return Err(Error::TransactionBusy);
                }
            }
        };

        Ok(amt)
    }

    fn abort_exchange(&mut self) -> Result<usize> {
        defmt::trace!("Aborting exchange!");

        self.clear_go().ok();

        let mut current = Periph::Unstable;
        core::mem::swap(&mut current, &mut self.periph);

        let mut amt = 0;
        self.periph = match current {
            Periph::Idle(p) => Periph::Idle(p),
            Periph::Pending(mut p) => {
                defmt::info!("Aborting pending exchange");
                if p.is_acquired() {
                    let (_tx, _rx, p) = p.wait();
                    amt = p.amount() as usize;
                    p.disable();
                    Periph::Idle(p)
                } else {
                    Periph::Aborted(p)
                }
            }
            Periph::Aborted(p) => {
                defmt::warn!("re-aborting exchange?");
                Periph::Aborted(p)
            }
            Periph::Unstable => Periph::Unstable,
        };

        Ok(amt)
    }
}
