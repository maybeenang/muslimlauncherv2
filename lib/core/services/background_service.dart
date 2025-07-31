import 'dart:async';
import 'dart:ui';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:usage_stats/usage_stats.dart';

Future<void> initializeBackgroundService() async {
  final service = FlutterBackgroundService();

  // Konfigurasi Notifikasi untuk Foreground Service
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'muslim_launcher_service',
    'Muslim Launcher Service',
    description: 'Layanan untuk memantau penggunaan aplikasi.',
    importance: Importance.low,
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: true,
      notificationChannelId: 'muslim_launcher_service',
      initialNotificationTitle: 'Muslim Launcher Aktif',
      initialNotificationContent: 'Memantau penggunaan aplikasi Anda.',
      foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(), // Kosong karena hanya untuk Android
  );
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) {
  DartPluginRegistrant.ensureInitialized();

  Timer.periodic(const Duration(seconds: 3), (timer) async {
    try {
      DateTime endDate = DateTime.now();
      DateTime startDate = endDate.subtract(const Duration(seconds: 5));

      List<UsageInfo> usageStats =
          await UsageStats.queryUsageStats(startDate, endDate);

      if (usageStats.isNotEmpty) {
        usageStats.sort(
            (a, b) => (b.lastTimeUsed ?? '0').compareTo(a.lastTimeUsed ?? '0'));
        UsageInfo lastUsedApp = usageStats.first;

        // Logika untuk mengirim data ke UI atau memicu notifikasi
        // bisa ditambahkan di sini.
        // Contoh:
        // if (isAppRestricted(lastUsedApp.packageName) && isTimeExceeded(...)) {
        //   showWarningNotification();
        // }
      }
    } catch (e) {
      // Izin mungkin belum diberikan
    }
  });
}
