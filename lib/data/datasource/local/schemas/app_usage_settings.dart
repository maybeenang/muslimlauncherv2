import 'package:isar/isar.dart';

part 'app_usage_settings.g.dart';

@collection
class AppUsageSettings {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String packageName;

  int usageLimitInMinutes;
  bool isMonitored;

  AppUsageSettings({
    required this.packageName,
    this.usageLimitInMinutes = 30,
    this.isMonitored = false,
  });
}
