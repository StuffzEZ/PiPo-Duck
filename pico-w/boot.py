import board
import digitalio
import storage

# Use GP15 to control USB visibility
usb_control_pin = digitalio.DigitalInOut(board.GP15)
usb_control_pin.switch_to_input(pull=digitalio.Pull.UP)

# Logic:
# Pico W: GP15 connected to GND -> enable USB
#         GP15 not connected (pulled high) -> disable USB

if usb_control_pin.value:  # Pin is high (not connected to GND)
    storage.disable_usb_drive()
    print("USB drive is hidden (web mode)")
else:
    print("USB drive is enabled (development mode)")
