# Scripting
The PiPo Ducky boasts a powerful scripting engine that is one of the easiest to learn. So easy that we only need 1 page for it!

## Metadata
For scripts on the script viewer, you are advised to have `metadata` to make it easier to see what the script is. The metadata for `.picods` files goes like this:
<br>(Put these at the top of the script and one line only)
- `#T>` - The title metadata - This will be shown as the title in the script chooser (script explorer)
- `#D>` - The description metadata - This will be shown below the title in the script chooser (Script explorer)
- `#R>` - (Not Required to be in the script) Requirements - Tell the user executing the script what needs to happen before executing it
- `#N>` - (Not required to be in the script) Notes - Tell the user executing the script some notes about it
Together, they look like this
```
#T> Hello World Script
#D> A Basic Hello World Script That Says Hello World Through A Batch Script

#R> Must be plugged into a windows computer
#R> OR
#R> A OS that can process and run batch files

#N> Does not damage computer
#N> Just says hello world
#N> It shows on the person's computer

..Commands..
```
(The notes and requirements can be multiline)

## Commands

Commands are the actual code that is run when the run button is clicked. Here is a list of commands:

- `WINDOWS` - Presses the Windows key.
- `GUI` - Presses the Windows key (can be used to open shortcuts involving the Windows key, e.g., `GUI r` for Win+R).
- `APP` / `MENU` - Opens the context menu (equivalent to right-click).
- `SHIFT` - Presses the Shift key.
- `ALT` - Presses the Alt key.
- `CONTROL` / `CTRL` - Presses the Control key.
- `DOWNARROW` / `DOWN` - Presses the Down Arrow key.
- `LEFTARROW` / `LEFT` - Presses the Left Arrow key.
- `RIGHTARROW` / `RIGHT` - Presses the Right Arrow key.
- `UPARROW` / `UP` - Presses the Up Arrow key.
- `BREAK` / `PAUSE` - Presses the Pause/Break key.
- `CAPSLOCK` - Toggles Caps Lock.
- `DELETE` - Presses the Delete key.
- `END` - Presses the End key.
- `ESC` / `ESCAPE` - Presses the Escape key.
- `HOME` - Presses the Home key.
- `INSERT` - Presses the Insert key.
- `NUMLOCK` - Toggles Num Lock on the keypad.
- `PAGEUP` - Presses the Page Up key.
- `PAGEDOWN` - Presses the Page Down key.
- `PRINTSCREEN` - Presses the Print Screen key.
- `ENTER` - Presses the Enter key.
- `SCROLLLOCK` - Toggles Scroll Lock.
- `SPACE` - Presses the Spacebar.
- `TAB` - Presses the Tab key.
- `A` through `Z` - Presses the corresponding letter key.
- `F1` through `F12` - Presses the corresponding function key.
A Full Dictionary, Extracted From The duck.py Script Is Below.
```
    duckyCommands = {
    'WINDOWS': Keycode.WINDOWS, 'GUI': Keycode.GUI,
    'APP': Keycode.APPLICATION, 'MENU': Keycode.APPLICATION, 'SHIFT': Keycode.SHIFT,
    'ALT': Keycode.ALT, 'CONTROL': Keycode.CONTROL, 'CTRL': Keycode.CONTROL,
    'DOWNARROW': Keycode.DOWN_ARROW, 'DOWN': Keycode.DOWN_ARROW, 'LEFTARROW': Keycode.LEFT_ARROW,
    'LEFT': Keycode.LEFT_ARROW, 'RIGHTARROW': Keycode.RIGHT_ARROW, 'RIGHT': Keycode.RIGHT_ARROW,
    'UPARROW': Keycode.UP_ARROW, 'UP': Keycode.UP_ARROW, 'BREAK': Keycode.PAUSE,
    'PAUSE': Keycode.PAUSE, 'CAPSLOCK': Keycode.CAPS_LOCK, 'DELETE': Keycode.DELETE,
    'END': Keycode.END, 'ESC': Keycode.ESCAPE, 'ESCAPE': Keycode.ESCAPE, 'HOME': Keycode.HOME,
    'INSERT': Keycode.INSERT, 'NUMLOCK': Keycode.KEYPAD_NUMLOCK, 'PAGEUP': Keycode.PAGE_UP,
    'PAGEDOWN': Keycode.PAGE_DOWN, 'PRINTSCREEN': Keycode.PRINT_SCREEN, 'ENTER': Keycode.ENTER,
    'SCROLLLOCK': Keycode.SCROLL_LOCK, 'SPACE': Keycode.SPACE, 'TAB': Keycode.TAB,
    'A': Keycode.A, 'B': Keycode.B, 'C': Keycode.C, 'D': Keycode.D, 'E': Keycode.E,
    'F': Keycode.F, 'G': Keycode.G, 'H': Keycode.H, 'I': Keycode.I, 'J': Keycode.J,
    'K': Keycode.K, 'L': Keycode.L, 'M': Keycode.M, 'N': Keycode.N, 'O': Keycode.O,
    'P': Keycode.P, 'Q': Keycode.Q, 'R': Keycode.R, 'S': Keycode.S, 'T': Keycode.T,
    'U': Keycode.U, 'V': Keycode.V, 'W': Keycode.W, 'X': Keycode.X, 'Y': Keycode.Y,
    'Z': Keycode.Z, 'F1': Keycode.F1, 'F2': Keycode.F2, 'F3': Keycode.F3,
    'F4': Keycode.F4, 'F5': Keycode.F5, 'F6': Keycode.F6, 'F7': Keycode.F7,
    'F8': Keycode.F8, 'F9': Keycode.F9, 'F10': Keycode.F10, 'F11': Keycode.F11,
    'F12': Keycode.F12,
    }
```

## Examples
Here are some examples with comments (Starting with `#`) along the lines to explain them
EG1 - rickroll
```
DELAY 1000 # Wait 1 Second (1000ms)
GUI r # Press WIN+R
DELAY 300 # Wait 300ms
STRING cmd # Type cmd
ENTER # Press enter
DELAY 750 # Wait 750ms
STRING curl ASCII.live/can-you-hear-me # Type the script location into the cmd window
ENTER # Press enter
```
### MORE EXAMPLES COMING SOON

### If you have made a script, you are welcome to contribute it to [this repo](https://github.com/StuffzEZ/PiPo-Ducky/tree/scripts) by forking it then submitting a PR (pull request) to the scripts branch!
