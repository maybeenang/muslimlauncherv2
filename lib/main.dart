import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:isar/isar.dart';
import 'package:muslim_launcher/core/providers/core_provider.dart';
import 'package:muslim_launcher/core/services/background_service.dart';
import 'package:muslim_launcher/core/theme/app_theme.dart';
import 'package:muslim_launcher/data/datasource/local/schemas/app_usage_settings.dart';
import 'package:muslim_launcher/data/datasource/local/schemas/user_profile.dart';
import 'package:muslim_launcher/features/home/presentation/home_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Isar
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [UserProfileSchema, AppUsageSettingsSchema],
    directory: dir.path,
  );

  // Inisialisasi service latar belakang
  await initializeBackgroundService();

  // Inisialisasi format tanggal Indonesia
  await initializeDateFormatting('id_ID', null);

  runApp(
    ProviderScope(
      overrides: [
        isarProvider.overrideWithValue(isar),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muslim Launcher',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(), // Langsung ke HomeScreen
    );
  }
}
