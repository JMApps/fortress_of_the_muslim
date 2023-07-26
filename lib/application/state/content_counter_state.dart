import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContentCounterState extends ChangeNotifier {
  int _count = 0;

  int get getCount => _count;

  bool _counterButtonIsShow = true;

  bool get getCounterButtonIsShow => _counterButtonIsShow;

  ContentCounterState(this._count);

  get decrement {
    if (_count > 1) {
      _count--;
      HapticFeedback.mediumImpact();
      notifyListeners();
    } else {
      _counterButtonIsShow = false;
      notifyListeners();
    }
  }
}
