# realitea_club

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference. 

# **Tugas 7: Elemen Dasar Flutter**

Jawab pertanyaan-pertanyaan berikut di file README.md pada folder root:

1. Jelaskan apa itu _widget tree_ pada Flutter dan bagaimana hubungan _parent-child_ (induk-anak) bekerja antar widget.
= _Widget tree_ adalah struktur hierarki yang menggambarkan bagaimana semua _widget_ (komponen antarmuka pengguna) tersusun di dalam aplikasi flutter. 
Setiap tampilan di Flutter dibangun dari kumpulan _widget_ yang saling bersarang, di mana satu _widget_ dapat berisi _widget_ lain di dalamnya.
Hubungan _parent-child_ (induk-anak) mengambarkan bagaimana _widget_ saling berhubungan:
   • _Parent_ adalah _widget_ yang membungkus/menampung widget lain.
   • _Child_ adalah _widget_ yang berada di dalam _parent_ dan mengikuti aturan tata letak atau gaya dari _parent_-nya.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
= • MaterialApp -> Widget utama yang menjadi root aplikasi Flutter berbasis Material Design, mengatur tema, navigasi, dan struktur dasar aplikasi.
   • Scaffold -> Menyediakan struktur visual dasar aplikasi seperti ``AppBar``, ``Body``, dan ``FloatingActionButton``.
   • AppBar -> Menampilkan bagian atas halaman (header) yang berisi judul aplikasi.
   • Padding -> Memberikan jarak di sekitar widget agar tidak menempel ke tepi layar.
   • Column -> Menyusun widget secara vertikal (atas ke bawah).
   • Row -> Menyusun widget secara horizontal (kiri ke kanan).
   • Center -> Meletakkan widget anak di posisi tengah.
   • Card -> Menampilkan tampilan berbentuk kotak dengan bayangan dan sudut melengkung untuk membungkus informasi atau tombol.
   • Icon -> Menampilkan ikon sesuai tema Material Design.
   • Text -> Menampilkan teks seperti nama, deskripsi, atau pesan.
   • GridView.count -> Menampilkan beberapa widget dalam bentuk grid (tabel) dengan jumlah kolom tertentu.
   • Material -> Memberi efek visual ripple dan mendukung tema Material Design.
   • InkWell -> Menangani interaksi pengguna seperti menekan (tap) pada widget.
   • SnackBar -> Menampilkan pesan singkat di bagian bawah layar ketika tombol ditekan.
   • SizedBox -> Memberikan jarak antar widget secara vertikal atau horizontal.
   • Container -> Digunakan untuk mengatur tata letak, ukuran, padding, dan warna latar suatu widget.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
= MaterialApp adalah widget utama yang membungkus seluruh aplikasi Flutter berbasis Material Design.
   Fungsinya antara lain:
- Menentukan tema warna aplikasi (ThemeData, ColorScheme).
- Mengatur navigasi antar halaman.
- Menentukan title, home widget, dan routing.
- Menjadi root widget untuk semua widget lainnya.
Widget ini sering dijadikan root karena menyediakan fitur dasar yang dibutuhkan oleh aplikasi Flutter modern tanpa harus membangunnya manual.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
= Perbedaan antara StatelessWidget dan StatefulWidget adalah:
   • **StatelessWidget** adalah _widget_ yang tidak memiliki keadaan (_state_) yang dapat berubah selama aplikasi berjalan.
   Artinya, semua data yang ditampilkan bersifat tetap (statis) dan hanya akan berubah jika widget tersebut dibangun ulang dengan data baru dari luar.
   Contohnya seperti teks statis, ikon, atau tampilan halaman yang hanya menampilkan informasi tanpa interaksi kompleks.
   • **Contoh penggunaan StatelessWidget:** 
      - Halaman utama dengan teks dan ikon tetap.
      - Tombol yang hanya memunculkan pesan Snackbar. 
      - Logo atau header aplikasi.

   • **StatefulWidget** adalah _widget_ yang memiliki _state_ (keadaan) yang bisa berubah seiring waktu, dan setiap kali _state_ berubah, _widget_ akan di-_rebuild_ untuk menampilkan tampilan terbaru.
   Biasanya digunakan untuk tampilan yang interaktif atau dinamis, seperti form input, animasi, atau data yang diambil dari internet.
   • **Contoh penggunaan StatefulWidget:**
      - Formulir input (seperti TextField dengan validasi).
      - Tombol yang bisa berubah warna saat ditekan.
      - Halaman yang menampilkan data dari API atau database.

   • Kapan menggunakannya: 
      - Menggunakan **StatelessWidget** jika tampilan tidak perlu berubah setelah dibangun.
      - Menggunakan **StatefulWidget** jika tampilan bergantung pada interaksi pengguna atau data yang berubah secara dinamis.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
= BuildContext adalah objek yang berisi informasi tentang posisi widget di dalam widget tree.
   Fungsi utamanya:
- Memberi akses ke theme, navigator, dan ancestor widget lain.
- Digunakan untuk memanggil widget lain yang bergantung pada konteks, seperti ScaffoldMessenger.of(context) untuk menampilkan SnackBar.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
= **Hot reload** adalah fitur Flutter yang memungkinkan pengembang melihat perubahan kode secara langsung tanpa kehilangan state (keadaan) aplikasi yang sedang berjalan.
   Ketika kita menyimpan file (atau menekan tombol “Hot Reload”), Flutter hanya memuat ulang bagian kode yang berubah dan memperbarui UI dengan cepat.
   Hal ini membuat proses pengembangan jadi lebih cepat karena kamu bisa langsung melihat hasil perubahan tanpa memulai ulang aplikasi.

   Sedangkan **Hot restart** akan memulai ulang seluruh aplikasi dari awal (dari main() lagi) dan menghapus semua state yang tersimpan.
   Semua variabel, input, atau posisi halaman akan kembali ke kondisi semula, seperti ketika kamu pertama kali menjalankan aplikasi.

   **Kesimpulannya**, Gunakan **Hot Reload** untuk mempercepat proses pengembangan UI dan gunakan **Hot Restart** jika kamu ingin memulai ulang seluruh aplikasi agar semua perubahan logika ter-update sepenuhnya.