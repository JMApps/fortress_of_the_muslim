import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vibration/vibration.dart';

import '../../core/strings/app_constraints.dart';

class AppCounterState extends ChangeNotifier {
  final _counterSettings = Hive.box(AppConstraints.keyCounterBox);

  AppCounterState() {
    _freeCount = _counterSettings.get(AppConstraints.keyFreeCountValue, defaultValue: 0);
  }

  late int _freeCount;
  int _prayerCount = 99;
  int _hundredCount = 100;
  int _valuesIndex = 0;
  bool _valueShowState = true;
  bool _vibrationState = true;

  int get getFreeCount => _freeCount;
  int get getPrayerCount => _prayerCount;
  int get getHundredCount => _hundredCount;
  int get getValuesIndex => _valuesIndex;
  bool get getValueShowState => _valueShowState;
  bool get getVibrationState => _vibrationState;

  set setValuesIndex(int index) {
    _valuesIndex = index;
    notifyListeners();
  }

  set setValueShowState(bool state) {
    _valueShowState = state;
    notifyListeners();
  }

  set setVibrationState(bool state) {
    _vibrationState = state;
    notifyListeners();
  }

  String getCountValue() {
    switch (_valuesIndex) {
      case 0:
        return _freeCount.toString();
      case 1:
        return _prayerCount.toString();
      case 2:
        return _hundredCount.toString();
      default:
        return '0';
    }
  }

  void onCountClick() {
    switch (_valuesIndex) {
      case 0:
        _updateFreeCount();
        break;
      case 1:
        _updatePrayerCount();
        break;
      case 2:
        _updateHundredCount();
        break;
    }
    _triggerHapticFeedback();
    notifyListeners();
  }

  void resetCounter() {
    switch (_valuesIndex) {
      case 0:
        _freeCount = 0;
        _counterSettings.put(AppConstraints.keyFreeCountValue, _freeCount);
        break;
      case 1:
        _prayerCount = 99;
        break;
      case 2:
        _hundredCount = 100;
        break;
    }
    notifyListeners();
  }

  void _updateFreeCount() {
    _freeCount++;
    _counterSettings.put(AppConstraints.keyFreeCountValue, _freeCount);
  }

  void _updatePrayerCount() {
    if (_prayerCount > 0) {
      _prayerCount--;
    } else {
      _vibrateIfEnabled();
    }
  }

  void _updateHundredCount() {
    if (_hundredCount > 0) {
      _hundredCount--;
    } else {
      _vibrateIfEnabled();
    }
  }

  void _vibrateIfEnabled() {
    if (_vibrationState) {
      Vibration.vibrate();
    }
  }

  void _triggerHapticFeedback() {
    if (_vibrationState) {
      HapticFeedback.heavyImpact();
    }
  }
}