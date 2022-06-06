import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsState with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  toggleTheme(bool isActive) async {
    themeMode = isActive ? ThemeMode.dark : ThemeMode.light;
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool('key_dark_theme', isActive);
    notifyListeners();
  }

  useLatThemeState() async {
    final preferences = await SharedPreferences.getInstance();
    final isDarkMode = preferences.getBool('key_dark_theme') ?? false;
    themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
