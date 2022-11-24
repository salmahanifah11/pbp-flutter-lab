# TUGAS 7

### 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
Stateless widget dan stateful widget merupakan suatu fitur widget yang disediakan oleh platform Flutter.
Stateless widget merupakan widget yang dimuat secara statis dan telah diinisiasikan sejak awal sehingga tidak dapat diubah sedangkan stateful widget merupakan widget yang dinamis dan dapat diubah.

### 2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
* Scaffold: untuk mengimplementasikan struktur dasar pada desain.
* Appbar: untuk membuat bar di posisi atas layar.
* Text: untuk menambahkan suatu tulisan pada layar.
* Center: untuk mengatur posisi widget, yakni setiap elemen berada di tengah.
* Container: untuk memuat semua widget.
* Column: untuk mengatur posisi widget, yakni setiap elemen tersusun secara vertikal ke bawah.
* TextStyle: untuk memberikan warna pada tulisan.
* Icon: untuk membentuk suatu simbol.

### 3. Apa fungsi setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
setState() merupakan suatu fungsi yang digunakan untuk memberitahu widget bahwa terdapat objek yang berubah pada state sehingga aplikasi akan memuat ulang widget tersebut dengan nilai atau value yang baru.
Variabel yang terdampak adalah _counter.

### 4. Jelaskan perbedaan antara const dengan final.
Const digunakan untuk deklarasi variabel immutable yang nilainya bersifat konstan dan harus sudah diketahui pada saat kompilasi sehingga nilai dari variabel tersebut harus diberikan value secara langsung.
Final digunakan untuk deklarasi variabel immutable yang nilainya sudah ataupun belum diketahui pada saat kompilasi.

### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
Dimulai dengan membuat app baru bernama "counter7".
Mengubah title home page menjadi "Program Counter".
membuat void baru bernama _decrementcounter sebagai fungsi untuk mengurangkan angka _counter apabila tombol minus ditekan.
Membuat modifikasi pada bagian widget, antara lain:
* menambahkan kondisi if-elif untuk menentukan value dari _counter (ganjil atau genap) dan memberikan warna huruf.
* menambahkan FloatingActionButton baru dengan memberikan widget-widget, seperti padding, container, dan icon.


# TUGAS 8

### 1. Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.
Saat pemanggilan page baru menggunakan Navigator.push, page yang baru akan menimpa halaman page sebelumnya sedangkan apabila menggunakan Navigator.Replacement, page sebelumnya akan digantikan oleh page baru sehingga tidak saling bertimpa.

### 2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
* Drawer: untuk membuat list yang berisi daftar navigasi bar.
* TextFormField:  untuk membentuk sebuah input bertipe String.
* DropdownButtonFormField: untuk memberikan beberapa pilihan list menu sebagai input.
* Card: untuk membentuk sebuah card, pada lab ini bergungsi untuk mengeluarkan data.
* Row: untuk mengatur posisi widget, yakni setiap elemen tersusun secara horizontal atau vertikal ke bawah.

### 3. Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).
* onPressed()
* onTap()
* onSaved()
* onComplete()
* onChange()
* onPresent()

### 4. Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
Navigator bekerja seperti sebuah stack di mana stack tersebut menyimpan data berupa halaman page. Ketika ingin membuka page baru dengan memanggil navigator, maka page baru akan dimasukan ke dalam stack dan menimpa page sebelumnya. Lalu ketika ingin kembali ke page sebelumnya dapat menggunakan operasi pop.

### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
Membuat hamburger bar dengan menggunakan widget drawer yang setiap pilihannya akan tertuju pada page berbeda, yakni antara counter_7, tambah budget, dan data budget.
Membuat file baru bernama form.dart untuk meminta input user melalui form menggunakan TextFormField dan DropdownButtonFormField. Menginisiasikan variabel sebagai elemen input yang bertipekan data string dan membuat list untuk menyimpan data hasil dar input user. Lalu membuat button untuk menyimpan input user dan memberikan pop-up message.
Membuat file baru bernama data.dart yang berfungsi untuk menampilkan list data input dari user.


# TUGAS 9

### 1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Bisa dengan melakukan pengambilan data JSON lalu disimpan pada suatu variabel. Namun, hanya baik dilakukan jika data JSON kecil. Jika ukuran data JSON sedang atau besar, disarankan untuk membuat model terlebih dahulu untuk menjaga kejelasan kode, kemudahan refactoring, dan efisiensi.

### 2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
* ListView: untuk mengenerate widget-widget lain dengan method builder().
* Checkbox: untuk input value bertipe true atau false.
* FutureBuilder: untuk membangun tampilan dirinya sendiri.

### 3. Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
* Serialisasikan JSON menggunakan code generation.
* Ambil atau buat data JSON dari sautu network.
* Serialisasikan data JSON, lalu simpan data kedalam suatu query atau list.
* Tampilkan data dan atributnya menggunakan widget.

### 4. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Buat sebuah model untuk menampung data.
2. Buat sebuah page untuk me-render card dari setiap anggota list yang ada.
3. Terapkan dinamic routing kepada setiap object atau card.
4. Sesuaikan segala fungsi widget.