# H2 - Constraint Diagnosis

### Error 1: Right Overflow pada Header (Teks Kepanjangan)
* **Screenshot:** ! [Error 1](error1.png)
* **Rule violated:** `Row` di dalam `AppHeader` memberikan *unbounded width* kepada anak-anaknya. Widget `Text` mencoba merender kalimat panjang "MakanKuy! Cabang..." secara utuh sehingga menabrak batas maksimal layar kanan.
* **Fix:** Membungkus widget `Text` tersebut dengan `Expanded` dan menambahkan `maxLines: 2` serta `overflow: TextOverflow.ellipsis` agar ukuran teks dibatasi oleh sisa ruang.

### Error 2: Right Overflow pada Kategori (Chip Terpotong)
* **Screenshot:** ! [Error 2](error2.png)
* **Rule violated:** `Row` di `CategoryChipBar` menyusun deretan *Chip* kategori secara horizontal dan statis. Total lebar gabungan semua *chip* melebihi batas maksimal lebar layar.
* **Fix:** Membungkus `Row` tersebut dengan `SingleChildScrollView` dan mengatur `scrollDirection: Axis.horizontal` agar kategori bisa digeser (*scrollable*) dan tidak menabrak batas.

### Error 3: Bottom Overflow pada Layar (Tertabrak Keyboard)
* **Screenshot:** ! [Error 3](error3.png)
* **Rule violated:** Layar utama menggunakan `Column` statis yang mencoba me-render konten vertikal melebihi tinggi layar. Saat keyboard muncul, area layar yang tersedia mengecil drastis, menyebabkan konten bawah (daftar menu) menabrak batas layar.
* **Fix:** Mengubah kerangka *layout* dari `Column` menjadi `CustomScrollView` dengan *Slivers* agar seluruh halaman menjadi fleksibel dan layar bisa digulir saat keyboard muncul.