import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fortress_of_the_muslim/application/string/app_constraints.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vibration/vibration.dart';

class CounterState extends ChangeNotifier {
  final _counterBox = Hive.box(AppConstraints.keyCounter);

  int _dropDownValuesIndex = 0;

  int get getDropDownValuesIndex => _dropDownValuesIndex;

  set setDropDownValuesIndex(int dropDownIndex) {
    _dropDownValuesIndex = dropDownIndex;
    notifyListeners();
  }

  int _freeCountNumber = 0;

  int get getFreeCountNumber => _freeCountNumber;

  int _prayerCountNumber = 99;

  int get getPrayerCountNumber => _prayerCountNumber;

  int _oneHundredCountNumber = 100;

  int get getOneHundredCountNumber => _oneHundredCountNumber;

  Color _prayerCountColor = Colors.teal;

  Color get getPrayerCountColor => _prayerCountColor;

  CounterState() {
    _freeCountNumber =
        _counterBox.get(AppConstraints.keyFreeCountNumber, defaultValue: 0);
  }

  onCounterButtonTap() {
    switch (_dropDownValuesIndex) {
      case 0:
        increment();
        break;
      case 1:
        decrementPrayerNumber();
        break;
      case 2:
        decrementOneHundredNumber();
        break;
    }
  }

  increment() {
    _freeCountNumber++;
    HapticFeedback.vibrate();
    notifyListeners();
  }

  decrementPrayerNumber() {
    if (_prayerCountNumber > 0) {
      _prayerCountNumber--;
      HapticFeedback.vibrate();
      switch (_prayerCountNumber) {
        case 66:
          _prayerCountColor = Colors.blue;
          Vibration.vibrate(duration: 500);
          break;
        case 33:
          _prayerCountColor = Colors.red;
          Vibration.vibrate(duration: 500);
          break;
      }
      notifyListeners();
    } else {
      Vibration.vibrate(duration: 500);
    }
  }

  decrementOneHundredNumber() {
    if (_oneHundredCountNumber > 0) {
      _oneHundredCountNumber--;
      HapticFeedback.vibrate();
      notifyListeners();
    } else {
      Vibration.vibrate(duration: 500);
    }
  }

  resetCounterButtonTap() {
    switch (_dropDownValuesIndex) {
      case 0:
        resetFeeCountNumber();
        break;
      case 1:
        resetPrayerCounter();
        break;
      case 2:
        resetOnHundredCounter();
        break;
    }
  }

  resetFeeCountNumber() {
    _freeCountNumber = 0;
    _counterBox.put(AppConstraints.keyFreeCountNumber, 0);
    notifyListeners();
  }

  resetOnHundredCounter() {
    _oneHundredCountNumber = 100;
    notifyListeners();
  }

  resetPrayerCounter() {
    _prayerCountNumber = 99;
    notifyListeners();
  }

  @override
  void dispose() {
    _counterBox.put(AppConstraints.keyFreeCountNumber, _freeCountNumber);
    super.dispose();
  }
}
