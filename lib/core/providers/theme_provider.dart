import 'package:flutter/material.dart';
import 'package:muslim_launcher/data/datasource/local/isar_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class AppThemeMode extends _$AppThemeMode {
  @override
  Future<ThemeMode> build() async {
    final profile = await ref.watch(isarServiceProvider).getUserProfile();
    return profile.themeMode == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final themeString = mode == ThemeMode.dark ? 'dark' : 'light';
    await ref.read(isarServiceProvider).updateThemeMode(themeString);
    ref.invalidateSelf();
  }
}