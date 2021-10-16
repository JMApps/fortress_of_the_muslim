import 'package:flutter/material.dart';

class FloatingCounterState with ChangeNotifier {
  int _count = 0;

  int get getCount => _count;

  bool _isCountButtonShow = false;

  bool get getIsCountButtonShow => _isCountButtonShow;

  updateCountValue() {
    if (_count < 101) {
      _count++;
    }
    if (_count == 101) {
      _count = 0;
    }
    notifyListeners();
  }

  updateButtonCountShow(bool state) {
    _isCountButtonShow = state;
    notifyListeners();
  }

  setCount() {
    _count = 0;
    notifyListeners();
  }
}
