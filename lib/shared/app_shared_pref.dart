import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  static const String localeKey = 'app_locale';
  static const String themeKey = 'app_theme';

  static Future<void> setAppLocale(String locale) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString(localeKey, locale);
  }

  static Future<String> getAppLocale() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString(localeKey) ?? 'en';
  }

    static Future<void> setAppTheme(String theme) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString(themeKey, theme);
  }

  static Future<ThemeMode> getAppTheme() async {
    final sharedPref = await SharedPreferences.getInstance();
    final theme = sharedPref.getString(themeKey);
    return theme == 'light' ? ThemeMode.light : ThemeMode.dark;
  }
}