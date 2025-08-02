import 'package:flutter/material.dart';
import 'package:muslim_launcher/data/datasource/local/isar_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'localization_provider.g.dart';

@riverpod
class AppLocale extends _$AppLocale {
  @override
  Future<Locale> build() async {
    final profile = await ref.watch(isarServiceProvider).getUserProfile();
    return Locale(profile.languageCode);
  }

  Future<void> setLocale(Locale locale) async {
    await ref.read(isarServiceProvider).updateLanguageCode(locale.languageCode);
    ref.invalidateSelf();
  }
}