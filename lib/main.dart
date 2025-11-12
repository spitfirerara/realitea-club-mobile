import 'package:flutter/material.dart';
import 'package:realitea_club/screens/menu.dart';

void main() {
  runApp(const RealiteaClub());
}

class RealiteaClub extends StatelessWidget {
  const RealiteaClub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Realitea Club',
      theme: ThemeData(
        colorScheme:
        ColorScheme.fromSeed(
          seedColor: const Color(0xFF132440),
        ),
        useMaterial3: false,
      ),
      home: const MyHomePage(),
    );
  }
}
