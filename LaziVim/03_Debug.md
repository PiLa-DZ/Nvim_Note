# Debug Adapter Protocol (DAP)

## Setup DAP

### Enable the DAP Extra (The Easy Way)

LazyVim has a built-in "extra" for debugging.
You should enable it so the UI and core settings are pre-configured for you.

1. Open Neovim and type :LazyExtras.
1. Find dap.core and lang.typescript (this covers JS too).
1. Press x to enable them.

### Install the Adapter via Mason

Type :Mason inside Neovim.

1. Press 2 to go to the DAP tab.
1. Search for js-debug-adapter.
1. Press i to install it.

## Use DAP

### The Main Shortcuts

When you press `<space>d`, a menu appears. Here are the heavy hitters:

1. `<space>db` (Toggle Breakpoint):
   This puts a "red dot" on the current line.
   When you run your code,
   it will stop exactly here so you can inspect it.

1. `<space>dc` (Continue):
   Starts the program or jumps to the next breakpoint.

1. `<space>di` (Step Into):
   If your cursor is on a function call,
   this "dives" inside that function to see what it does.

1. `<space>do` (Step Over):
   Runs the current line and goes to the next one without diving into functions.

1. `<space>dt` (Terminate):
   Stops the debugging session immediately.

### The UI `<space>du` toggles the DAP UI

It opens several windows at once:

- Scopes: Shows all your active variables and their current values.
- Breakpoints: A list of everywhere you’ve told the code to stop.
- Stacks: Shows which functions called which functions to get to where you are.
- Repl: A small terminal where you can type code to interact with your paused program.
