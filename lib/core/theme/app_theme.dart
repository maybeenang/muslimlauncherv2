import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Light Theme Colors (Islamic Green Palette)
  static const Color primaryColor = Color(0xFF2E7D32);
  static const Color lightBackgroundColor = Color(0xFFF1F8E9);
  static const Color darkTextColor = Color(0xFF212121);
  static const Color lightTextColor = Color(0xFF757575);
  static const Color accentColor = Color(0xFFFFC107);
  
  // Dark Theme Colors (Islamic Dark Palette)
  static const Color darkPrimaryColor = Color(0xFF4CAF50);
  static const Color darkBackgroundColor = Color(0xFF1B2E1F);
  static const Color darkSurfaceColor = Color(0xFF2D4A32);
  static const Color darkOnSurfaceColor = Color(0xFFE8F5E8);
  static const Color darkOnPrimaryColor = Color(0xFF003D00);

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

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    scaffoldBackgroundColor: Colors.transparent, // Latar belakang transparan
    colorScheme: ColorScheme.fromSeed(
      seedColor: darkPrimaryColor,
      brightness: Brightness.dark,
      background: darkBackgroundColor,
      surface: darkSurfaceColor,
      onSurface: darkOnSurfaceColor,
      onPrimary: darkOnPrimaryColor,
    ),
    textTheme: GoogleFonts.interTextTheme(
      ThemeData.dark().textTheme,
    ).apply(
      bodyColor: darkOnSurfaceColor,
      displayColor: darkOnSurfaceColor,
    ),
    iconTheme: const IconThemeData(color: darkPrimaryColor),
    appBarTheme: AppBarTheme(
      backgroundColor: darkBackgroundColor,
      elevation: 0,
      iconTheme: const IconThemeData(color: darkPrimaryColor),
      titleTextStyle: GoogleFonts.inter(
        color: darkOnSurfaceColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
