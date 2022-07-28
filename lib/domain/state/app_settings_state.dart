import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wakelock/wakelock.dart';

class AppSettingsState with ChangeNotifier {
  var mainSettingsBox = Hive.box(Constants.keyMainSettingBox);

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

  ThemeMode get getThemeMode => themeMode;

  bool isDarkTheme = false;

  bool isAdaptiveTheme = true;

  changeRunWithChapters(bool state) {
    isRunChapters = state;
    mainSettingsBox.put(Constants.keyIsRunChapters, state);
    notifyListeners();
  }

  changeShowLastChapter(bool state) {
    isLastChapter = state;
    mainSettingsBox.put(Constants.keyIsShowLastChapter, state);
    notifyListeners();
  }

  changeLastChapterNumber(int number) {
    lastChapterNumber = number;
    mainSettingsBox.put(Constants.keyLastChapterNumber, number);
    notifyListeners();
  }

  changeShowNotification(bool state) {
    isNotification = state;
    mainSettingsBox.put(Constants.keyIsShowNotification, state);
    notifyListeners();
  }

  changeWakeLock(bool state) {
    isWakeLock = state;
    mainSettingsBox.put(Constants.keyIsWakeLock, state);
    notifyListeners();
  }

  changeTheme(bool state) {
    if (!isAdaptiveTheme) {
      state ? ThemeMode.dark : ThemeMode.light;
      mainSettingsBox.put(Constants.keyThemeMode, state);
      notifyListeners();
    }
  }

  changeAdaptiveTheme(bool state) {
    isAdaptiveTheme = state;
    ThemeMode.system;
    mainSettingsBox.put(Constants.keyThemeAdaptiveMode, state);
    notifyListeners();
  }

  initMainSettings() {
    isRunChapters = mainSettingsBox.get(Constants.keyIsRunChapters, defaultValue: false);
    isLastChapter = mainSettingsBox.get(Constants.keyIsShowLastChapter, defaultValue: true);
    lastChapterNumber = mainSettingsBox.get(Constants.keyLastChapterNumber, defaultValue: 27);
    isNotification = mainSettingsBox.get(Constants.keyIsShowNotification, defaultValue: true);
    isWakeLock = mainSettingsBox.get(Constants.keyIsWakeLock, defaultValue: true);
    isWakeLock ? Wakelock.enable() : Wakelock.disable();
    isDarkTheme = mainSettingsBox.get(Constants.keyThemeMode, defaultValue: false);
    isAdaptiveTheme = mainSettingsBox.get(Constants.keyThemeAdaptiveMode, defaultValue: true);
    if (!isAdaptiveTheme) {
      themeMode = isDarkTheme ? ThemeMode.dark : ThemeMode.light;
    } else {
      themeMode = ThemeMode.system;
    }
  }
}
