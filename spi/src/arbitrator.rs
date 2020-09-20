use crate::{Result, BBFullDuplex};

use bbqueue::{
    framed::{FrameGrantR, FrameGrantW},
    ArrayLength, BBBuffer,
};

pub trait EncLogicLLArbitrator {
    /// Process low level messages
    fn process(&mut self) -> Result<()>;

    /// Is the Component requesting a transaction?
    fn is_ready_active(&mut self) -> Result<bool>;

    // Is the GO line active?
    fn is_go_active(&mut self) -> Result<bool>;

    /// Set the GO line active (low)
    fn notify_go(&mut self) -> Result<()>;

    /// Set the GO line inactive(high)
    fn clear_go(&mut self) -> Result<()>;

    /// Prepare data to be exchanged. The data MUST not be referenced
    /// until `complete_exchange` or `abort_exchange` has been called.
    ///
    /// This will automatically set the GO line if it is
    /// not already active.
    ///
    /// Will return an error if READY is not active
    ///
    /// This will begin sending once the Component begins clocking data
    ///
    /// An error will be returned if an exchange is already in progress
    // TODO: `embedded-dma`?
    fn prepare_exchange(
        &mut self,
        data_out: *const u8,
        data_out_len: usize,
        data_in: *mut u8,
        data_in_max: usize,
    ) -> Result<()>;

    /// Is a `exchange` action still in progress?
    fn is_exchange_active(&self) -> Result<bool>;

    /// Attempt to complete a `exchange` action.
    ///
    /// Returns `Ok(())` if the `exchange` completed successfully.
    ///
    /// If the exchange is successful and `clear_go` is `true`,
    /// then the GO line will be cleared.
    ///
    /// Will return an error if the exchange is still in progress.
    /// If the exchange is still in progress, `clear_go` is ignored.
    ///
    /// Use `abort_exchange` to force the exchange to completion even
    /// if it is still in progress.
    fn complete_exchange(&mut self, clear_go: bool) -> Result<usize>;

    /// Stop the `exchange` action immediately
    ///
    /// Returns `Ok(usize)` if the exchange had already been completed.
    ///
    /// In all cases, the GO line will be cleared.
    ///
    /// If the exchange had not yet completed, an Error containing the
    /// number of successfully sent bytes will be returned.
    fn abort_exchange(&mut self) -> Result<usize>;
}

pub struct EncLogicHLArbitrator<LL, CT>
where
    CT: ArrayLength<u8>,
    LL: EncLogicLLArbitrator,
{
    ll: LL,
    outgoing_msgs: BBFullDuplex<CT>,
    incoming_msgs: BBFullDuplex<CT>,
    out_grant: Option<FrameGrantR<'static, CT>>,
    in_grant: Option<FrameGrantW<'static, CT>>,
    out_buf: [u8; 4],
    sent_hdr: bool,
}


impl<LL, CT> EncLogicHLArbitrator<LL, CT>
where
    CT: ArrayLength<u8>,
    LL: EncLogicLLArbitrator,
{
    pub fn new(
        ll: LL,
        outgoing: &'static BBBuffer<CT>,
        incoming: &'static BBBuffer<CT>
    ) -> Result<Self> {
        Ok(EncLogicHLArbitrator {
            ll,
            outgoing_msgs: BBFullDuplex::new(outgoing)?,
            incoming_msgs: BBFullDuplex::new(incoming)?,
            out_buf: [0u8; 4],
            out_grant: None,
            in_grant: None,
            sent_hdr: false,
        })
    }

    pub fn dequeue(&mut self) -> Option<FrameGrantR<CT>> {
        self.incoming_msgs.cons.read()
    }

    // TODO: `enqueue_with` function or something for zero-copy grants
    pub fn enqueue(&mut self, msg: &[u8]) -> Result<()> {
        let len = msg.len();
        let mut wgr = self.outgoing_msgs.prod.grant(len)?;
        wgr.copy_from_slice(msg);
        wgr.commit(len);
        Ok(())
    }

    pub fn poll(&mut self) -> Result<()> {
        self.ll.process()?;

        if !self.ll.is_exchange_active().unwrap() {
            match self.ll.is_ready_active() {
                Ok(true) => {
                    if !self.sent_hdr {
                        // println!("Got READY, start header exchange!");
                        assert!(self.out_grant.is_none(), "Why do we have an out grant already?!");
                        assert!(self.in_grant.is_none(), "Why do we have an in grant already?!");

                        // This will be a pointer to the incoming grant
                        let in_ptr;

                        // Note: Hardcoded to 4, as we are expecting a u32
                        self.in_grant  = Some({
                            let mut igr = self.incoming_msgs.prod.grant(4)?;
                            in_ptr = igr.as_mut_ptr();
                            igr
                        });
                        self.out_grant = self.outgoing_msgs.cons.read();

                        // Fill the output buffer with the size of the next body
                        self.out_buf = self
                            .out_grant
                            .as_ref()
                            .map(|msg| msg.len() as u32)
                            .unwrap_or(0)
                            .to_le_bytes();

                        self.ll
                            .prepare_exchange(
                                self.out_buf.as_ptr(),
                                self.out_buf.len(),
                                in_ptr,
                                4,
                            )
                            .unwrap();
                    } else {
                        // println!("Got READY, start data exchange!");

                        // TODO:
                        // * Parse the input data into a u32 to get the Component's len
                        // * Release the incoming grant (we don't want to send u32s to the app)
                        // * Request a grant that is component_len

                        // Note: This drops igr by taking it out of the option
                        let amt = if let Some(igr) = self.in_grant.take() {
                            assert_eq!(igr.len(), 4);
                            let mut buf = [0u8; 4];
                            buf.copy_from_slice(&igr);
                            let amt = u32::from_le_bytes(buf);
                            amt as usize
                        } else {
                            // Why don't we have a grant here?
                            // TODO: Probably want to drop grants, if any, and abort exch
                            panic!("logic error: No igr from header rx");
                        };

                        // HACK: Always request one byte so we'll get a grant for a valid pointer/
                        // to not handle potentially None grants. I might just want to have something
                        // else for this case
                        let in_ptr;
                        self.in_grant = match self.incoming_msgs.prod.grant(amt.max(1)) {
                            Ok(mut igr) => {
                                in_ptr = igr.as_mut_ptr();
                                Some(igr)
                            },
                            Err(_) => {
                                // TODO: probably want to abort and clear grants
                                todo!("Handle insufficient size for incoming message")
                            }
                        };

                        // Do we actually have an outgoing message?
                        let (ptr, len) = if let Some(msg) = self.out_grant.as_ref() {
                            (msg.as_ptr(), msg.len())
                        } else {
                            (self.out_buf.as_ptr(), 0)
                        };

                        self.ll
                            .prepare_exchange(
                                ptr,
                                len,
                                in_ptr,
                                amt,
                            )
                            .unwrap();
                    }
                }
                Ok(false) if self.ll.is_go_active()? => {
                    // println!("clearing go!");
                    self.ll.clear_go().unwrap();
                    self.sent_hdr = false;
                }
                _ => {}
            }
        } else {
            if !self.ll.is_ready_active().unwrap() {
                // println!("aborting!");
                self.ll.abort_exchange().ok();
                self.sent_hdr = false;

                // Drop grants without comitting.
                // Do AFTER aborting exchange, to defuse DMA.
                self.in_grant = None;
                self.out_grant = None;
            }

            match self.ll.complete_exchange(false) {
                Err(_) => {}
                Ok(amt) => {

                    // println!("got {:?}!", in_buf_inner);

                    if self.sent_hdr {

                        assert!(self.in_grant.is_some(), "Why don't we have an in grant at the end of exchange?");

                        if let Some(igr) = self.in_grant.take() {
                            igr.commit(amt);
                        }
                        if let Some(ogr) = self.out_grant.take() {
                            ogr.release();
                        }
                    }
                    // else NOTE: if we just finished sending the header, DON'T clean up yet, as we
                    // will do that at the start of the next transaction.

                    // If we hadn't sent the header, we just did.
                    // If we have sent the header, we need to for the
                    // next message
                    self.sent_hdr = !self.sent_hdr;
                }
            }
        }
        Ok(())
    }
}


// pub trait EncLogicHLArbitrator {
//     /// Place a message to be sent over SPI
//     fn enqueue(&mut self, msg: &[u8]) -> Result<()>;

//     /// Attempt to receive a message over SPI
//     fn dequeue<'a>(&mut self, msg_out: &'a mut [u8]) -> Result<Option<&'a [u8]>>;

//     /// Periodic poll. Should be called regularly (or on interrupts?)
//     fn poll(&mut self) -> Result<()>;

//     fn get_ll<LL: EncLogicLLArbitrator>(&mut self) -> &mut LL;
// }