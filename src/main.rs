#![no_std]
#![no_main]

use core::fmt::Write;
use core::panic::PanicInfo;
mod vga_buffer;

static HELLO: &[u8] = b"Hello World!";

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

#[no_mangle]
pub extern "C" fn _start() -> ! {
    println!("Hello {}", "world!");
    println!(";)");
    loop {}
}
