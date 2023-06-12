import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fortress_of_the_muslim/application/string/app_constraints.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
    _freeCountNumber = _counterBox.get(AppConstraints.keyFreeCountNumber, defaultValue: 0);
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
      switch (_prayerCountNumber) {
        case 66:
          _prayerCountColor = Colors.blue;
          HapticFeedback.vibrate();
          break;
        case 33:
          _prayerCountColor = Colors.red;
          HapticFeedback.vibrate();
          break;
      }
      notifyListeners();
    } else {
      HapticFeedback.vibrate();
    }
  }

  decrementOneHundredNumber() {
    if (_oneHundredCountNumber > 0) {
      _oneHundredCountNumber--;
      notifyListeners();
    } else {
      HapticFeedback.vibrate();
    }
  }

  resetFeeCountNumber() {
    _freeCountNumber = 0;
    _counterBox.put(AppConstraints.keyFreeCountNumber, 0);
    notifyListeners();
  }

  @override
  void dispose() {
    _counterBox.put(AppConstraints.keyFreeCountNumber, _freeCountNumber);
    super.dispose();
  }
}
