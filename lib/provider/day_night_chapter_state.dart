import 'package:flutter/material.dart';

class DayNightChapterState with ChangeNotifier {
  var _time = DateTime.now();

  bool _dayNight = true;

  bool get getDayNight => _dayNight;

  initDayNightState() {
    _time.hour < 12 ? _dayNight = true : _dayNight = false;
  }

  updateDayNightState() {
    _dayNight = !_dayNight;
    notifyListeners();
  }
}
