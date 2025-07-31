// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$installedAppsHash() => r'221c432c699ce51d357432d493be7d0274f2dfcd';

/// See also [installedApps].
@ProviderFor(installedApps)
final installedAppsProvider = AutoDisposeFutureProvider<List<AppInfo>>.internal(
  installedApps,
  name: r'installedAppsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$installedAppsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef InstalledAppsRef = AutoDisposeFutureProviderRef<List<AppInfo>>;
String _$monitoredAppsHash() => r'c0f233087aeb53fcd00b3c88c720deb011bcab10';

/// See also [monitoredApps].
@ProviderFor(monitoredApps)
final monitoredAppsProvider =
    AutoDisposeFutureProvider<List<AppUsageSettings>>.internal(
  monitoredApps,
  name: r'monitoredAppsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$monitoredAppsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MonitoredAppsRef = AutoDisposeFutureProviderRef<List<AppUsageSettings>>;
String _$userPointsHash() => r'9f931c0110a4c301679547d18610266ed57b2ecb';

/// See also [UserPoints].
@ProviderFor(UserPoints)
final userPointsProvider =
    AutoDisposeAsyncNotifierProvider<UserPoints, int>.internal(
  UserPoints.new,
  name: r'userPointsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userPointsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserPoints = AutoDisposeAsyncNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
