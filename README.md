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


# **Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements**

1. Jelaskan perbedaan antara ``Navigator.push()`` dan ``Navigator.pushReplacement()`` pada Flutter. 
Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
= ``Navigator.push()`` dan ``Navigator.pushReplacement()`` sama-sama digunakan untuk berpindah halaman, 
namun cara mereka memperlakukan stack berbeda, sehingga berdampak pada perilaku tombol back dan alur navigasi aplikasi.

A. ``Navigator.push()``-> menambahkan halaman baru di atas halaman sebelumnya, tanpa menghapus halaman yang lama.
Contoh pada program: 
```
[Home] → push(ProductForm)
Stack: Home -> ProductForm  (bisa kembali)
```
**Akibatnya:**
• Tombol back akan membuat pengguna kembali ke halaman sebelumnya.
• Halaman yang sebelumnya tetap tersimpan di memori.
• Cocok digunakan untuk navigasi yang bersifat forward sementara.

**Kapan digunakan?**
• Saat pengguna masih mungkin kembali ke halaman sebelumnya
Misalnya saat mengisi form, jika user berubah pikiran, mereka bisa kembali ke Home.
• Halaman baru hanya sebagai informasi tambahan
Contoh: detail produk, pop-up form, halaman settings.
• Tidak mengubah state halaman sebelumnya secara permanen

B. ``Navigator.pushReplacement()`` -> menghapus halaman sekarang dari stack, lalu menggantikannya dengan halaman baru.
• Contoh pada program: 
```
[Home] → pushReplacement(ProductForm)
Stack: ProductForm  (Home dihapus)

```
• Akibatnya:
• Tombol back tidak bisa kembali ke halaman sebelumnya.
• Stack lebih bersih karena halaman yang lama dibuang.
• Cocok untuk navigasi yang bersifat final atau perpindahan antar halaman utama.

**Kapan digunakan?**
• Halaman lama tidak relevan lagi setelah berpindah
Contoh: setelah login, halaman login tidak diperlukan lagi.
• Navigasi antar fitur utama aplikasi via Drawer.
Biasanya, Drawer digunakan untuk mengganti halaman utama, tidak menambahkan halaman di atas.
• Ingin mencegah pengguna kembali ke halaman tertentu
Misalnya untuk mencegah user kembali ke splash screen, onboarding, atau halaman login.


2. Bagaimana kamu memanfaatkan hierarchy widget seperti ``Scaffold``, ``AppBar``, dan ``Drawer`` untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
= Dalam Flutter, struktur halaman dapat dibangun dengan memanfaatkan hierarchy atau susunan widget dari level yang paling tinggi (Scaffold) hingga elemen-elemen detail di dalamnya (AppBar, Drawer, Body).

A. ``Scaffold`` sebagai struktur dasar setiap halaman
Scaffold adalah kerangka utama yang menyediakan struktur standar aplikasi modern, seperti:
• AppBar
• Drawer
• Body
• BottomNav
• FloatingActionButton 

Dengan menggunakan Scaffold pada setiap halaman, tampilan aplikasi menjadi:
• Seragam dan teratur
• Mudah dinavigasi
• Konsisten dari halaman ke halaman lain

Contoh pada program:
```
return Scaffold(
   appBar: AppBar(...),
   drawer: const LeftDrawer(),
   body: ...,
);
```

B. ``AppBar`` untuk identitas dan navigasi ringan
AppBar digunakan sebagai bagian teratas halaman untuk memberi identitas visual dan menyediakan 
tombol navigasi otomatis (ikon hamburger untuk membuka Drawer).

Pada aplikasi Realitea Club, AppBar berisi:
• Nama aplikasi “Realitea Club”
• Warna background konsisten 
• Font dan gaya teks yang sama pada tiap halaman

Contoh pada program:
```
appBar: AppBar(
  title: const Text(
    'Realitea Club',
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
  backgroundColor: const Color(0xFF132440),
),
```

C. ``Drawer`` sebagai navigasi utama antar halaman
Drawer berfungsi sebagai menu navigasi yang muncul dari sisi kiri dan sama di semua halaman.
Pada aplikasi Realitea Club, Drawer berisi menu seperti:
• Home
• Create Product
• My Products
Karena Drawer ditempatkan di dalam Scaffold, pengguna bisa membuka menu ini dari halaman mana pun.

Contoh pada program:
```
drawer: const LeftDrawer(),
```

Di dalam ``LeftDrawer``, navigasi dilakukan memakai ``Navigator.pushReplacement()`` agar:
• Halaman sebelumnya diganti, bukan ditumpuk
• Navigasi antar halaman utama tetap bersih
• Aplikasi tidak memiliki stack yang semakin panjang

Dengan mengombinasikan:
• ``Scaffold`` → sebagai kerangka utama
• ``AppBar`` → sebagai identitas visual dan header
• ``Drawer`` → sebagai navigasi global
Seluruh halaman pada aplikasi memiliki:
• Layout dasar yang sama
• Navigasi yang ada dan jelas
• Tampilan visual yang konsisten
• Pengalaman pengguna yang familiar dan mudah dipahami

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti ``Padding``, ``SingleChildScrollView``, dan ``ListView`` 
saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
= Dalam Flutter, penting untuk memastikan form nyaman digunakan, responsif, dan tidak menimbulkan 
overflow error. Oleh karena itu, layout widget seperti ``Padding``, ``SingleChildScrollView``, dan ``ListView`` sangat penting dan memberikan banyak keuntungan dalam desain antarmuka.

A. ``Padding``
• Kelebihan Padding:
   - Meningkatkan estetika tampilan (lebih rapi dan terstruktur)
   - Membuat teks dan form lebih mudah dilihat dan diisi
   - Menghindari tampilan terlihat sempit atau berantakan

Contoh pada program:
```
body: Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
    children: [...],
  ),
),

```

B. ``SingleChildScrollView``
Flutter sering mengalami error “Bottom overflowed by xx pixels” ketika konten form terlalu panjang.
``SingleChildScrollView`` menyelesaikan masalah ini dengan membuat halaman dapat digulir (scrollable), sehingga elemen form tidak keluar dari layar.

• Kelebihan ``SingleChildScrollView:``
   - Menghindari overflow ketika keyboard membuka form input 
   - Mengizinkan pengguna scroll seluruh halaman ketika form panjang 
   - Memberikan fleksibilitas untuk menampung banyak widget

Contoh pada program:
```
return Scaffold(
  body: SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // TextField dan tombol form
        ],
      ),
    ),
  ),
);

```

C. ``ListView``
``ListView`` cocok digunakan ketika:
• Jumlah elemen bisa banyak
• Ada daftar produk, berita, item dinamis
• Butuh kemampuan scroll bawaan tanpa membungkus ke widget lain

Berbeda dengan Column biasa, ``ListView`` otomatis mengatur scroll, merender elemen secara efisien, dan
tidak perlu dibungkus ``SingleChildScrollView`` lagi.

• Kelebihan ListView:
   - Sangat efisien untuk daftar panjang 
   - Menghindari layout overflow tanpa konfigurasi ekstra 
   - Mendukung builder untuk list yang dinamis

Contoh pada program:
```
ListView(
  children: [
    ProductTile(...),
    ProductTile(...),
    ProductTile(...),
  ],
)

```

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
= Untuk menjaga identitas visual aplikasi agar selaras dengan brand Football Shop (Realitea Club), saya melakukan penyesuaian warna tema secara menyeluruh melalui ``ThemeData``, komponen ``AppBar``, elemen UI utama, dan palet warna yang konsisten. 
Seluruh desain warna dirancang berdasarkan satu warna utama, yaitu Color(0xFF132440), yang berfungsi sebagai identitas visual utama brand.

• Menetapkan warna utama melalui ThemeData
Langkah pertama yang saya lakukan adalah menentukan warna primer brand langsung di dalam MaterialApp melalui ThemeData. Dengan menggunakan ColorScheme.fromSeed(), seluruh komponen Material dalam aplikasi dapat menyesuaikan warna turunan secara otomatis berdasarkan warna brand tersebut.
Contoh pada program:

```
theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF132440),
  ),
  useMaterial3: false,
),

```

• Menyamakan tampilan AppBar dengan warna brand
AppBar adalah elemen yang selalu muncul di berbagai halaman, sehingga penting untuk memastikan bahwa warnanya konsisten dengan brand. 
Pada halaman home, AppBar diberi warna:

```
appBar: AppBar(
  title: const Text(
    'Realitea Club',
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),
  backgroundColor: Color(0xFF132440),
  foregroundColor: Colors.white,
),

```

• Memilih palet warna
Meskipun warna utama aplikasi adalah biru (0xFF132440), saya tetap menambahkan warna-warna sekunder yang masih satu palet agar tampilan aplikasi tidak monoton. 
Warna-warna ini dipakai untuk elemen menu pada halaman utama:
```
ItemHomepage("All Products", Icons.shopping_bag, Color(0xFF16476A)),
ItemHomepage("My Products", Icons.person, Color(0xFF132440)),
ItemHomepage("Create Product", Icons.add_box, Color(0xFF79A35A)),

```

• Menjaga konsistensi kontras dan keterbacaan
Karena sebagian besar background elemen UI (card menu) menggunakan warna gelap, saya secara konsisten menggunakan warna putih pada teks dan ikon
agar user tetap nyaman saat menggunakannya.
Contoh pada program:
```
Icon(item.icon, size: 35, color: Colors.white)
Text(item.name, style: TextStyle(color: Colors.white))

```

• Implementasi warna pada elemen-elemen tambahan
Selain ``AppBar`` dan item menu, beberapa elemen lain juga memakai skema warna yang konsisten, seperti:
- tombol aksi (mengikuti seedColor),
- outline pada kartu,
- highlight efek sentuhan dengan InkWell,
- indikator fokus pada form input.

Dengan mengikuti color scheme, seluruh halaman terasa menyatu meskipun memiliki fungsi berbeda.

• Dampak konsistensi warna terhadap identitas visual:
Konsistensi tema warna yang diterapkan memberikan beberapa manfaat penting:
   - Branding lebih kuat — user langsung mengenali gaya visual aplikasi. 
   - Pengalaman pengguna lebih nyaman — tidak ada warna yang bertabrakan. 
   - Komponen aplikasi terlihat harmonis dan serasi. 
   - Memudahkan pengembangan — warna dapat diubah di satu tempat tanpa perlu mengedit setiap widget.
Dengan pendekatan ini, aplikasi Football Shop berhasil mempertahankan identitas visual yang kuat dan konsisten, 
sekaligus tetap memberikan pengalaman pengguna yang bersih, rapi, dan mudah dinavigasi.




