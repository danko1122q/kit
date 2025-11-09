# Kit Configuration and Customization Documentation

**Language:** English |  **Language:** [Indonesia](CONFIGURATION.ID.md)

**Documentation:**
---

This document explains how to configure kit's appearance (themes, styles, and other components) using command line, environment variables, and permanent settings through configuration files.

## Configuration Priority Hierarchy

Kit reads visual settings from various sources and follows this priority hierarchy, from highest to lowest:

1. **Command Line Flags** - Settings provided directly when running commands (example: `kit --theme=Nord file.txt`)
2. **Environment Variables** - System environment variables (example: `$KIT_THEME`)
3. **Configuration File** - Settings in configuration file (example: `default_theme` in `config.toml`)
4. **Default Values** - Built-in default values in the application

## Setting Themes and Styles Permanently

The most reliable method for setting themes and styles permanently is through the configuration file.

### Configuration File Location

Kit searches for configuration files in the following standard locations. This location can be overridden using the `$KIT_CONFIG_PATH` environment variable.

| Operating System | Default Location |
|------------------|------------------|
| Linux / macOS | `~/.config/kit/config.toml` |
| Windows | `C:\Users\Username\AppData\Roaming\kit\config.toml` |

### How to Create Configuration File

You can generate a default configuration file and find its exact location with the following command:

```bash
kit --generate-config-file
```

### Permanent Theme Configuration Example

Open the `config.toml` file (or `config` if using the older format) and add your desired settings.

```toml
# File: ~/.config/kit/config.toml

# Set default theme for all files
default_theme = "Catppuccin Frappe"

# Set default output style components
# Available components: numbers, changes, header, plain, grid, snip
style = "numbers,changes,header,grid"

# Set paging behavior (always, auto, never)
paging = "auto"

# Set output to always be colored even when not piped
colored_output = true
```

## Setting Themes via Environment Variables

Setting through environment variables is useful for overriding permanent settings in `config.toml` for specific shell sessions, or if you want system-wide settings.

Add variables to your shell startup file such as `.bashrc`, `.zshrc`, or `.profile`.

### Bash/Zsh Configuration Example

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

### Environment Variables List

| Environment Variable | Description |
|---------------------|-------------|
| `KIT_THEME` | Default syntax highlighting color theme |
| `KIT_STYLE` | Default output style components (e.g., `numbers,grid`) |
| `KIT_PAGER` | Pager command for large files (e.g., `less -R`) |

## One-time Theme Settings (Command Line)

For testing themes or applying different themes for a single execution only.

### Testing Themes

```bash
# Display file with Dracula theme for this command only
kit --theme="Dracula" file.rs

# Display list of all available themes
kit --list-themes
```

### Testing Styles

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
- **auto** - Automatically use pager for large files
- **never** - Never use pager

---

*This documentation covers all aspects of Kit configuration and customization. For more information, run `kit --help`*
