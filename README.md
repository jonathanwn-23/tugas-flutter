# Tugas #5 — Mobile Developer Documentation (Navigasi & State)

Aplikasi Flutter yang mendemonstrasikan **fitur navigasi antar Screen** menggunakan `Navigator.push` (Stack Navigation), serta implementasi **event & state** melalui perubahan Screen 2 menjadi `StatefulWidget`. Terdiri dari 2 screen:

- **Screen 1 (Beranda/Katalog)** — `StatelessWidget`, menampilkan `ListView` berisi 3 cards produk yang bisa diklik.
- **Screen 2 (Detail Katalog)** — `StatefulWidget`, menampilkan detail produk dengan layout `Column`, tombol favorit interaktif (event & state via `setState`), dan tombol back untuk kembali ke Screen 1.

> **Catatan:** Project ini merupakan **kelanjutan dari Tugas #4** (file `pricing.dart` dan `user_model.dart` dipertahankan sebagai bagian dari riwayat project, tidak ikut digunakan pada alur aplikasi Tugas #5). Versi ini menggunakan **data dummy/statis** (lihat `lib/models/catalog_item.dart`), belum terhubung ke server/database. Bagian "Server Lokal" dan "Database MySQL" di bawah disiapkan sebagai panduan **opsional** jika ke depannya katalog ingin diambil dari backend, bukan langkah wajib untuk menjalankan versi saat ini.

---

## Struktur Project

```
tugas_pertama/
├── lib/
│   ├── main.dart                  # Entry point aplikasi (Tugas #5)
│   ├── pricing.dart                # Latihan Card/Stack/Positioned (Tugas #4)
│   ├── user_model.dart             # Latihan model & JSON parsing (Tugas #4)
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
   cd tugas_pertama
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

## 3. Alur Aplikasi

1. Aplikasi dibuka pada **Screen 1 (Beranda/Katalog)**, menampilkan daftar 3 produk dalam bentuk card (`ListView` + `ListTile`).
2. Saat salah satu card diklik, aplikasi berpindah ke **Screen 2 (Detail Katalog)** menggunakan `Navigator.push` (Stack Navigation).
3. Screen 2 menampilkan nama produk, harga, dan deskripsi singkat dalam `Container` berlatar pastel.
4. Tombol **"Tambah Favorit"** pada Screen 2 mendemonstrasikan **event & state**: setiap kali ditekan, `setState` mengubah tampilan icon (outline → filled) dan label tombol ("Tambah Favorit" → "Difavoritkan").
5. Tombol back (baik icon eksplisit maupun tombol bawaan `AppBar`) mengembalikan pengguna ke Screen 1.

---

## 4. (Opsional) Cara Import Database MySQL

Versi aplikasi saat ini **belum menggunakan database MySQL** — seluruh data katalog masih statis (dummy data) yang didefinisikan langsung di `lib/models/catalog_item.dart`. Bagian ini disiapkan sebagai referensi jika ke depannya katalog ingin diambil dari database MySQL melalui backend (misalnya REST API dengan Node.js/PHP):

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

## Ringkasan Fitur Sesuai Scope of Work (Tugas #5)

| Requirement | Status |
|---|---|
| Screen 1 `StatelessWidget` + `ListView` berisi 3 cards | ✅ |
| Item pakai `ListTile`/tombol yang bisa diklik | ✅ |
| Navigasi Screen 1 → 2 via `Navigator.push` (Stack Navigation) | ✅ |
| Screen 2 layout `Column` | ✅ |
| Screen 2 diubah menjadi `StatefulWidget` | ✅ |
| Implementasi event & state (`setState` pada tombol favorit) | ✅ |
| Icon back di Screen 2 | ✅ |
| Text nama/harga katalog | ✅ |
| `Container` pastel + padding untuk deskripsi | ✅ |
| `AppBar` dengan tombol kembali otomatis | ✅ |