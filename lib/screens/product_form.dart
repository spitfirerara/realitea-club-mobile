import 'package:flutter/material.dart';
import 'package:realitea_club/widgets/left_drawer.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Form values
  String _name = "";
  int _price = 0;
  String _description = "";
  String _thumbnail = "";
  String _category = "jersey";
  bool _isFeatured = false;

  // Category options
  final List<String> _categories = [
    'jersey',
    'shoes',
    'ball',
    'accessory',
    'other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk Baru'),
        backgroundColor: const Color(0xFF79A35A),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Product Name ===
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Nama Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onChanged: (value) => setState(() => _name = value),
                  validator: (value) =>
                  (value == null || value.isEmpty) ? "Nama tidak boleh kosong!" : null,
                ),
              ),

              // === Price ===
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Harga",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _price = int.tryParse(value) ?? 0;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Harga tidak boleh kosong!";
                    if (int.tryParse(value) == null) return "Harga harus angka!";
                    return null;
                  },
                ),
              ),

              // === Description ===
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onChanged: (value) => setState(() => _description = value),
                  validator: (value) =>
                  (value == null || value.isEmpty) ? "Deskripsi tidak boleh kosong!" : null,
                ),
              ),

              // === Thumbnail URL ===
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Thumbnail URL",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onChanged: (value) => setState(() => _thumbnail = value),
                  validator: (value) =>
                  (value == null || value.isEmpty) ? "Thumbnail tidak boleh kosong!" : null,
                ),
              ),

              // === Category (Dropdown) ===
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Kategori Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  value: _category,
                  items: _categories
                      .map(
                        (cat) => DropdownMenuItem(
                      value: cat,
                      child: Text(cat[0].toUpperCase() + cat.substring(1)),
                    ),
                  )
                      .toList(),
                  onChanged: (newValue) => setState(() => _category = newValue!),
                ),
              ),

              // === Featured ===
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: SwitchListTile(
                  title: const Text("Produk Featured"),
                  value: _isFeatured,
                  onChanged: (value) => setState(() => _isFeatured = value),
                ),
              ),

              // === Save Button ===
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF79A35A),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Save"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Produk berhasil disimpan!"),
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Nama: $_name"),
                                Text("Harga: $_price"),
                                Text("Deskripsi: $_description"),
                                Text("Thumbnail: $_thumbnail"),
                                Text("Kategori: $_category"),
                                Text("Featured: ${_isFeatured ? 'Ya' : 'Tidak'}"),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _formKey.currentState!.reset();

                                setState(() {
                                  _name = "";
                                  _price = 0;
                                  _description = "";
                                  _thumbnail = "";
                                  _category = "jersey";
                                  _isFeatured = false;
                                });
                              },
                              child: const Text("OK"),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
