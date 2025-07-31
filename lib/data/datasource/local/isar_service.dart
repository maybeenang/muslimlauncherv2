import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:muslim_launcher/core/providers/core_provider.dart';
import 'package:muslim_launcher/data/datasource/local/schemas/app_usage_settings.dart';
import 'package:muslim_launcher/data/datasource/local/schemas/user_profile.dart';

class IsarService {
  final Isar _isar;
  IsarService(this._isar);

  // Operasi UserProfile
  Future<UserProfile> getUserProfile() async {
    var profile = await _isar.userProfiles.get(1);
    if (profile == null) {
      profile = UserProfile(points: 10);
      await _isar.writeTxn(() async {
        await _isar.userProfiles.put(profile!);
      });
    }
    return profile;
  }

  Future<void> updateUserPoints(int newPoints) async {
    final profile = await getUserProfile();
    profile.points = newPoints;
    await _isar.writeTxn(() async {
      await _isar.userProfiles.put(profile);
    });
  }

  // Operasi AppUsageSettings
  Future<void> toggleAppMonitoring(String packageName) async {
    await _isar.writeTxn(() async {
      var setting = await _isar.appUsageSettings
          .filter()
          .packageNameEqualTo(packageName)
          .findFirst();
      if (setting == null) {
        setting = AppUsageSettings(packageName: packageName, isMonitored: true);
      } else {
        setting.isMonitored = !setting.isMonitored;
      }
      await _isar.appUsageSettings.put(setting);
    });
  }

  Future<List<AppUsageSettings>> getMonitoredApps() async {
    return await _isar.appUsageSettings
        .filter()
        .isMonitoredEqualTo(true)
        .findAll();
  }

  Future<bool> isAppMonitored(String packageName) async {
    final setting = await _isar.appUsageSettings
        .filter()
        .packageNameEqualTo(packageName)
        .findFirst();
    return setting?.isMonitored ?? false;
  }
}

final isarServiceProvider = Provider<IsarService>((ref) {
  return IsarService(ref.watch(isarProvider));
});
