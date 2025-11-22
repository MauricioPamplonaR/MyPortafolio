
import 'package:flutter/material.dart';
import 'package:portafolio_app_web/shared/app_shared_pref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_theme_controller.g.dart';

@riverpod
class AppThemeController extends _$AppThemeController {
  
  @override
  Future<ThemeMode> build() async {
    return AppSharedPref.getAppTheme();
  }

  void changeTheme(ThemeMode newTheme) async {
    await AppSharedPref.setAppTheme(newTheme == ThemeMode.dark ? 'dark' : 'light');
    update((state) => newTheme);
  }
  
}