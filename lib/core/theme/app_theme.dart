import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF2E7D32);
  static const Color lightBackgroundColor = Color(0xFFF1F8E9);
  static const Color darkTextColor = Color(0xFF212121);
  static const Color lightTextColor = Color(0xFF757575);
  static const Color accentColor = Color(0xFFFFC107);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent, // Latar belakang transparan
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
      background: lightBackgroundColor,
    ),
    textTheme: GoogleFonts.interTextTheme(
      ThemeData.light().textTheme,
    ).apply(
      bodyColor: darkTextColor,
      displayColor: darkTextColor,
    ),
    iconTheme: const IconThemeData(color: primaryColor),
    appBarTheme: AppBarTheme(
      backgroundColor: lightBackgroundColor,
      elevation: 0,
      iconTheme: const IconThemeData(color: primaryColor),
      titleTextStyle: GoogleFonts.inter(
        color: darkTextColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
