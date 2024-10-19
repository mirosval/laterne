# Adafruit Feather RP2040 with Adafruit Jewel

This is for a project I did with my kids to create an animated lantern. It's super easy to put together. 

The Adafruit board is wired in the simplest possible configuration, I've attached the Jewel directly to the 3.3V output of the board, connected the ground and connected the D6 (GPIO8) to DIN on the Jewel. I've not used the logic level shifter because I'm assuming the Jewel is not going to pull too much and so I've attached it to the 3.3V instead of either the 5V of the USB or the BAT output. I'm using a USB-C powerbank to power it, it's easy and simple and the powerbank can be later reused for other purposes.

```shell
# Initialize nix to pull all the dependencies
direnv allow

# Connect the board while holding the Bootselect button
make flash
```

Used resources:
- (https://www.alexdwilson.dev/learning-in-public/running-rust-code-on-raspberry-pi-pico)[https://www.alexdwilson.dev/learning-in-public/running-rust-code-on-raspberry-pi-pico]
- (https://github.com/polygon/rp2040-project-template-nix/blob/main/src/main.rs)[Project template]
- (https://github.com/rp-rs/rp-hal)[RP Rust HAL]
