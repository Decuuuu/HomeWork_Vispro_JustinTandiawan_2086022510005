# Makan Z Kuy! 

Project AFL 1 Visual Programming - Track B (Directory & Explorer).

## Deskripsi Singkat
Makan Z Kuy adalah aplikasi katalog menu makanan sederhana. Aplikasi ini dibuat untuk memenuhi kriteria tugas AFL 1, dengan fokus pada kode yang rapi, UI responsif, dan penggunaan Material 3.

## Fitur Aplikasi
- **3 Layar (Screen):** Home (Daftar Menu), Detail Makanan, dan Checkout.
- **Responsif:** Tampilan akan berubah menjadi Grid dan memunculkan Sidebar jika dibuka di Tablet/Web. Di HP, menggunakan laci (Drawer).
- **Dark Mode:** Tema warna bisa berubah menjadi gelap (bisa klik tombol bulan/matahari di pojok kanan atas).
- **Long List (500 Data):** Bisa menampung 500 daftar makanan tanpa lag (menggunakan lazy loading).
- **Aman dari Overflow:** Menggunakan CustomScrollView agar konten tidak menabrak keyboard saat pencarian.

## Cara Menjalankan
1. Pastikan sudah install Flutter.
2. Buka terminal di dalam folder project ini.
3. Jalankan perintah `flutter pub get` untuk update library.
4. Jalankan perintah `flutter run` (atau klik Run di VS Code/Android Studio).
5. Untuk build APK: `flutter build apk --release`

## Catatan Tambahan
Struktur folder dan laporan refleksi mingguan (H1 & H2) bisa dilihat di dalam folder `docs/`.