import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:muslim_launcher/data/datasource/local/isar_service.dart';
import 'package:muslim_launcher/data/datasource/local/schemas/app_usage_settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
Future<List<AppInfo>> installedApps(InstalledAppsRef ref) async {
  return InstalledApps.getInstalledApps(true, true);
}

@riverpod
class UserPoints extends _$UserPoints {
  @override
  Future<int> build() async {
    final profile = await ref.watch(isarServiceProvider).getUserProfile();
    return profile.points;
  }

  Future<void> addPoints(int amount) async {
    final currentPoints = state.value ?? 0;
    final newPoints = currentPoints + amount;
    await ref.read(isarServiceProvider).updateUserPoints(newPoints);
    ref.invalidateSelf(); // Memuat ulang state
  }

  Future<bool> attemptLaunchApp(String packageName) async {
    final isMonitored =
        await ref.read(isarServiceProvider).isAppMonitored(packageName);
    if (!isMonitored) return true;

    final currentPoints = state.value ?? 0;
    const cost = 5; // Biaya 5 poin untuk membuka

    if (currentPoints >= cost) {
      final newPoints = currentPoints - cost;
      await ref.read(isarServiceProvider).updateUserPoints(newPoints);
      ref.invalidateSelf();
      return true;
    }
    return false;
  }
}

@riverpod
Future<List<AppUsageSettings>> monitoredApps(MonitoredAppsRef ref) {
  return ref.watch(isarServiceProvider).getMonitoredApps();
}
