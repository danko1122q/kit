# Kit Configuration and Customization Documentation

**Language:** English | **Language:** [Indonesia](CONFIGURATION.ID.md)

---

This document explains how to configure kit's appearance (themes, styles, and other components) using command line, environment variables, and permanent settings through configuration files.

## Settings Priority Hierarchy

Kit reads visual settings from various sources and follows the following priority hierarchy, from highest to lowest:

1. **Command Line Flags** - Settings provided directly when running commands (example: `kit --theme=Nord file.txt`)
2. **Environment Variables** - System environment variables (example: `$KIT_THEME`)
3. **Configuration File** - Settings in the configuration file (example: `default_theme` in `config.toml`)
4. **Default Values** - Default values embedded in the application

## Setting Themes and Styles Permanently

The most reliable method to set themes and styles permanently is through the configuration file.

### Configuration File Location

Kit searches for the configuration file in the following standard locations. This location can be overridden using the `$KIT_CONFIG_PATH` environment variable.

| Operating System | Default Location |
|------------------|------------------|
| Linux / macOS | `~/.config/kit/config.toml` |
| Windows | `C:\Users\Username\AppData\Roaming\kit\config.toml` |

### How to Create a Configuration File

You can generate a default configuration file and find out its exact location with the following command:

```bash
kit --generate-config-file
```

### Example of Permanent Theme Settings

Open the `config.toml` file (or `config` if using the old format) and add the desired settings.

```toml
# File: ~/.config/kit/config.toml

# Set default theme for all files
default_theme = "Catppuccin Frappe"

# Set default output style components
# Available components: numbers, changes, header, plain, grid, snip
style = "numbers,changes,header,grid"

# Set paging behavior (always, auto, never)
paging = "auto"

# Set output to always be colored even when piped
colored_output = true
```

## Setting Themes via Environment Variables

Setting through environment variables is useful for overriding permanent settings in `config.toml` for specific shell sessions, or if you want system-wide settings.

Add variables to your shell startup file such as `.bashrc`, `.zshrc`, or `.profile`.

### Example Configuration in Bash/Zsh

```bash
# Open shell configuration file
nano ~/.zshrc

# Add the following lines at the end of the file:
export KIT_THEME="Nord"
export KIT_STYLE="numbers,header,changes"
export KIT_PAGER="less -R"

# Reload shell configuration
source ~/.zshrc
```

### List of Environment Variables

| Environment Variable | Description |
|---------------------|-------------|
| `KIT_THEME` | Default syntax highlighting color theme |
| `KIT_STYLE` | Default output style components (e.g., `numbers,grid`) |
| `KIT_PAGER` | Pager command for large files (e.g., `less -R`) |

## One-Time Theme Settings (Command Line)

To test themes or apply different themes for a single execution only.

### Theme Testing

```bash
# Display file with Dracula theme for this command only
kit --theme="Dracula" file.rs

# Display list of all available themes
kit --list-themes
```

### Style Testing

```bash
# Display file without line numbers or header (plain content only)
kit --style=plain file.log

# Display with line numbers and grid
kit --style=numbers,grid file.md
```

## Available Style Components

Here are the style components that can be configured:

- **numbers** - Display line numbers
- **changes** - Display change indicators (for git diff)
- **header** - Display file header
- **plain** - Simple display mode without decorations
- **grid** - Display grid separator lines
- **snip** - Display indicators for truncated sections

## Paging Options

Kit supports three paging modes:

- **always** - Always use pager for output
- **auto** - Use pager automatically for large files
- **never** - Never use pager

---

## 📄 Additional Guide: Dynamic Theme Settings Via `.bashrc` (Multi-System)

Here is a step-by-step guide to set up and test themes dynamically using shell startup files (such as `.bashrc` or `.zshrc`) on Linux and macOS.

### 📝 Testing Themes Dynamically with `KIT_THEME`

This method allows you to switch themes quickly by simply changing the environment variable (`KIT_THEME`) and running `kit` without touching the main configuration file (`config.toml`).

#### 1. Set Permanent Default Theme (Bash/Zsh)

Add the `KIT_THEME` environment variable to your shell startup file.

| Operating System | Shell File | Open Command |
|------------------|------------|--------------|
| Linux/macOS | `~/.bashrc` or `~/.zshrc` | `nano ~/.bashrc` |

Add this line (replace `"TwoDark"` with your preferred default theme):

```bash
# Set default KIT theme. Will be read every time terminal is opened.
export KIT_THEME="TwoDark"
```

Reload shell: `source ~/.bashrc` (or `.zshrc`).

#### 2. Sequential Theme Testing (Verify Functionality)

Once set up, you can change themes live by simply modifying the `KIT_THEME` variable before running `kit`.

```bash
# Test Theme 1: Dracula
export KIT_THEME="Dracula"
kit [file_name_to_test]

# Test Theme 2: Solarized (light)
export KIT_THEME="Solarized (light)"
kit [file_name_to_test]

# Test Theme 3: Nord
export KIT_THEME="Nord"
kit [file_name_to_test]

# Note: After this, the permanent theme you set in .bashrc will apply again
# when you open a new terminal. For the current session, use:
unset KIT_THEME
source ~/.bashrc
```

---

## 🔧 Guide to Installing and Removing `kit` Binary (Multi-System)

This guide explains how to install and remove the `kit` binary (executable program) after building or installing to the system path. This is important to ensure subsequent rebuilds are clean.

### Installing `kit` Binary to System

There are several ways to install `kit` to your system:

#### Method 1: Installation via Cargo Install (From Local Path)

If you already have the `kit` source code on your computer and want to install it:

```bash
# Make sure you are in the kit project root directory
cd /path/to/kit

# Build (optional, to ensure success first)
cargo build --release

# Install binary globally from current path
cargo install --path .
```

**Note:** The `cargo install --path .` command will:
- Automatically perform a release build
- Copy the binary to `~/.cargo/bin/` (Linux/macOS) or `%USERPROFILE%\.cargo\bin\` (Windows)
- Make `kit` accessible from anywhere in the terminal (if PATH is configured)

#### Method 2: Manual Copy to System Path

If you want to install manually after building:

```bash
# Build release
cargo build --release

# Copy to system path (choose one)
# For local user (no sudo needed):
cp target/release/kit ~/.local/bin/

# For system-wide (requires sudo):
sudo cp target/release/kit /usr/local/bin/
```

**Windows:**
```powershell
# Build release
cargo build --release

# Manual copy (run as Administrator if necessary)
copy target\release\kit.exe C:\Windows\System32\
```

#### Verify Installation

After installation, verify that `kit` is installed correctly:

```bash
# Check version
kit --version

# Check binary location
which kit  # Linux/macOS
where kit  # Windows
```

### Removing `kit` Binary from System

If you installed `kit` using `cargo install` or copied it manually to a system path directory (such as `/usr/local/bin` or `~/.local/bin`), you must remove it to clean the system or before rebuilding.

#### 1. Find Binary Location

Use the `which` command to find the exact location of the `kit` file being used by the system.

```bash
which kit
```

#### 2. Removal via Cargo Uninstall (Recommended Method)

If you installed `kit` using `cargo install`, the easiest and safest way to remove it is:

```bash
cargo uninstall kit
```

**Note:** This command will:
- Remove the `kit` binary from `~/.cargo/bin/`
- Clean up related cache and metadata
- Work on all platforms (Linux, macOS, Windows)

#### 3. Manual Removal by Operating System

| Operating System | Common Binary Location | Removal Command | Notes |
|------------------|------------------------|-----------------|-------|
| Linux/macOS (Manual/Local Installation) | `~/.local/bin/kit` | `rm ~/.local/bin/kit` | Most common location if manually installed to local path. |
| Linux/macOS (System Installation) | `/usr/local/bin/kit` | `sudo rm /usr/local/bin/kit` | Requires superuser permission (`sudo`). Only do this if you're sure. |
| Linux/macOS (`cargo` Installation) | `~/.cargo/bin/kit` | `cargo uninstall kit` | Recommended method if you installed using `cargo install`. |
| Windows | `%USERPROFILE%\.cargo\bin\kit.exe` (if using `cargo install`) | Open Command Prompt/PowerShell and run: `cargo uninstall kit` | Alternative: Delete `kit.exe` file manually in File Explorer. |

#### 4. Verify Removal

After removal, verify that the binary is no longer in the path:

```bash
which kit
```

**Expected Output:** No output, indicating the binary has been successfully removed from the system path.

### Troubleshooting

#### Binary Still Found After Uninstall

If `which kit` still shows a binary location after `cargo uninstall`, there may be multiple `kit` installations:

```bash
# Find all kit locations
which -a kit  # Linux/macOS
where /r C:\ kit.exe  # Windows

# Remove one by one manually
```

#### Permission Denied When Removing

If you get a permission denied error:

```bash
# Use sudo (Linux/macOS)
sudo rm /usr/local/bin/kit

# Or change file permission first
sudo chmod +w /usr/local/bin/kit
rm /usr/local/bin/kit
```

#### Rebuild After Uninstall

After removing the old installation, to build and install a new version:

```bash
# Clean old build cache
cargo clean

# Rebuild and install
cargo build --release
cargo install --path .

# Or directly install (will build automatically)
cargo install --path .
```

---

*This documentation covers all aspects of Kit configuration and customization. For more information, run `kit --help`*