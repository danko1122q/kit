Kit - Versatile CLI File Utility

Kit is a command-line utility inspired by cat and less, enhanced with modern features such as advanced syntax highlighting, Git integration, and file management capabilities (file and directory creation). Kit is designed to make your file viewing experience in the terminal more efficient and enjoyable.

💡 Key Features

📄 Modern File Viewing

* Syntax Highlighting: Beautifully highlight files for over 200 programming and markup languages.
* Git Integration: Intuitively display Git modification status (modified, added) in the sidebar while viewing files.
* Automatic Paging: Smartly uses a pager (like less) for easy navigation through large files, with support for customizable pagers.

🔨 CLI File Management

* File Creation: Quickly create new files using the -c or --create flag.
* Directory Creation: Create directories (including nested ones) recursively using --mk or --mkdir flags (similar to mkdir -p).

💻 Usage

1. Viewing Files
   | Command | Description |
   |---------|-------------|
   | kit README.md | View a single file. |
   | kit src/*.rs | View multiple files at once. |
   | `curl -s example.com | kit` | View input from a pipe or URL. |

2. Creating Files and Directories
   | Command | Description |
   |---------|-------------|
   | kit -c test.txt | Create a single new file. |
   | kit -c file1.txt file2.md | Create multiple new files. |
   | kit --mk path/to/nested/directory | Create nested directories recursively (--mk or --mkdir). |

3. Viewing Options & Quick Customization
   | Option | Description |
   |--------|-------------|
   | kit --list-languages | Print all supported languages. |
   | kit --list-themes | Print all available color themes. |
   | kit -n file.txt | Show line numbers. |
   | kit --theme=TwoDark file.rs | Apply a specific theme to output. |
   | kit -A file.txt | Show all non-printable characters. |

⚙️ Persistent Configuration
Kit can be configured via a configuration file located at ~/.config/kit/config and through environment variables.

| Environment Variable | Description                                                  |
| -------------------- | ------------------------------------------------------------ |
| KIT_THEME            | Set the default color theme.                                 |
| KIT_STYLE            | Control default style components (e.g., lines, Git, header). |
| KIT_PAGER            | Set the external pager command to use.                       |
| KIT_PAGING           | Control paging behavior (always or automatic).               |
| KIT_TABSM            | Set tab width.                                               |
| KIT_CONFIG_PATH      | Change the configuration file location.                      |
| KIT_CACHE_PATH       | Change the cache directory location.                         |

📦 Building from Source
Kit is built using Rust. Ensure you have the Rust Toolchain (MSRV 1.70 or newer) installed.

Bash

```bash
# For optimized compilation (recommended for use)
cargo build --release

# The generated binary will be located at:
./target/release/kit
```

📝 License and Copyright
Kit is dual-licensed under MIT OR Apache-2.0.

* Original Code (bat): Copyright (c) 2018-2023 bat-developers ([https://github.com/sharkdp/bat](https://github.com/sharkdp/bat))
* KIT Modifications & Contributions: Copyright (c) 2025 danko1122q

Repository: [https://github.com/danko1122q/kit](https://github.com/danko1122q/kit)
