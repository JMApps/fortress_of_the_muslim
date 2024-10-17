import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../core/strings/app_constraints.dart';
import '../../core/strings/app_strings.dart';
import '../../data/services/notification/notification_service.dart';

class AppSettingsState extends ChangeNotifier {
  final _mainSettingsBox = Hive.box(AppConstraints.keyMainSettingsBox);
  final NotificationService _notificationService = NotificationService();

  AppSettingsState() {
    _morningNotification = _mainSettingsBox.get(AppConstraints.keyMorningNotificationState, defaultValue: true);
    _eveningNotification = _mainSettingsBox.get(AppConstraints.keyEveningNotificationState, defaultValue: true);
    _morningNotificationTime = _mainSettingsBox.get(AppConstraints.keyMorningNotificationTime, defaultValue: DateTime(2024, 12, 31, 4, 0).toIso8601String());
    _eveningNotificationTime = _mainSettingsBox.get(AppConstraints.keyEveningNotificationTime, defaultValue: DateTime(2024, 12, 31, 16, 0).toIso8601String());

    if (_morningNotification) {
      _notificationService.timeNotifications(id: NotificationService.morningNotificationID, body: AppStrings.morningPrayers, dateTime: getMorningNotificationTime);
    } else {
      _notificationService.cancelNotificationWithId(NotificationService.morningNotificationID);
    }

    if (_eveningNotification) {
      _notificationService.timeNotifications(id: NotificationService.eveningNotificationID, body: AppStrings.eveningPrayers, dateTime: getEveningNotificationTime);
    } else {
      _notificationService.cancelNotificationWithId(NotificationService.eveningNotificationID);
    }

    _openWithChapters = _mainSettingsBox.get(AppConstraints.keyOpenWithChapters, defaultValue: false);
    _displayAlwaysOn = _mainSettingsBox.get(AppConstraints.keyDisplayAlwaysOn, defaultValue: true);
    _displayAlwaysOn ? WakelockPlus.enable() : WakelockPlus.disable();
    _appThemeColor = _mainSettingsBox.get(AppConstraints.keyAppThemeColor, defaultValue: Colors.teal.value);
    _themeModeIndex = _mainSettingsBox.get(AppConstraints.keyThemeModeIndex, defaultValue: 2);
  }

  late bool _morningNotification;
  late bool _eveningNotification;

  late String _morningNotificationTime;
  late String _eveningNotificationTime;

  late bool _openWithChapters;
  late bool _displayAlwaysOn;
  late int _appThemeColor;
  late int _themeModeIndex;

  bool get getMorningNotification => _morningNotification;

  bool get getEveningNotification => _eveningNotification;

  DateTime get getMorningNotificationTime => DateTime.parse(_morningNotificationTime);

  DateTime get getEveningNotificationTime => DateTime.parse(_eveningNotificationTime);

  bool get getOpenWithChapters => _openWithChapters;

  bool get getDisplayAlwaysOn => _displayAlwaysOn;

  int get getAppThemeColor => _appThemeColor;

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
    if (value) {
      _notificationService.timeNotifications(id: NotificationService.morningNotificationID, body: AppStrings.morningPrayers, dateTime: getMorningNotificationTime);
    } else {
      _notificationService.cancelNotificationWithId(NotificationService.morningNotificationID);
    }
    _saveSetting(AppConstraints.keyMorningNotificationState, value);
    notifyListeners();
  }

  set setEveningNotification(bool value) {
    _eveningNotification = value;
    if (value) {
      _notificationService.timeNotifications(id: NotificationService.eveningNotificationID, body: AppStrings.eveningPrayers, dateTime: getEveningNotificationTime);
    } else {
      _notificationService.cancelNotificationWithId(NotificationService.eveningNotificationID);
    }
    _saveSetting(AppConstraints.keyEveningNotificationState, value);
    notifyListeners();
  }

  set setMorningNotificationTime(DateTime time) {
    _morningNotificationTime = time.toIso8601String();
    _notificationService.timeNotifications(id: NotificationService.morningNotificationID, body: AppStrings.morningPrayers, dateTime: time);
    _saveSetting(AppConstraints.keyMorningNotificationTime, time.toIso8601String());
    notifyListeners();
  }

  set setEveningNotificationTime(DateTime time) {
    _eveningNotificationTime = time.toIso8601String();
    _notificationService.timeNotifications(id: NotificationService.eveningNotificationID, body: AppStrings.eveningPrayers, dateTime: time);
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

  void _saveSetting(String key, dynamic value) async {
    await _mainSettingsBox.put(key, value);
  }
}