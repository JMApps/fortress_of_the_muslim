import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

class SupplicationCountState extends ChangeNotifier {

  int _supplicationCount;

  late int _defCountValue;

  SupplicationCountState(this._supplicationCount) {
    _defCountValue = _supplicationCount;
  }

  int get getSupplicationCount => _supplicationCount;


  void onCountClick() {
    if (_supplicationCount > 0) {
      _supplicationCount--;
      HapticFeedback.heavyImpact();
      notifyListeners();
    } else {
      Vibration.vibrate();
    }
  }

  void resetCount() {
    _supplicationCount = _defCountValue;
    notifyListeners();
    Vibration.vibrate();
  }
}