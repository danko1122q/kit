# Dokumentasi Konfigurasi dan Kustomisasi Kit

**Language:** [English](CONFIGURATION.EN.md) | **Language:** Indonesia

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

## 📄 Panduan Tambahan: Pengaturan Tema Dinamis Via `.bashrc` (Multi-Sistem)

Berikut adalah panduan langkah demi langkah untuk mengatur dan menguji tema secara dinamis menggunakan file startup shell (seperti `.bashrc` atau `.zshrc`) di Linux dan macOS.

### 📝 Menguji Tema secara Dinamis dengan `KIT_THEME`

Metode ini memungkinkan Anda beralih tema dengan cepat hanya dengan mengubah variabel lingkungan (`KIT_THEME`) dan menjalankan `kit` tanpa menyentuh file konfigurasi utama (`config.toml`).

#### 1. Atur Tema Default Permanen (Bash/Zsh)

Tambahkan variabel lingkungan `KIT_THEME` ke file startup shell Anda.

| Sistem Operasi | File Shell | Perintah Pembuka |
|----------------|------------|------------------|
| Linux/macOS | `~/.bashrc` atau `~/.zshrc` | `nano ~/.bashrc` |

Tambahkan baris ini (ganti `"TwoDark"` dengan tema default pilihan Anda):

```bash
# Set tema default KIT. Akan dibaca setiap kali terminal dibuka.
export KIT_THEME="TwoDark"
```

Muat ulang shell: `source ~/.bashrc` (atau `.zshrc`).

#### 2. Uji Coba Tema Berurutan (Memverifikasi Fungsi)

Setelah diatur, Anda dapat mengubah tema secara live hanya dengan mengubah variabel `KIT_THEME` sebelum menjalankan `kit`.

```bash
# Uji Tema 1: Dracula
export KIT_THEME="Dracula"
kit [nama_file_untuk_diuji]

# Uji Tema 2: Solarized (light)
export KIT_THEME="Solarized (light)"
kit [nama_file_untuk_diuji]

# Uji Tema 3: Nord
export KIT_THEME="Nord"
kit [nama_file_untuk_diuji]

# Catatan: Setelah ini, tema permanen yang Anda set di .bashrc akan berlaku lagi
# saat Anda membuka terminal baru. Untuk sesi saat ini, gunakan:
unset KIT_THEME
source ~/.bashrc
```

---

## 🔧 Panduan Instalasi dan Penghapusan Biner `kit` (Multi-Sistem)

Panduan ini menjelaskan cara melakukan instalasi dan penghapusan biner (program yang dapat dieksekusi) `kit` setelah build atau instalasi ke system path. Ini penting untuk memastikan build ulang berikutnya bersih.

### Instalasi Biner `kit` ke Sistem

Ada beberapa cara untuk menginstal `kit` ke sistem Anda:

#### Metode 1: Instalasi via Cargo Install (Dari Path Lokal)

Jika Anda sudah memiliki source code `kit` di komputer Anda dan ingin menginstalnya:

```bash
# Pastikan Anda berada di direktori root project kit
cd /path/to/kit

# Lakukan build (opsional, untuk memastikan berhasil dulu)
cargo build --release

# Instal biner secara global dari path saat ini
cargo install --path .
```

**Catatan:** Perintah `cargo install --path .` akan:
- Melakukan build release secara otomatis
- Menyalin biner ke `~/.cargo/bin/` (Linux/macOS) atau `%USERPROFILE%\.cargo\bin\` (Windows)
- Membuat `kit` dapat diakses dari mana saja di terminal (jika PATH sudah dikonfigurasi)

#### Metode 2: Copy Manual ke System Path

Jika Anda ingin menginstal secara manual setelah build:

```bash
# Build release
cargo build --release

# Copy ke system path (pilih salah satu)
# Untuk user lokal (tidak perlu sudo):
cp target/release/kit ~/.local/bin/

# Untuk system-wide (memerlukan sudo):
sudo cp target/release/kit /usr/local/bin/
```

**Windows:**
```powershell
# Build release
cargo build --release

# Copy manual (jalankan sebagai Administrator jika perlu)
copy target\release\kit.exe C:\Windows\System32\
```

#### Verifikasi Instalasi

Setelah instalasi, verifikasi bahwa `kit` sudah terinstal dengan benar:

```bash
# Cek versi
kit --version

# Cek lokasi biner
which kit  # Linux/macOS
where kit  # Windows
```

### Menghapus Biner `kit` dari Sistem

Jika Anda menginstal `kit` menggunakan `cargo install` atau menyalinnya secara manual ke direktori system path (seperti `/usr/local/bin` atau `~/.local/bin`), Anda harus menghapusnya untuk membersihkan sistem atau sebelum melakukan build ulang.

#### 1. Temukan Lokasi Biner

Gunakan perintah `which` untuk menemukan lokasi pasti file `kit` yang sedang digunakan oleh sistem.

```bash
which kit
```

#### 2. Penghapusan via Cargo Uninstall (Metode Disarankan)

Jika Anda menginstal `kit` menggunakan `cargo install`, cara termudah dan teraman untuk menghapusnya adalah:

```bash
cargo uninstall kit
```

**Catatan:** Perintah ini akan:
- Menghapus biner `kit` dari `~/.cargo/bin/`
- Membersihkan cache dan metadata terkait
- Bekerja di semua platform (Linux, macOS, Windows)

#### 3. Penghapusan Manual Berdasarkan Sistem Operasi

| Sistem Operasi | Lokasi Biner Umum | Perintah Penghapusan | Catatan |
|----------------|-------------------|----------------------|---------|
| Linux/macOS (Instalasi Manual/Lokal) | `~/.local/bin/kit` | `rm ~/.local/bin/kit` | Lokasi yang paling umum jika diinstal secara manual ke path lokal. |
| Linux/macOS (Instalasi Sistem) | `/usr/local/bin/kit` | `sudo rm /usr/local/bin/kit` | Memerlukan izin superuser (`sudo`). Hanya lakukan ini jika Anda yakin. |
| Linux/macOS (Instalasi `cargo`) | `~/.cargo/bin/kit` | `cargo uninstall kit` | Metode yang disarankan jika Anda menginstal menggunakan `cargo install`. |
| Windows | `%USERPROFILE%\.cargo\bin\kit.exe` (jika menggunakan `cargo install`) | Buka Command Prompt/PowerShell dan jalankan: `cargo uninstall kit` | Alternatif: Hapus file `kit.exe` secara manual di File Explorer. |

#### 4. Verifikasi Penghapusan

Setelah menghapus, verifikasi bahwa biner sudah tidak ada di path:

```bash
which kit
```

**Output yang Diharapkan:** Tidak ada output, menandakan biner telah berhasil dihapus dari system path.

### Troubleshooting

#### Biner Masih Ditemukan Setelah Uninstall

Jika `which kit` masih menampilkan lokasi biner setelah `cargo uninstall`, kemungkinan ada beberapa instalasi `kit`:

```bash
# Cari semua lokasi kit
which -a kit  # Linux/macOS
where /r C:\ kit.exe  # Windows

# Hapus satu per satu secara manual
```

#### Permission Denied Saat Menghapus

Jika mendapat error permission denied:

```bash
# Gunakan sudo (Linux/macOS)
sudo rm /usr/local/bin/kit

# Atau ubah permission file terlebih dahulu
sudo chmod +w /usr/local/bin/kit
rm /usr/local/bin/kit
```

#### Build Ulang Setelah Uninstall

Setelah menghapus instalasi lama, untuk build dan install versi baru:

```bash
# Bersihkan build cache lama
cargo clean

# Build ulang dan install
cargo build --release
cargo install --path .

# Atau langsung install (akan build otomatis)
cargo install --path .
```

---

*Dokumentasi ini mencakup semua aspek konfigurasi dan kustomisasi Kit. Untuk informasi lebih lanjut, jalankan `kit --help`*