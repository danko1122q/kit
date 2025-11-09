# Kit - Versatile CLI File Utility

Kit is a command-line utility inspired by `cat` and `less`, enhanced with modern features such as advanced syntax highlighting, Git integration, and file management capabilities (file and directory creation). Kit is designed to make your file viewing experience in the terminal more efficient and enjoyable.

---


### 📖 Configuration Guides:
* **[English](CONFIGURATION.EN.md)**
* **[Indonesia](CONFIGURATION.ID.md)**


---
## 💡 Key Features

### 🐄 Modern File Viewing

* **Syntax Highlighting**: Highlight files for over 200 programming and markup languages.
* **Git Integration**: Display Git modification status (added, modified, removed) in the sidebar.
* **Automatic Paging**: Smartly pipes output to a pager (like `less`) for large files, configurable with `--paging`.
* **Scrolling & Navigation**:

  * Line-by-line: `j` / `k` or arrow keys
  * Page up / down: `Ctrl + b` / `Ctrl + f`
  * Go to start/end of file: `g` / `G`
  * Search: `/` followed by query
  * Exit: `q`

### 🔨 CLI File Management

* **File Creation**: `-c` / `--create` flag to create new files.
* **Directory Creation**: `--mk` / `--mkdir` flags to create directories recursively.
* **Editing (Planned Feature)**: `-e` / `--edit` flag to open a file in the embedded editor and create if it doesn't exist. *(Currently not implemented; future integration planned with Lex or Rust-based editor)*

### 🎨 Output Customization

* **Themes**: Apply color themes using `--theme` or environment variables.
* **Styles**: Customize output with `--style` (numbers, changes, header, plain, grid, snip).
* **Tabs**: Control tab width with `--tabs`.
* **Non-printable Characters**: Show hidden characters with `-A`.

### 🔗 Integration with Other Tools

* **fzf Preview**: `fzf --preview "kit --color=always --style=numbers --line-range=:500 {}"`
* **Find / fd**: `find ... -exec kit {} +` or `fd ... -X kit`
* **Ripgrep / kitgrep**: `kitgrep <pattern> <directory>`
* **Tail**: `tail -f file.log | kit --paging=never -l log`
* **Git Show**: `git show <commit>:<file> | kit -l <lang>`
* **Clipboard**: `kit -p file | xclip` for plain content copying.
* **Man Pages**: Colorize `man` output using `MANPAGER` and `kit -p -lman`.
* **Help Pages**: `alias kithelp='kit --plain --language=help'` and wrappers for `--help` commands.

> ⚠️ Note: `--diff` functionality is not currently included in Kit; planned for future release.

---

## 💻 Usage

### Viewing Files

```bash
kit README.md               # View a single file
kit src/*.rs                # View multiple files
curl -s example.com | kit    # View piped input
kit -A /etc/hosts           # Show non-printable characters
kit -n file.txt             # Show line numbers
kit --language=python file.py # Force syntax highlighting
kit --theme=TwoDark file.md  # Apply a specific theme
kit --paging=never file.log # Disable pager
kit --style=plain file.md   # Plain output, no headers or line numbers
kit --list-languages        # List all supported languages
kit --list-themes           # List available themes
```

### Creating Files and Directories

```bash
kit -c test.txt                     # Create a new file
kit -c file1.txt file2.md           # Create multiple files
kit --mk path/to/nested/directory   # Create directories recursively
kit edit file.txt                    # Open editor and create if not exists (planned)
```

### Integration Examples

```bash
# fzf preview
fzf --preview "kit --color=always --style=numbers --line-range=:500 {}"

# Find / fd integration
find . -type f -exec kit {} +
fd . -X kit

# Ripgrep / kitgrep
kitgrep pattern src/

# Tail logs with syntax highlighting
tail -f /var/log/syslog | kit --paging=never -l log

# Git show
git show HEAD:src/main.rs | kit -l rs

# Clipboard copy
kit file.txt -p | xclip

# Man pages
export MANPAGER="sh -c 'awk '{ gsub(/\x1B\[[0-9;]*m/, "", $0); gsub(/.\x08/, "", $0); print }' | kit -p -lman'"
man 2 select

# Help pages
alias kithelp='kit --plain --language=help'
help() {
  "$@" --help 2>&1 | kithelp
}
```

---

## 🔧 Persistent Configuration

Configuration file: `~/.config/kit/config.toml`

Example:

```toml
default_theme = "Catppuccin Frappe"
style = "plain"
colored_output = true
paging_mode = "never"
```

Environment variables:

| Variable        | Description                    |
| --------------- | ------------------------------ |
| KIT_THEME       | Default color theme            |
| KIT_STYLE       | Default style components       |
| KIT_PAGER       | Pager command                  |
| KIT_PAGING      | Paging behavior (always, auto) |
| KIT_TABSM       | Tab width                      |
| KIT_CONFIG_PATH | Configuration file location    |
| KIT_CACHE_PATH  | Cache directory location       |

---

## 📦 Building from Source

```bash
git clone https://github.com/danko1122q/kit
cd kit
cargo build            # Debug build
cargo build --release  # Optimized release build
./target/release/kit   # Binary location
```

---

## 🗑️ License and Copyright

Kit is dual-licensed under MIT OR Apache-2.0.

* Original Code (kit): Copyright (c) 2018-2023 kit-developers [https://github.com/sharkdp/kit](https://github.com/sharkdp/kit)
* Kit Modifications & Contributions: Copyright (c) 2025 danko112q [https://github.com/danko1122q/kit](https://github.com/danko1122q/kit)

