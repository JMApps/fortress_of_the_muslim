import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContentCounterState extends ChangeNotifier {
  late int _count;

  late int _defCount;

  int get getCount => _count;

  ContentCounterState(this._count) {
    _defCount = _count;
  }

  get decrement {
    if (_count >= 1) {
      _count--;
      HapticFeedback.mediumImpact();
      notifyListeners();
    } else {
      HapticFeedback.heavyImpact();
      notifyListeners();
    }
  }

  get getDefaultCount {
    _count = _defCount;
    HapticFeedback.lightImpact();
    notifyListeners();
  }
}
