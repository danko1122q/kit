# Kit Themes List

**Language:** English | **Language:** [Indonesia](THEMES.ID.md)

---

This document contains a complete list of syntax highlighting themes available in Kit. Kit inherits themes from bat CLI and provides various theme options for different visual preferences.

## How to View Theme List

To see all available themes on your system along with their previews:

```bash
kit --list-themes
```

## Available Default Themes

Here is a list of themes commonly available in Kit (based on standard bat installation):

### Dark Themes

| Theme Name | Description | Best For |
|------------|-------------|----------|
| **TwoDark** | Modern dark theme with medium contrast | Daily use, suitable for various programming languages |
| **Monokai Extended** | Popular dark theme with vibrant colors | Developers who like bright colors and high contrast |
| **Dracula** | Dark theme with purple and pink color palette | Modern and eye-friendly appearance for long coding sessions |
| **Nord** | Dark theme with cool blue-gray color palette | Minimalist and cool appearance, suitable for long-term focus |
| **Gruvbox-dark** | Dark theme with warm and retro colors | Vintage feel with soft contrast |
| **Solarized (dark)** | Classic dark theme with scientifically chosen color palette | Reduces eye strain, popular among developers |
| **OneHalfDark** | Balanced dark theme with clear grid lines | High readability with clearly visible decorations |
| **ansi** | Simple theme using default terminal ANSI colors | Maximum compatibility with various terminals |
| **base16** | Dark theme with 16 base colors | Good color consistency |
| **Coldark-Dark** | Dark theme with cool blue color palette | Professional and modern appearance |
| **DarkNeon** | Dark theme with striking neon colors | Futuristic and eye-catching appearance |
| **Material-Theme** | Dark theme based on Material Design | Modern design following Material Design principles |
| **zenburn** | Dark theme with low contrast and soft colors | Suitable for long-term use, reduces eye fatigue |

### Light Themes

| Theme Name | Description | Best For |
|------------|-------------|----------|
| **GitHub** | Light theme resembling GitHub's appearance | Familiar to GitHub users, suitable for documentation |
| **Solarized (light)** | Classic light theme with scientifically chosen color palette | Reduces eye strain in bright environments |
| **OneHalfLight** | Balanced light theme with clear grid lines | High readability for well-lit environments |
| **Coldark-Cold** | Light theme with cool blue color palette | Clean and professional appearance |
| **ansi-light** | Light theme using ANSI colors | Compatible with various terminals |
| **Catppuccin Latte** | Light theme with soft pastel colors | Modern appearance with eye-comfortable colors |

### Special Themes

| Theme Name | Description | Best For |
|------------|-------------|----------|
| **Catppuccin Frappe** | Dark theme with soft pastel colors (Frappe variant) | Night coding with colors that aren't too bright |
| **Catppuccin Macchiato** | Dark theme with soft pastel colors (Macchiato variant) | Middle-ground between dark and dark-vibrant |
| **Catppuccin Mocha** | Dark theme with soft pastel colors (Mocha variant) | Darkest of the Catppuccin series |
| **Visual Studio Dark+** | Theme resembling Visual Studio Code dark theme | Familiar to VS Code users |

## How to Use Themes

### 1. One-Time Use (Command Line)

```bash
# Display file with Dracula theme
kit --theme="Dracula" file.rs

# Display file with Nord theme
kit --theme="Nord" script.py
```

### 2. Permanent Setting via Configuration File

Edit `~/.config/kit/config.toml`:

```toml
# Set default theme
default_theme = "Nord"
```

### 3. Setting via Environment Variable

Add to `~/.bashrc` or `~/.zshrc`:

```bash
# Set default Kit theme
export KIT_THEME="Dracula"
```

## Adding Custom Themes

If you want to add custom themes (`.tmTheme` format from Sublime Text):

### 1. Create Theme Directory

```bash
mkdir -p "$(kit --config-dir)/themes"
cd "$(kit --config-dir)/themes"
```

### 2. Download Theme

```bash
# Example: Download Snazzy theme
git clone https://github.com/greggb/sublime-snazzy
```

### 3. Update Cache

```bash
kit cache --build
```

### 4. Verify

```bash
kit --list-themes
```

## Theme Recommendations by Use Case

### For Daily Coding
- **TwoDark** - Balanced and doesn't tire the eyes
- **Nord** - Minimalist and focused
- **Dracula** - Modern and vibrant

### For Presentations/Screenshots
- **Monokai Extended** - Bright colors and high contrast
- **DarkNeon** - Eye-catching and futuristic
- **GitHub** - Familiar and professional (light)

### For Long Coding Sessions
- **zenburn** - Low contrast, reduces fatigue
- **Solarized (dark/light)** - Specifically designed to reduce eye strain
- **Catppuccin Mocha** - Comfortable pastel colors

### For Bright Environments
- **Solarized (light)** - Classic and scientifically designed
- **GitHub** - Clean and familiar
- **OneHalfLight** - High readability

## Tips for Choosing Themes

1. **Consider Lighting** - Use dark themes for dark rooms, light themes for bright rooms
2. **Contrast** - Choose contrast that suits your preferences (high for clear visuals, low for eye comfort)
3. **Consistency** - Use the same theme with your editor and terminal for a consistent experience
4. **Try Them Out** - Use `kit --list-themes` to preview all themes and choose the most suitable one

## Popular Themes in the Community

Based on popularity in the developer community:

1. **Dracula** - Very popular across various applications
2. **Nord** - Favorite for minimalist appearance
3. **Solarized** - Classic and proven to reduce eye strain
4. **Monokai** - Standard in many editors
5. **Gruvbox** - Favorite for retro-modern appearance
6. **Catppuccin** - New theme that quickly became popular with pastel palette

---

*For more information about theme configuration, see [CONFIGURATION.EN.md](CONFIGURATION.EN.md)*