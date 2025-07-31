import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_launcher/data/datasource/local/isar_service.dart';
import 'package:muslim_launcher/features/home/providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apps = ref.watch(installedAppsProvider);
    final monitoredApps = ref.watch(monitoredAppsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Batasi Aplikasi')),
      body: apps.when(
        data: (appList) => monitoredApps.when(
          data: (monitoredList) {
            final monitoredPackageNames =
                monitoredList.map((e) => e.packageName).toSet();
            return ListView.builder(
              itemCount: appList.length,
              itemBuilder: (context, index) {
                final app = appList[index];
                return SwitchListTile(
                  secondary: Image.memory(app.icon!, width: 40),
                  title: Text(app.name),
                  value: monitoredPackageNames.contains(app.packageName),
                  onChanged: (value) async {
                    await ref
                        .read(isarServiceProvider)
                        .toggleAppMonitoring(app.packageName);
                    ref.invalidate(monitoredAppsProvider);
                  },
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, s) => const Center(child: Text('Error')),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => const Center(child: Text('Gagal memuat aplikasi')),
      ),
    );
  }
}
