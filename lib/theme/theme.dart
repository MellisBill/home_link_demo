import 'package:flutter/material.dart';

class HomeLinkTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      textTheme: TextTheme(
        headlineSmall: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}
