# Tugas #4 — Aplikasi Katalog Flutter (Navigasi Antar Screen)

Aplikasi Flutter sederhana yang mendemonstrasikan navigasi antar screen menggunakan `Navigator.push` (Stack Navigation). Terdiri dari 2 screen:

- **Screen 1 (Beranda/Katalog)** — `StatelessWidget`, menampilkan `ListView` berisi 3 cards produk.
- **Screen 2 (Detail Katalog)** — `StatefulWidget`, menampilkan detail produk dengan layout `Column`, tombol favorit interaktif, dan tombol back untuk kembali ke Screen 1.

> **Catatan:** Versi ini menggunakan **data dummy/statis** (lihat `lib/models/catalog_item.dart`), belum terhubung ke server/database. Bagian "Server Lokal" dan "Database MySQL" di bawah disiapkan sebagai panduan **opsional** jika ke depannya katalog ingin diambil dari backend, bukan langkah wajib untuk menjalankan versi saat ini.

---

## Struktur Project

```
flutter_katalog_app/
├── lib/
│   ├── main.dart                  # Entry point aplikasi
│   ├── models/
│   │   └── catalog_item.dart      # Model data + data dummy 3 item katalog
│   └── screens/
│       ├── home_screen.dart       # Screen 1: Beranda/Katalog
│       └── detail_screen.dart     # Screen 2: Detail Katalog
├── pubspec.yaml
└── README.md
```

---

## 1. Cara Setup Project

### Prasyarat
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (versi stabil terbaru, minimal Flutter 3.x)
- Editor: Android Studio / VS Code (dengan plugin Flutter & Dart)
- Emulator Android/iOS terpasang, **atau** browser Chrome untuk menjalankan versi web

### Langkah Setup
1. Clone repository:
   ```bash
   git clone <url-repository-anda>
   cd flutter_katalog_app
   ```
2. Pastikan Flutter sudah terpasang dengan benar:
   ```bash
   flutter doctor
   ```
   Pastikan semua checklist yang relevan (Flutter, Android toolchain/Xcode, editor) menunjukkan tanda centang.
3. Install dependencies:
   ```bash
   flutter pub get
   ```

---

## 2. Perintah Menjalankan Server Lokal (Development Server)

Untuk aplikasi Flutter, "server lokal" yang dimaksud adalah **Flutter development server** (hot reload) yang menjalankan aplikasi di emulator, perangkat fisik, atau browser.

1. Cek device yang tersedia:
   ```bash
   flutter devices
   ```
2. Jalankan aplikasi (pilih salah satu):
   ```bash
   # Menjalankan di emulator/device default yang terhubung
   flutter run

   # Menjalankan sebagai web app (server lokal di browser)
   flutter run -d chrome
   ```
3. Setelah build selesai, aplikasi akan terbuka otomatis. Gunakan `r` di terminal untuk hot reload, dan `R` untuk hot restart selama development.

---

## 3. Cara Import Database MySQL

Versi aplikasi saat ini **belum menggunakan database MySQL** — seluruh data katalog masih statis (dummy data) yang didefinisikan langsung di `lib/models/catalog_item.dart`.

Jika ke depannya katalog ingin diambil dari database MySQL melalui backend (misalnya REST API dengan Node.js/PHP), langkah umum importnya adalah:

1. Buat database baru di MySQL:
   ```sql
   CREATE DATABASE katalog_app;
   ```
2. Import file dump `.sql` (jika tersedia) menggunakan terminal:
   ```bash
   mysql -u root -p katalog_app < database/katalog_app.sql
   ```
   atau melalui tools seperti **phpMyAdmin** / **MySQL Workbench** dengan memilih database `katalog_app` lalu menu **Import** dan mengarahkan ke file `.sql` tersebut.
3. Sesuaikan koneksi database (host, user, password) pada konfigurasi backend, lalu jalankan server backend agar Flutter dapat mengambil data katalog melalui HTTP request (misalnya menggunakan package `http`).

---

## Ringkasan Fitur Sesuai Scope of Work

| Requirement | Status |
|---|---|
| Screen 1 StatelessWidget + ListView 3 cards | ✅ |
| ListTile bisa diklik per item | ✅ |
| Navigasi Screen 1 → 2 via `Navigator.push` | ✅ |
| Screen 2 layout `Column` + `StatefulWidget` | ✅ |
| Icon back di Screen 2 | ✅ |
| Text nama/harga katalog | ✅ |
| Container pastel + padding untuk deskripsi | ✅ |
| AppBar dengan tombol kembali otomatis | ✅ |