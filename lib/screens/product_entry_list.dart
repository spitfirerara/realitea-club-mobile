import 'package:flutter/material.dart';
import 'package:realitea_club/models/product_entry.dart';
import 'package:realitea_club/widgets/left_drawer.dart';
import 'package:realitea_club/widgets/product_entry_card.dart';
import 'package:realitea_club/screens/product_detail_page.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget {
  const ProductEntryListPage({super.key});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    final response = await request.get("http://localhost:8000/json/");

    List<ProductEntry> products = [];
    for (var item in response) {
      if (item != null) {
        products.add(ProductEntry.fromJson(item));
      }
    }

    return products;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        backgroundColor: const Color(0xFF132440),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                "No products.",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ProductEntryCard(
                product: snapshot.data![index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailPage(
                        product: snapshot.data![index],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
