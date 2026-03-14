# ghostty.fish

A fish shell plugin that provides convenient functions for controlling the Ghostty terminal emulator's native progress bar. Graphical Progress Bars were added to Ghostty in v1.2.0, see [the release notes](https://ghostty.org/docs/install/release-notes/1-2-0#graphical-progress-bars).

## Features

- **`ghostty_progress`** - Update the progress bar with a specific state and percentage
- **`ghostty_progress_clear`** - Clear the progress bar
- **`ghostty_progress_error`** - Display an error state in the progress bar

## Installation

### Using Fisher

[Fisher](https://github.com/jorgebucaran/fisher) is the recommended way to install this plugin.

```fish
fisher install wayneashleyberry/ghostty.fish
```

### Manual Installation

If you prefer to install manually, clone this repository and add it to your fish configuration directory:

```bash
git clone https://github.com/wayneashleyberry/ghostty.fish ~/.config/fish/plugins/ghostty.fish
```

Then add to your `~/.config/fish/config.fish`:

```fish
set -gp fish_function_path ~/.config/fish/plugins/ghostty.fish/functions
```

## Usage

### Functions

#### `ghostty_progress <state> <percentage>`

Update the Ghostty progress bar with a specific state and percentage.

**States:**
- `0` - Off (clear/reset)
- `1` - Standard (running)
- `2` - Error
- `3` - Indeterminate

**Parameters:**
- `<state>` - The progress state (optional, defaults to `1`)
- `<percentage>` - The progress percentage 0-100 (optional, defaults to `0`)

#### `ghostty_progress_clear`

Clear the progress bar. Equivalent to `ghostty_progress 0 0`.

#### `ghostty_progress_error`

Show an error state in the progress bar. Equivalent to `ghostty_progress 2 100`.

## Example

Here's an example fish shell script that uses the progress bar while performing a task:

```fish
#!/usr/bin/env fish

# Simulate a long-running task with progress updates
function example_task
    echo "Starting task..."
    
    # Show running state, 25%
    ghostty_progress 1 25
    sleep 1
    
    # Update to 50%
    ghostty_progress 1 50
    sleep 1
    
    # Update to 75%
    ghostty_progress 1 75
    sleep 1
    
    # Complete task at 100%
    ghostty_progress 1 100
    sleep 1
    
    echo "Task completed!"
    
    # Clear the progress bar
    ghostty_progress_clear
end

# Run the example
example_task
```

## Requirements

- [Fish Shell](https://fishshell.com/) 3.0 or later
- [Ghostty](https://ghostty.org/) 1.2.0 or later

## License

MIT
