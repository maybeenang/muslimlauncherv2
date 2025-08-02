import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_launcher/core/providers/theme_provider.dart';
import 'package:muslim_launcher/core/providers/localization_provider.dart';
import 'package:muslim_launcher/data/datasource/local/isar_service.dart';
import 'package:muslim_launcher/features/home/providers.dart';
import 'package:muslim_launcher/l10n/app_localizations.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final apps = ref.watch(installedAppsProvider);
    final monitoredApps = ref.watch(monitoredAppsProvider);
    final currentTheme = ref.watch(appThemeModeProvider);
    final currentLocale = ref.watch(appLocaleProvider);

    return Scaffold(
      appBar: AppBar(title: Text(localizations.settings)),
      body: Column(
        children: [
          // Theme Settings Section
          _buildSectionCard(
            context,
            title: localizations.themeSettings,
            child: currentTheme.when(
              data: (themeMode) => Column(
                children: [
                  RadioListTile<ThemeMode>(
                    title: Text(localizations.lightMode),
                    value: ThemeMode.light,
                    groupValue: themeMode,
                    onChanged: (value) {
                      if (value != null) {
                        ref.read(appThemeModeProvider.notifier).setThemeMode(value);
                      }
                    },
                  ),
                  RadioListTile<ThemeMode>(
                    title: Text(localizations.darkMode),
                    value: ThemeMode.dark,
                    groupValue: themeMode,
                    onChanged: (value) {
                      if (value != null) {
                        ref.read(appThemeModeProvider.notifier).setThemeMode(value);
                      }
                    },
                  ),
                ],
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => Text(localizations.error),
            ),
          ),

          // Language Settings Section
          _buildSectionCard(
            context,
            title: localizations.languageSettings,
            child: currentLocale.when(
              data: (locale) => Column(
                children: [
                  RadioListTile<String>(
                    title: Text(localizations.indonesian),
                    value: 'id',
                    groupValue: locale.languageCode,
                    onChanged: (value) {
                      if (value != null) {
                        ref.read(appLocaleProvider.notifier).setLocale(Locale(value));
                      }
                    },
                  ),
                  RadioListTile<String>(
                    title: Text(localizations.english),
                    value: 'en',
                    groupValue: locale.languageCode,
                    onChanged: (value) {
                      if (value != null) {
                        ref.read(appLocaleProvider.notifier).setLocale(Locale(value));
                      }
                    },
                  ),
                ],
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => Text(localizations.error),
            ),
          ),

          // App Limitation Section
          Expanded(
            child: _buildSectionCard(
              context,
              title: localizations.appLimitation,
              child: apps.when(
                data: (appList) => monitoredApps.when(
                  data: (monitoredList) {
                    final monitoredPackageNames =
                        monitoredList.map((e) => e.packageName).toSet();
                    return ListView.builder(
                      shrinkWrap: true,
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
                  loading: () => Center(child: Text(localizations.loadingApps)),
                  error: (e, s) => Center(child: Text(localizations.error)),
                ),
                loading: () => Center(child: Text(localizations.loadingApps)),
                error: (e, s) => Center(child: Text(localizations.errorLoadingApps)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(BuildContext context, {required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }
}
