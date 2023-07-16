import 'package:flu_wake_lock/flu_wake_lock.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/string/app_constraints.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainAppSettingsState extends ChangeNotifier {

  final _appSettingsBox = Hive.box(AppConstraints.keyMainSettings);

  bool _isRunMainChapters = false;

  bool _isDisplayOn = true;

  bool _isMorningNotification = true;

  bool _isEveningNotification = true;

  bool _isAdaptiveTheme = true;

  bool _isUserTheme = false;

  bool get getIsRunMainChapters => _isRunMainChapters;

  bool get getIsDisplayOn => _isDisplayOn;

  bool get getIsMorningNotification => _isMorningNotification;

  bool get getIsEveningNotification => _isEveningNotification;

  bool get getIsAdaptiveTheme => _isAdaptiveTheme;

  bool get getIsUserTheme => _isUserTheme;

  String _defaultMorningNotificationTime = '2023-12-31T04:00:00.0';

  String get getDefaultMorningNotificationTime => _defaultMorningNotificationTime;

  String _defaultEveningNotificationTime = '2023-12-31T17:00:00.0';

  String get getDefaultEveningNotificationTime => _defaultEveningNotificationTime;

  MainAppSettingsState() {
    _isRunMainChapters = _appSettingsBox.get(AppConstraints.keyRunChapters, defaultValue: false);
    _isDisplayOn = _appSettingsBox.get(AppConstraints.keyDisplayOn, defaultValue: true);
    _isMorningNotification = _appSettingsBox.get(AppConstraints.keyMorningNotification, defaultValue: true);
    _isEveningNotification = _appSettingsBox.get(AppConstraints.keyEveningNotification, defaultValue: true);
    _isAdaptiveTheme = _appSettingsBox.get(AppConstraints.keyAdaptiveTheme, defaultValue: true);
    _isUserTheme = _appSettingsBox.get(AppConstraints.keyUserTheme, defaultValue: false);
    _defaultMorningNotificationTime = _appSettingsBox.get(AppConstraints.keyMorningNotificationTime, defaultValue: '2023-12-31T04:00:00.0');
    _defaultEveningNotificationTime = _appSettingsBox.get(AppConstraints.keyEveningNotificationTime, defaultValue: '2023-12-31T17:00:00.0');
  }

  runManinChapters() {
    _isRunMainChapters = !_isRunMainChapters;
    _appSettingsBox.put(AppConstraints.keyRunChapters, _isRunMainChapters);
    notifyListeners();
  }

  displayOnOff() {
    _isDisplayOn = !_isDisplayOn;
    _isDisplayOn ? FluWakeLock().enable() : FluWakeLock().disable();
    _appSettingsBox.put(AppConstraints.keyDisplayOn, _isDisplayOn);
    notifyListeners();
  }

  morningNotification() {
    _isMorningNotification = !_isMorningNotification;
    _appSettingsBox.put(AppConstraints.keyMorningNotification, _isMorningNotification);
    notifyListeners();
  }

  changeMorningTimeOfDay(String newTime) {
    _defaultMorningNotificationTime = newTime;
    _appSettingsBox.put(AppConstraints.keyMorningNotificationTime, _defaultMorningNotificationTime);
    notifyListeners();
  }

  eveningNotification() {
    _isEveningNotification = !_isEveningNotification;
    _appSettingsBox.put(AppConstraints.keyEveningNotification, _isEveningNotification);
    notifyListeners();
  }

  changeEveningTimeOfDay(String newTime) {
    _defaultEveningNotificationTime = newTime;
    _appSettingsBox.put(AppConstraints.keyEveningNotificationTime, _defaultEveningNotificationTime);
    notifyListeners();
  }

  adaptiveTheme() {
    _isAdaptiveTheme = !_isAdaptiveTheme;
    _appSettingsBox.put(AppConstraints.keyAdaptiveTheme, _isAdaptiveTheme);
    notifyListeners();
  }

  userTheme() {
    _isUserTheme = !_isUserTheme;
    _appSettingsBox.put(AppConstraints.keyUserTheme, _isUserTheme);
    notifyListeners();
  }
}
