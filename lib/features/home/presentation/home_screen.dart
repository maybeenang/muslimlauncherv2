import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:muslim_launcher/features/home/providers.dart';
import 'package:muslim_launcher/features/quran/presentation/quran_screen.dart';
import 'package:installed_apps/app_info.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:muslim_launcher/features/settings/presentation/setting_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late Timer _timer;
  String _timeString = "";
  String _dateString = "";

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer =
        Timer.periodic(const Duration(seconds: 1), (Timer t) => _updateTime());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime() {
    if (mounted) {
      final now = DateTime.now();
      setState(() {
        _timeString = DateFormat('HH:mm').format(now);
        _dateString = DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(now);
      });
    }
  }

  void _onAppTapped(AppInfo app, bool isMonitored) async {
    final notifier = ref.read(userPointsProvider.notifier);
    final canLaunch = await notifier.attemptLaunchApp(app.packageName);

    if (canLaunch) {
      await LaunchApp.openApp(
        androidPackageName: app.packageName,
      );
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'Poin tidak cukup! Dapatkan poin dengan membaca Al-Quran.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final points = ref.watch(userPointsProvider);
    final apps = ref.watch(installedAppsProvider);
    final monitoredApps = ref.watch(monitoredAppsProvider);

    return PopScope(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 48.0),
                child: Column(
                  children: [
                    Text(
                      _timeString,
                      style: const TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.w200,
                        color: Colors.white70,
                        shadows: [
                          Shadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                    Text(_dateString, style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 24),
                    points.when(
                      data: (p) => Text('$p Poin',
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      loading: () => const CircularProgressIndicator(),
                      error: (e, s) => const Text('Error'),
                    )
                  ],
                ),
              ),
              // App Grid
              Expanded(
                child: apps.when(
                  data: (appList) => GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemCount: appList.length,
                    itemBuilder: (context, index) {
                      final app = appList[index];
                      final isMonitored = monitoredApps.maybeWhen(
                        data: (list) => list.any((setting) =>
                            setting?.packageName == app.packageName),
                        orElse: () => false,
                      );
                      return GestureDetector(
                        onTap: () => _onAppTapped(app, isMonitored),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.memory(app.icon!, width: 48),
                            const SizedBox(height: 8),
                            Text(app.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                      );
                    },
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, s) =>
                      const Center(child: Text('Gagal memuat aplikasi')),
                ),
              ),

              // Bottom Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu_book, size: 30),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const QuranScreen())),
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings, size: 30),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SettingsScreen())),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
