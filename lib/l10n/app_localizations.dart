import 'package:flutter/material.dart';

abstract class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  // App title
  String get appTitle;

  // Navigation and buttons
  String get settings;
  String get backButton;

  // Theme settings
  String get themeSettings;
  String get lightMode;
  String get darkMode;

  // Language settings
  String get languageSettings;
  String get indonesian;
  String get english;

  // Home screen
  String get points;
  String get notEnoughPoints;
  String get earnPointsMessage;

  // Settings screen
  String get appLimitation;
  String get loadingApps;
  String get errorLoadingApps;

  // General
  String get error;
}

class AppLocalizationsId extends AppLocalizations {
  @override
  String get appTitle => 'Muslim Launcher';

  @override
  String get settings => 'Pengaturan';

  @override
  String get backButton => 'Kembali';

  @override
  String get themeSettings => 'Pengaturan Tema';

  @override
  String get lightMode => 'Mode Terang';

  @override
  String get darkMode => 'Mode Gelap';

  @override
  String get languageSettings => 'Pengaturan Bahasa';

  @override
  String get indonesian => 'Bahasa Indonesia';

  @override
  String get english => 'English';

  @override
  String get points => 'Poin';

  @override
  String get notEnoughPoints => 'Poin tidak cukup!';

  @override
  String get earnPointsMessage => 'Dapatkan poin dengan membaca Al-Quran.';

  @override
  String get appLimitation => 'Batasi Aplikasi';

  @override
  String get loadingApps => 'Memuat aplikasi...';

  @override
  String get errorLoadingApps => 'Gagal memuat aplikasi';

  @override
  String get error => 'Error';
}

class AppLocalizationsEn extends AppLocalizations {
  @override
  String get appTitle => 'Muslim Launcher';

  @override
  String get settings => 'Settings';

  @override
  String get backButton => 'Back';

  @override
  String get themeSettings => 'Theme Settings';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get languageSettings => 'Language Settings';

  @override
  String get indonesian => 'Bahasa Indonesia';

  @override
  String get english => 'English';

  @override
  String get points => 'Points';

  @override
  String get notEnoughPoints => 'Not enough points!';

  @override
  String get earnPointsMessage => 'Earn points by reading the Quran.';

  @override
  String get appLimitation => 'App Limitation';

  @override
  String get loadingApps => 'Loading apps...';

  @override
  String get errorLoadingApps => 'Failed to load apps';

  @override
  String get error => 'Error';
}