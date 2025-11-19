import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:realitea_club/screens/menu.dart';
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

    // CookieRequest
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
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

              // Product Name
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Product Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onChanged: (value) => setState(() => _name = value),
                  validator: (value) =>
                  (value == null || value.isEmpty) ? "Name can't be empty!" : null,
                ),
              ),

              // Price
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Price",
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
                    if (value == null || value.isEmpty) return "Price can't be empty!";
                    if (int.tryParse(value) == null) return "Price should be a value/number!";
                    return null;
                  },
                ),
              ),

              // Description
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onChanged: (value) => setState(() => _description = value),
                  validator: (value) =>
                  (value == null || value.isEmpty) ? "Description can't be empty!" : null,
                ),
              ),

              // Thumbnail URL
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
                  (value == null || value.isEmpty) ? "Thumbnail can't be empty!" : null,
                ),
              ),

              // Category (Dropdown)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Product Category",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  value: _category,
                  items: _categories
                      .map(
                        (cat) => DropdownMenuItem(
                      value: cat,
                      child: Text(
                        cat[0].toUpperCase() + cat.substring(1),
                      ),
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
                  title: const Text("Product Featured"),
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

                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {

                      // CALL DJANGO API via POST JSON
                      final response = await request.postJson(
                        "http://localhost:8000/create-product-flutter/",
                        jsonEncode({
                          "name": _name,
                          "price": _price,
                          "description": _description,
                          "thumbnail": _thumbnail,
                          "category": _category,
                          "is_featured": _isFeatured,
                        }),
                      );

                      if (!context.mounted) return;

                      if (response['status'] == 'success') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Successfully add new product")),
                        );

                        // Redirect ke home
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MyHomePage()),
                        );

                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Error, try again."),
                          ),
                        );
                      }
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
