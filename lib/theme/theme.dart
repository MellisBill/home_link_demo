import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeLinkTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.montserratTextTheme().copyWith( 
        headlineSmall: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
