# H1 - Responsive Pass Matrix

| Screen | Test | Pass/Fail | Fixes noted |
| :--- | :--- | :--- | :--- |
| `MenuScreen` | Small phone (320 dp) | Pass | Membungkus nama menu dan toko dengan `Expanded` dan `maxLines`. |
| `MenuScreen` | Large phone (430 dp) | Pass | Tidak ada isu, ruang cukup. |
| `MenuScreen` | Tablet (800 dp) | Pass | Menggunakan `LayoutBuilder` untuk menampilkan `SliverGrid` 2 kolom pada layar lebar. |
| `MenuScreen` | Landscape | Pass | Mengubah layout statis menjadi `CustomScrollView` agar bisa di-scroll. |
| `MenuScreen` | Long text (200 char) | Pass | Menambahkan `Expanded` pada `Text` dan `overflow: TextOverflow.ellipsis`. |
| `MenuScreen` | Empty state (0 items) | Pass | Menambahkan widget `SliverFillRemaining` dengan ikon dan teks peringatan saat data kosong. |
| `MenuScreen` | Long list (500 items) | Pass | Menggunakan struktur *lazy loading* dengan `SliverList` (bukan shrinkWrap). |
| `MenuScreen` | Keyboard open | Pass | Karena menggunakan struktur `CustomScrollView`, konten otomatis menyesuaikan dan bisa di-scroll saat keyboard muncul. |
| `MenuScreen` | Dark mode | Pass | Menggunakan warna dari *ThemeData* bawaan sistem, tidak ada warna font yang di-*hard-code*. |