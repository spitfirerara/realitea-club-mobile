import 'package:flutter/material.dart';
import 'package:realitea_club/widgets/left_drawer.dart';
import 'package:realitea_club/screens/product_form.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final String nama = "Naira Ammara Putri";
  final String npm = "2406433112";
  final String kelas = "B";

  static const List<ItemHomepage> items = [
    ItemHomepage("All Products", Icons.shopping_bag, Color(0xFF16476A)),
    ItemHomepage("My Products", Icons.person, Color(0xFF132440)),
    ItemHomepage("Create Product", Icons.add_box, Color(0xFF79A35A)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Realitea Club',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF132440),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      drawer: const LeftDrawer(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // === Identitas ===
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoCard(title: "NPM", content: npm),
                  InfoCard(title: "Name", content: nama),
                  InfoCard(title: "Class", content: kelas),
                ],
              ),

              const SizedBox(height: 24),

              const Text(
                'Welcome to Realitea Club!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF132440),
                ),
              ),

              const SizedBox(height: 20),

              // === Grid Menu ===
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: items.map((item) {
                  return ItemCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// === Info Card ===
class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(content),
          ],
        ),
      ),
    );
  }
}

// === Model Item ===
class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  const ItemHomepage(this.name, this.icon, this.color);
}

// === Card Menu ===
class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {
          if (item.name == "Create Product") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductFormPage(),
              ),
            );
          } else {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text("${item.name} belum tersedia")),
              );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, size: 35, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              item.name,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
