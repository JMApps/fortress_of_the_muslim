import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../core/strings/app_constraints.dart';

class AppSettingsState extends ChangeNotifier {
  final _mainSettingsBox = Hive.box(AppConstraints.keyMainSettingsBox);

  AppSettingsState() {
    _appLocaleIndex = _mainSettingsBox.get(AppConstraints.keyAppLocaleIndex, defaultValue: _getDefLocaleIndex());
    _morningNotification = _mainSettingsBox.get(AppConstraints.keyMorningNotificationState, defaultValue: false);
    _eveningNotification = _mainSettingsBox.get(AppConstraints.keyEveningNotificationState, defaultValue: false);
    _morningNotificationTime = _mainSettingsBox.get(AppConstraints.keyMorningNotificationTime, defaultValue: DateTime(2024, 12, 31, 4, 0).toIso8601String());
    _eveningNotificationTime = _mainSettingsBox.get(AppConstraints.keyEveningNotificationTime, defaultValue: DateTime(2024, 12, 31, 16, 0).toIso8601String());
    _openWithChapters = _mainSettingsBox.get(AppConstraints.keyOpenWithChapters, defaultValue: false);
    _displayAlwaysOn = _mainSettingsBox.get(AppConstraints.keyDisplayAlwaysOn, defaultValue: true);
    _displayAlwaysOn ? WakelockPlus.enable() : WakelockPlus.disable();
    _appThemeColor = _mainSettingsBox.get(AppConstraints.keyAppThemeColor, defaultValue: Colors.teal.value);
    _themeModeIndex = _mainSettingsBox.get(AppConstraints.keyThemeModeIndex, defaultValue: 2);
    _showCollections = _mainSettingsBox.get(AppConstraints.keyShowCollections, defaultValue: true);
  }

  late bool _morningNotification;
  late bool _eveningNotification;

  late String _morningNotificationTime;
  late String _eveningNotificationTime;

  late bool _openWithChapters;
  late bool _displayAlwaysOn;
  late int _appThemeColor;
  late int _themeModeIndex;
  late int _appLocaleIndex;
  late bool _showCollections;

  int _getDefLocaleIndex() {
    final deviceLocale = PlatformDispatcher.instance.locale;
    switch (deviceLocale.languageCode) {
      case 'ky':
        return 1;
      case 'kz':
        return 2;
      default:
        return 0;
    }
  }

  bool get getMorningNotification => _morningNotification;

  bool get getEveningNotification => _eveningNotification;

  DateTime get getMorningNotificationTime => DateTime.parse(_morningNotificationTime);

  DateTime get getEveningNotificationTime => DateTime.parse(_eveningNotificationTime);

  bool get getOpenWithChapters => _openWithChapters;

  bool get getDisplayAlwaysOn => _displayAlwaysOn;

  int get getAppThemeColor => _appThemeColor;

  int get getAppLocaleIndex => _appLocaleIndex;

  bool get getShowCollections => _showCollections;

  ThemeMode get getThemeMode {
    late ThemeMode currentTheme;
    switch(_themeModeIndex) {
      case 0:
        currentTheme = ThemeMode.light;
        break;
      case 1:
        currentTheme = ThemeMode.dark;
        break;
      case 2:
        currentTheme = ThemeMode.system;
        break;
      default: currentTheme = ThemeMode.system;
    }
    return currentTheme;
  }

  int get getThemeModeIndex => _themeModeIndex;

  set setMorningNotification(bool value) {
    _morningNotification = value;
    _saveSetting(AppConstraints.keyMorningNotificationState, value);
    notifyListeners();
  }

  set setMorningNotificationTime(DateTime time) {
    _morningNotificationTime = time.toIso8601String();
    _saveSetting(AppConstraints.keyMorningNotificationTime, time.toIso8601String());
    notifyListeners();
  }

  set setEveningNotification(bool value) {
    _eveningNotification = value;
    _saveSetting(AppConstraints.keyEveningNotificationState, value);
    notifyListeners();
  }

  set setEveningNotificationTime(DateTime time) {
    _eveningNotificationTime = time.toIso8601String();
    _saveSetting(AppConstraints.keyEveningNotificationTime, time.toIso8601String());
    notifyListeners();
  }

  set setOpenWithChapters(bool value) {
    _openWithChapters = value;
    _saveSetting(AppConstraints.keyOpenWithChapters, value);
    notifyListeners();
  }

  set setDisplayAlwaysOn(bool value) {
    _displayAlwaysOn = value;
    value ? WakelockPlus.enable() : WakelockPlus.disable();
    _saveSetting(AppConstraints.keyDisplayAlwaysOn, value);
    notifyListeners();
  }

  set setAppThemeColor(int color) {
    _appThemeColor = color;
    _saveSetting(AppConstraints.keyAppThemeColor, color);
    notifyListeners();
  }

  set setThemeModeIndex(int themeIndex) {
    _themeModeIndex = themeIndex;
    _saveSetting(AppConstraints.keyThemeModeIndex, themeIndex);
    notifyListeners();
  }

  set setAppLocaleIndex(int index) {
    _appLocaleIndex = index;
    _saveSetting(AppConstraints.keyAppLocaleIndex, index);
    notifyListeners();
  }

  set setShowCollections(bool state) {
    _showCollections = state;
    _saveSetting(AppConstraints.keyShowCollections, state);
    notifyListeners();
  }

  void _saveSetting(String key, dynamic value) async {
    await _mainSettingsBox.put(key, value);
  }
}