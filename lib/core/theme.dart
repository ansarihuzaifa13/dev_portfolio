// core/theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.black,
  textTheme: GoogleFonts.sourceCodeProTextTheme(
    const TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
      bodyLarge: TextStyle(color: Colors.black),
      headlineLarge: TextStyle(color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
    ),
  ),
);