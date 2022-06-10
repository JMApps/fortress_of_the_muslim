import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock/wakelock.dart';

class AppSettingsState with ChangeNotifier {
  bool isRunChapters = false;

  bool get getIsRunChapters => isRunChapters;

  bool isLastChapter = true;

  bool get getIsLastChapter => isLastChapter;

  int lastChapterNumber = 27;

  int get getLastChapterNumber => lastChapterNumber;

  bool isNotification = true;

  bool get getIsNotification => isNotification;

  bool isWakeLock = true;

  bool get getIsWakeLock => isWakeLock;

  ThemeMode themeMode = ThemeMode.system;

  bool isDarkTheme = false;

  ThemeMode get isDarkMode => themeMode = ThemeMode.dark;

  changeRunWithChapters(bool state) {
    isRunChapters = state;
    saveBoolValue('key_is_run_chapters', state);
    notifyListeners();
  }

  changeShowLastChapter(bool state) {
    isLastChapter = state;
    saveBoolValue('key_is_show_last_chapter', state);
    notifyListeners();
  }

  changeLastChapterNumber(int number) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setInt('key_last_chapter_number', number);
    lastChapterNumber = number;
    notifyListeners();
  }

  changeShowNotification(bool state) {
    isNotification = state;
    saveBoolValue('key_is_show_notification', state);
    notifyListeners();
  }

  changeWakeLock(bool state) async {
    isWakeLock = state;
    saveBoolValue('key_is_wake_lock', state);
    notifyListeners();
  }

  changeTheme(bool state) async {
    isDarkTheme = state;
    isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    saveBoolValue('key_theme_mode', state);
    notifyListeners();
  }

  loadLastPreferencesState() async {
    final preferences = await SharedPreferences.getInstance();
    isRunChapters = preferences.getBool('key_is_run_chapters') ?? false;
    isLastChapter = preferences.getBool('key_is_show_last_chapter') ?? true;
    lastChapterNumber = preferences.getInt('key_last_chapter_number') ?? 27;
    isNotification = preferences.getBool('key_is_show_notification') ?? true;
    isWakeLock = preferences.getBool('key_is_wake_lock') ?? true;
    isWakeLock ? Wakelock.enable() : Wakelock.disable();
    isDarkTheme = preferences.getBool('key_theme_mode') ?? false;
    themeMode = isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  saveBoolValue(String key, bool value) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool(key, value);
  }
}
