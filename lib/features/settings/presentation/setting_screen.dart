import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_launcher/core/providers/theme_provider.dart';
import 'package:muslim_launcher/core/providers/localization_provider.dart';
import 'package:muslim_launcher/core/providers/wallpaper_provider.dart';
import 'package:muslim_launcher/core/widgets/wallpaper_background.dart';
import 'package:muslim_launcher/data/datasource/local/isar_service.dart';
import 'package:muslim_launcher/features/home/providers.dart';
import 'package:muslim_launcher/l10n/app_localizations.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final currentTheme = ref.watch(appThemeModeProvider);
    final currentLocale = ref.watch(appLocaleProvider);
    final currentWallpaper = ref.watch(appWallpaperProvider);

    return WallpaperBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(localizations.settings),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Theme Settings
              _buildModernSection(
                context,
                title: localizations.themeSettings,
                icon: Icons.palette_outlined,
                child: currentTheme.when(
                  data: (themeMode) => _buildThemeSelector(context, ref, themeMode, localizations),
                  loading: () => const _LoadingSection(),
                  error: (e, s) => _ErrorSection(localizations.error),
                ),
              ),

              const SizedBox(height: 16),

              // Language Settings
              _buildModernSection(
                context,
                title: localizations.languageSettings,
                icon: Icons.language_outlined,
                child: currentLocale.when(
                  data: (locale) => _buildLanguageSelector(context, ref, locale, localizations),
                  loading: () => const _LoadingSection(),
                  error: (e, s) => _ErrorSection(localizations.error),
                ),
              ),

              const SizedBox(height: 16),

              // Wallpaper Settings
              _buildModernSection(
                context,
                title: localizations.wallpaperSettings,
                icon: Icons.wallpaper_outlined,
                child: currentWallpaper.when(
                  data: (wallpaperPath) => _buildWallpaperSelector(context, ref, wallpaperPath, localizations),
                  loading: () => const _LoadingSection(),
                  error: (e, s) => _ErrorSection(localizations.error),
                ),
              ),

              const SizedBox(height: 16),

              // App Limitation
              _buildModernSection(
                context,
                title: localizations.appLimitation,
                icon: Icons.apps_outlined,
                child: const _AppLimitationWidget(),
              ),

              const SizedBox(height: 32), // Extra padding at bottom
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModernSection(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, indent: 20, endIndent: 20),
          child,
        ],
      ),
    );
  }

  Widget _buildThemeSelector(BuildContext context, WidgetRef ref, ThemeMode themeMode, AppLocalizations localizations) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          _buildModernRadioTile(
            context,
            title: localizations.lightMode,
            subtitle: 'Natural light theme',
            icon: Icons.light_mode_outlined,
            value: ThemeMode.light,
            groupValue: themeMode,
            onChanged: (value) {
              if (value != null) {
                ref.read(appThemeModeProvider.notifier).setThemeMode(value);
              }
            },
          ),
          _buildModernRadioTile(
            context,
            title: localizations.darkMode,
            subtitle: 'Peaceful dark theme',
            icon: Icons.dark_mode_outlined,
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
    );
  }

  Widget _buildLanguageSelector(BuildContext context, WidgetRef ref, Locale locale, AppLocalizations localizations) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          _buildModernRadioTile(
            context,
            title: localizations.indonesian,
            subtitle: 'Bahasa Indonesia',
            icon: Icons.translate_outlined,
            value: 'id',
            groupValue: locale.languageCode,
            onChanged: (value) {
              if (value != null) {
                ref.read(appLocaleProvider.notifier).setLocale(Locale(value));
              }
            },
          ),
          _buildModernRadioTile(
            context,
            title: localizations.english,
            subtitle: 'English Language',
            icon: Icons.translate_outlined,
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
    );
  }

  Widget _buildWallpaperSelector(BuildContext context, WidgetRef ref, String? wallpaperPath, AppLocalizations localizations) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Default wallpapers grid
          Text(
            localizations.defaultWallpapers,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: defaultWallpapers.length,
              itemBuilder: (context, index) {
                final wallpaper = defaultWallpapers[index];
                final isSelected = wallpaperPath == wallpaper;
                return Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: WallpaperPreview(
                    wallpaperPath: wallpaper,
                    isSelected: isSelected,
                    width: 80,
                    height: 120,
                    onTap: () async {
                      await ref.read(appWallpaperProvider.notifier).setWallpaper(wallpaper);
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(localizations.wallpaperChanged)),
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          
          // Custom wallpaper option
          _buildModernActionTile(
            context,
            title: localizations.chooseFromGallery,
            subtitle: localizations.customWallpaper,
            icon: Icons.photo_library_outlined,
            onTap: () async {
              await ref.read(appWallpaperProvider.notifier).pickWallpaperFromGallery();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(localizations.wallpaperChanged)),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildModernRadioTile<T>(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required T value,
    required T groupValue,
    required ValueChanged<T?> onChanged,
  }) {
    final isSelected = value == groupValue;
    
    return InkWell(
      onTap: () => onChanged(value),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected 
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                    : Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: isSelected 
                    ? Theme.of(context).colorScheme.primary 
                    : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                      color: isSelected 
                          ? Theme.of(context).colorScheme.primary 
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            Radio<T>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModernActionTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppLimitationWidget extends ConsumerWidget {
  const _AppLimitationWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final apps = ref.watch(installedAppsProvider);
    final monitoredApps = ref.watch(monitoredAppsProvider);

    return apps.when(
      data: (appList) => monitoredApps.when(
        data: (monitoredList) {
          final monitoredPackageNames = monitoredList.map((e) => e.packageName).toSet();
          return Column(
            children: appList.map((app) {
              final isMonitored = monitoredPackageNames.contains(app.packageName);
              return _buildAppLimitationTile(
                context,
                ref,
                app: app,
                isMonitored: isMonitored,
              );
            }).toList(),
          );
        },
        loading: () => Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(localizations.loadingApps),
          ),
        ),
        error: (e, s) => Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(localizations.error),
          ),
        ),
      ),
      loading: () => Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(localizations.loadingApps),
        ),
      ),
      error: (e, s) => Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(localizations.errorLoadingApps),
        ),
      ),
    );
  }

  Widget _buildAppLimitationTile(
    BuildContext context,
    WidgetRef ref, {
    required dynamic app,
    required bool isMonitored,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: SwitchListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        secondary: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.memory(
            app.icon!,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          app.name,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        value: isMonitored,
        activeColor: Theme.of(context).colorScheme.primary,
        onChanged: (value) async {
          await ref.read(isarServiceProvider).toggleAppMonitoring(app.packageName);
          ref.invalidate(monitoredAppsProvider);
        },
      ),
    );
  }
}

class _LoadingSection extends StatelessWidget {
  const _LoadingSection();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}

class _ErrorSection extends StatelessWidget {
  final String message;
  
  const _ErrorSection(this.message);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Text(
          message,
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      ),
    );
  }
}
