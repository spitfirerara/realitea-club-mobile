import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'screens/login.dart';

void main() {
  runApp(const RealiteaClub());
}

class RealiteaClub extends StatelessWidget {
  const RealiteaClub({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => CookieRequest(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Realitea Club',

        theme: ThemeData(
          // Warna app
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF132440),   // dark navy
          ),
          primaryColor: const Color(0xFF132440),

          // GOOGLE FONTS GLOBAL
          textTheme: GoogleFonts.poppinsTextTheme(),

          // Button Style
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF79A35A),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          // CARD THEME
          cardTheme: CardThemeData(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),

          // APPBAR
          appBarTheme: AppBarTheme(
            backgroundColor: const Color(0xFF132440),
            foregroundColor: Colors.white,
            centerTitle: true,
            titleTextStyle: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
            elevation: 4,
            shadowColor: Colors.black26,
          ),
        ),

        home: const LoginPage(),
      ),
    );
  }
}
