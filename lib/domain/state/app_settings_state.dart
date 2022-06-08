import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsState with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  bool isChapterMain = false;

  bool get getIsChapterMain => isChapterMain;

  toggleTheme(bool isActive) async {
    themeMode = isActive ? ThemeMode.dark : ThemeMode.light;
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool('key_dark_theme', isActive);
    notifyListeners();
  }

  ifChaptersFirst(bool state) async {
    isChapterMain = state;
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool('key_is_chapters_first', state);
    notifyListeners();
  }

  loadLastPreferencesState() async {
    final preferences = await SharedPreferences.getInstance();
    final isDarkMode = preferences.getBool('key_dark_theme') ?? false;
    isChapterMain = preferences.getBool('key_is_chapters_first') ?? false;
    themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

}
