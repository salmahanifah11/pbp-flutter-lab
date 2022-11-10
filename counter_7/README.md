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
* Icon: untuk membentuk suatu simbol bulat.

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