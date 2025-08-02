import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:muslim_launcher/data/datasource/local/isar_service.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

part 'wallpaper_provider.g.dart';

// Default wallpapers available in the app
const List<String> defaultWallpapers = [
  'assets/wallpapers/islamic_green_light.svg',
  'assets/wallpapers/islamic_green_dark.svg',
  'assets/wallpapers/forest_green.svg',
  'assets/wallpapers/peaceful_teal.svg',
  'assets/wallpapers/minimalist_light.svg',
];

@riverpod
class AppWallpaper extends _$AppWallpaper {
  @override
  Future<String?> build() async {
    final isarService = ref.read(isarServiceProvider);
    final profile = await isarService.getUserProfile();
    return profile?.wallpaperPath;
  }

  /// Set wallpaper from asset path
  Future<void> setWallpaper(String wallpaperPath) async {
    final isarService = ref.read(isarServiceProvider);
    await isarService.setWallpaper(wallpaperPath);
    
    // Update the state
    state = AsyncValue.data(wallpaperPath);
  }

  /// Pick wallpaper from gallery
  Future<void> pickWallpaperFromGallery() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );
      
      if (image != null) {
        await setWallpaper(image.path);
      }
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  /// Remove custom wallpaper (set to null for default)
  Future<void> removeWallpaper() async {
    await setWallpaper('');
  }
}

/// Provider for checking if current wallpaper is from assets or custom
@riverpod
bool isAssetWallpaper(IsAssetWallpaperRef ref) {
  final wallpaper = ref.watch(appWallpaperProvider);
  return wallpaper.maybeWhen(
    data: (path) => path != null && path.startsWith('assets/'),
    orElse: () => true,
  );
}

/// Provider for getting wallpaper display name
@riverpod
String wallpaperDisplayName(WallpaperDisplayNameRef ref) {
  final wallpaper = ref.watch(appWallpaperProvider);
  return wallpaper.maybeWhen(
    data: (path) {
      if (path == null || path.isEmpty) return 'Default';
      if (path.startsWith('assets/')) {
        final fileName = path.split('/').last.split('.').first;
        // Convert snake_case to Title Case
        return fileName
            .split('_')
            .map((word) => word[0].toUpperCase() + word.substring(1))
            .join(' ');
      }
      return 'Custom';
    },
    orElse: () => 'Default',
  );
}