# Kit Changelog

---

## [1.0.0] - 2025-01-04

### 🚀 Initial Stable Release

The first stable release of Kit, a versatile, fast, and customizable CLI utility.
**Author:** danko1122q

### ✨ Added (New Features)

* **Syntax Highlighting:**
* **File Viewing & Paging:**

  * File display with line numbering and Git integration in the sidebar.
  * Automatic paging for large files with customizable pager support.
* **File Management:**

  * File creation using the `-c` / `--create` flag (similar to `touch`).
  * Recursive directory creation using the `--mkdir` flag (similar to `mkdir -p`).
* **Git Integration:** Shows file modifications and changes directly in the sidebar.
* **Customization & Configuration:**

  * Full support for configuration files.
  * Custom syntax mappings for specific file patterns.
  * Ready-to-use color themes for various terminal backgrounds.

### ⚙️ Configuration & Environment

* Default directories:

  * Configuration: `~/.config/kit`
  * Cache: `~/.cache/kit`
* Environment variables:

  * `KIT_THEME`, `KIT_STYLE`, `KIT_PAGER`, `KIT_PAGING`, `KIT_TABS`
  * `KIT_CONFIG_PATH`, `KIT_CACHE_PATH` for custom file locations

### 📦 Technical Details

* Language: Rust (Edition 2021)
* Minimum Rust Version: 1.70
* License: MIT OR Apache-2.0
* Copyright: © 2025 danko1122q. All rights reserved.
