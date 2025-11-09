# Dokumentasi Konfigurasi dan Kustomisasi Kit

**Language:** [English](CONFIGURATION.EN.md) | **Language:** Indonesia

**Dokumentasi:**
---

Dokumen ini menjelaskan cara mengatur tampilan kit (tema, gaya, dan komponen lainnya) menggunakan command line, variabel lingkungan, serta pengaturan permanen melalui file konfigurasi.

## Hierarki Prioritas Pengaturan

Kit membaca pengaturan visual dari berbagai sumber dan mengikuti hierarki prioritas berikut, dari yang tertinggi ke terendah:

1. **Command Line Flags** - Pengaturan yang diberikan langsung saat menjalankan perintah (contoh: `kit --theme=Nord file.txt`)
2. **Environment Variables** - Variabel lingkungan sistem (contoh: `$KIT_THEME`)
3. **Configuration File** - Pengaturan dalam file konfigurasi (contoh: `default_theme` di `config.toml`)
4. **Default Values** - Nilai bawaan yang sudah tertanam dalam aplikasi

## Mengatur Tema dan Gaya Secara Permanen

Metode paling handal untuk mengatur tema dan gaya secara permanen adalah melalui file konfigurasi.

### Lokasi File Konfigurasi

Kit mencari file konfigurasi di lokasi standar berikut. Lokasi ini dapat diganti menggunakan variabel lingkungan `$KIT_CONFIG_PATH`.

| Sistem Operasi | Lokasi Default |
|----------------|----------------|
| Linux / macOS | `~/.config/kit/config.toml` |
| Windows | `C:\Users\Username\AppData\Roaming\kit\config.toml` |

### Cara Membuat File Konfigurasi

Anda dapat menghasilkan file konfigurasi default dan mengetahui lokasi pastinya dengan perintah berikut:

```bash
kit --generate-config-file
```

### Contoh Pengaturan Tema Permanen

Buka file `config.toml` (atau `config` jika menggunakan format lama) dan tambahkan pengaturan yang diinginkan.

```toml
# File: ~/.config/kit/config.toml

# Mengatur tema default untuk semua file
default_theme = "Catppuccin Frappe"

# Mengatur komponen gaya output secara default
# Komponen tersedia: numbers, changes, header, plain, grid, snip
style = "numbers,changes,header,grid"

# Atur perilaku paging (always, auto, never)
paging = "auto"

# Atur agar output selalu berwarna meskipun tidak dipipe
colored_output = true
```

## Mengatur Tema Melalui Variabel Lingkungan

Pengaturan melalui variabel lingkungan berguna untuk mengganti pengaturan permanen di `config.toml` untuk sesi shell tertentu, atau jika Anda menginginkan pengaturan yang berlaku di seluruh sistem.

Tambahkan variabel ke startup file shell Anda seperti `.bashrc`, `.zshrc`, atau `.profile`.

### Contoh Konfigurasi di Bash/Zsh

```bash
# Buka file konfigurasi shell
nano ~/.zshrc

# Tambahkan baris berikut di akhir file:
export KIT_THEME="Nord"
export KIT_STYLE="numbers,header,changes"
export KIT_PAGER="less -R"

# Muat ulang konfigurasi shell
source ~/.zshrc
```

### Daftar Variabel Lingkungan

| Variabel Lingkungan | Deskripsi |
|---------------------|-----------|
| `KIT_THEME` | Tema warna syntax highlighting default |
| `KIT_STYLE` | Komponen gaya output default (misalnya `numbers,grid`) |
| `KIT_PAGER` | Perintah pager untuk file besar (misalnya `less -R`) |

## Pengaturan Tema Sekali Pakai (Command Line)

Untuk menguji tema atau menerapkan tema berbeda hanya untuk satu kali eksekusi.

### Uji Coba Tema

```bash
# Tampilkan file dengan tema Dracula hanya untuk perintah ini
kit --theme="Dracula" file.rs

# Tampilkan daftar semua tema yang tersedia
kit --list-themes
```

### Uji Coba Gaya

```bash
# Tampilkan file tanpa nomor baris atau header (hanya konten plain)
kit --style=plain file.log

# Tampilkan dengan nomor baris dan grid
kit --style=numbers,grid file.md
```

## Komponen Gaya yang Tersedia

Berikut adalah komponen gaya yang dapat dikonfigurasi:

- **numbers** - Menampilkan nomor baris
- **changes** - Menampilkan indikator perubahan (untuk git diff)
- **header** - Menampilkan header file
- **plain** - Mode tampilan sederhana tanpa dekorasi
- **grid** - Menampilkan garis pemisah grid
- **snip** - Menampilkan indikator untuk bagian yang dipotong

## Opsi Paging

Kit mendukung tiga mode paging:

- **always** - Selalu gunakan pager untuk output
- **auto** - Gunakan pager secara otomatis untuk file besar
- **never** - Jangan pernah gunakan pager

---

*Dokumentasi ini mencakup semua aspek konfigurasi dan kustomisasi Kit. Untuk informasi lebih lanjut, jalankan `kit --help`*
