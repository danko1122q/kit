# Daftar Tema Kit

**Language:** [English](THEMES.EN.md) | **Language:** Indonesia

---

Dokumen ini berisi daftar lengkap tema syntax highlighting yang tersedia di Kit. Kit mewarisi tema-tema dari bat CLI dan menyediakan berbagai pilihan tema untuk berbagai preferensi visual.

## Cara Melihat Daftar Tema

Untuk melihat semua tema yang tersedia di sistem Anda beserta contoh tampilannya:

```bash
kit --list-themes
```

## Tema Default yang Tersedia

Berikut adalah daftar tema yang umumnya tersedia di Kit (berdasarkan instalasi standar bat):

### Tema Dark (Gelap)

| Nama Tema | Deskripsi | Cocok Untuk |
|-----------|-----------|-------------|
| **TwoDark** | Tema gelap modern dengan kontras sedang | Penggunaan sehari-hari, cocok untuk berbagai bahasa pemrograman |
| **Monokai Extended** | Tema gelap populer dengan warna-warna vibrant | Developer yang menyukai warna cerah dan kontras tinggi |
| **Dracula** | Tema gelap dengan palet warna ungu dan pink | Tampilan modern dan eye-friendly untuk sesi coding lama |
| **Nord** | Tema gelap dengan palet warna biru-abu dingin | Tampilan minimalis dan sejuk, cocok untuk fokus jangka panjang |
| **Gruvbox-dark** | Tema gelap dengan warna hangat dan retro | Nuansa vintage dengan kontras lembut |
| **Solarized (dark)** | Tema gelap klasik dengan palet warna yang dipilih secara ilmiah | Mengurangi ketegangan mata, populer di kalangan developer |
| **OneHalfDark** | Tema gelap seimbang dengan garis grid yang jelas | Keterbacaan tinggi dengan dekorasi yang terlihat jelas |
| **ansi** | Tema sederhana menggunakan warna ANSI terminal default | Kompatibilitas maksimal dengan berbagai terminal |
| **base16** | Tema gelap dengan 16 warna dasar | Konsistensi warna yang baik |
| **Coldark-Dark** | Tema gelap dengan palet warna biru dingin | Tampilan profesional dan modern |
| **DarkNeon** | Tema gelap dengan warna neon yang mencolok | Tampilan futuristik dan eye-catching |
| **Material-Theme** | Tema gelap berdasarkan Material Design | Desain modern mengikuti prinsip Material Design |
| **zenburn** | Tema gelap dengan kontras rendah dan warna lembut | Cocok untuk penggunaan jangka panjang, mengurangi kelelahan mata |

### Tema Light (Terang)

| Nama Tema | Deskripsi | Cocok Untuk |
|-----------|-----------|-------------|
| **GitHub** | Tema terang yang menyerupai tampilan GitHub | Familiar bagi pengguna GitHub, cocok untuk dokumentasi |
| **Solarized (light)** | Tema terang klasik dengan palet warna yang dipilih secara ilmiah | Mengurangi ketegangan mata di lingkungan terang |
| **OneHalfLight** | Tema terang seimbang dengan garis grid yang jelas | Keterbacaan tinggi untuk lingkungan dengan pencahayaan baik |
| **Coldark-Cold** | Tema terang dengan palet warna biru sejuk | Tampilan bersih dan profesional |
| **ansi-light** | Tema terang menggunakan warna ANSI | Kompatibilitas dengan berbagai terminal |
| **Catppuccin Latte** | Tema terang dengan warna pastel lembut | Tampilan modern dengan warna yang nyaman di mata |

### Tema Khusus

| Nama Tema | Deskripsi | Cocok Untuk |
|-----------|-----------|-------------|
| **Catppuccin Frappe** | Tema dark dengan warna pastel lembut (varian Frappe) | Coding malam hari dengan warna yang tidak terlalu terang |
| **Catppuccin Macchiato** | Tema dark dengan warna pastel lembut (varian Macchiato) | Middle-ground antara dark dan dark-vibrant |
| **Catppuccin Mocha** | Tema dark dengan warna pastel lembut (varian Mocha) | Paling gelap dari seri Catppuccin |
| **Visual Studio Dark+** | Tema yang menyerupai Visual Studio Code dark theme | Familiar bagi pengguna VS Code |

## Cara Menggunakan Tema

### 1. Penggunaan Sekali Pakai (Command Line)

```bash
# Menampilkan file dengan tema Dracula
kit --theme="Dracula" file.rs

# Menampilkan file dengan tema Nord
kit --theme="Nord" script.py
```

### 2. Pengaturan Permanen via File Konfigurasi

Edit file `~/.config/kit/config.toml`:

```toml
# Set tema default
default_theme = "Nord"
```

### 3. Pengaturan via Environment Variable

Tambahkan ke `~/.bashrc` atau `~/.zshrc`:

```bash
# Set tema default Kit
export KIT_THEME="Dracula"
```

## Menambahkan Tema Kustom

Jika Anda ingin menambahkan tema kustom (format `.tmTheme` dari Sublime Text):

### 1. Buat Direktori Tema

```bash
mkdir -p "$(kit --config-dir)/themes"
cd "$(kit --config-dir)/themes"
```

### 2. Download Tema

```bash
# Contoh: Download tema Snazzy
git clone https://github.com/greggb/sublime-snazzy
```

### 3. Update Cache

```bash
kit cache --build
```

### 4. Verifikasi

```bash
kit --list-themes
```

## Rekomendasi Tema Berdasarkan Penggunaan

### Untuk Coding Sehari-hari
- **TwoDark** - Balanced dan tidak melelahkan mata
- **Nord** - Minimalis dan fokus
- **Dracula** - Modern dan vibrant

### Untuk Presentasi/Screenshot
- **Monokai Extended** - Warna cerah dan kontras tinggi
- **DarkNeon** - Eye-catching dan futuristik
- **GitHub** - Familiar dan profesional (light)

### Untuk Sesi Coding Panjang
- **zenburn** - Kontras rendah, mengurangi kelelahan
- **Solarized (dark/light)** - Dirancang khusus untuk mengurangi ketegangan mata
- **Catppuccin Mocha** - Warna pastel yang nyaman

### Untuk Lingkungan Terang
- **Solarized (light)** - Klasik dan scientifically designed
- **GitHub** - Clean dan familiar
- **OneHalfLight** - Keterbacaan tinggi

## Tips Memilih Tema

1. **Pertimbangkan Pencahayaan** - Gunakan tema dark untuk ruangan gelap, light untuk ruangan terang
2. **Kontras** - Pilih kontras yang sesuai dengan preferensi Anda (tinggi untuk visual yang jelas, rendah untuk kenyamanan mata)
3. **Konsistensi** - Gunakan tema yang sama dengan editor dan terminal Anda untuk pengalaman yang konsisten
4. **Uji Coba** - Gunakan `kit --list-themes` untuk melihat preview semua tema dan memilih yang paling cocok

## Tema Populer di Komunitas

Berdasarkan popularitas di komunitas developer:

1. **Dracula** - Sangat populer di berbagai aplikasi
2. **Nord** - Favorit untuk tampilan minimalis
3. **Solarized** - Klasik dan terbukti mengurangi ketegangan mata
4. **Monokai** - Standar di banyak editor
5. **Gruvbox** - Favorit untuk tampilan retro-modern
6. **Catppuccin** - Tema baru yang cepat populer dengan palet pastel

---

*Untuk informasi lebih lanjut tentang konfigurasi tema, lihat [CONFIGURATION.md](CONFIGURATION.md)*