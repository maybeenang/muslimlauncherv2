// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallpaper_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appWallpaperHash() => r'a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0';

/// See also [AppWallpaper].
@ProviderFor(AppWallpaper)
final appWallpaperProvider =
    AutoDisposeAsyncNotifierProvider<AppWallpaper, String?>.internal(
  AppWallpaper.new,
  name: r'appWallpaperProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appWallpaperHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppWallpaper = AutoDisposeAsyncNotifier<String?>;

String _$isAssetWallpaperHash() => r'b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1';

/// Provider for checking if current wallpaper is from assets or custom
///
/// Copied from [isAssetWallpaper].
@ProviderFor(isAssetWallpaper)
final isAssetWallpaperProvider = AutoDisposeProvider<bool>.internal(
  isAssetWallpaper,
  name: r'isAssetWallpaperProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isAssetWallpaperHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsAssetWallpaperRef = AutoDisposeProviderRef<bool>;

String _$wallpaperDisplayNameHash() => r'c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2';

/// Provider for getting wallpaper display name
///
/// Copied from [wallpaperDisplayName].
@ProviderFor(wallpaperDisplayName)
final wallpaperDisplayNameProvider = AutoDisposeProvider<String>.internal(
  wallpaperDisplayName,
  name: r'wallpaperDisplayNameProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$wallpaperDisplayNameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WallpaperDisplayNameRef = AutoDisposeProviderRef<String>;