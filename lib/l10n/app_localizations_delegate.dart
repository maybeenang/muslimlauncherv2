import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'app_localizations.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['id', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(_getLocalization(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;

  AppLocalizations _getLocalization(Locale locale) {
    switch (locale.languageCode) {
      case 'id':
        return AppLocalizationsId();
      case 'en':
        return AppLocalizationsEn();
      default:
        return AppLocalizationsId(); // Default to Indonesian
    }
  }
}