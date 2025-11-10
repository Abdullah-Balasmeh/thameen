import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  static const _localeKey = 'app_locale';
  Locale? _locale;

  Locale? get locale => _locale;

  LocaleProvider() {
    _loadLocaleFromPrefs();
  }

  Future<void> _loadLocaleFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_localeKey);
    if (code != null) {
      _locale = Locale(code);
      notifyListeners();
    }
  }

  Future<void> toggleLocale() async {
    final prefs = await SharedPreferences.getInstance();
    if (_locale?.languageCode == 'ar') {
      _locale = const Locale('en');
      await prefs.setString(_localeKey, 'en');
    } else {
      _locale = const Locale('ar');
      await prefs.setString(_localeKey, 'ar');
    }
    notifyListeners();
  }
}
