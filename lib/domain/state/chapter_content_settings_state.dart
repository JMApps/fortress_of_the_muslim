import 'package:flutter/material.dart';

class ChapterContentSettingsState with ChangeNotifier {
  DateTime now = DateTime.now();

  final List<bool> _isDayNightSelected = [true, false];

  final List<bool> _isTextAlignSelected = [true, false, false, false];

  List<bool> get getIsDayNightSelected => _isDayNightSelected;

  List<bool> get getIsTextAlignSelected => _isTextAlignSelected;

  int _toggleDayNightIndex = 0;

  int _toggleTextAlignIndex = 0;

  bool _isDay = true;

  bool get getIsDay => _isDay;

  changeDayNight(bool state) {
    _isDay = state;
    notifyListeners();
  }

  updateToggleDayNight(int index) {
    _toggleDayNightIndex = index;
    _toggleDayNightIndex == 0 ? _isDay = true : _isDay = false;
    for (int i = 0; i < _isDayNightSelected.length; i++) {
      _isDayNightSelected[i] = i == _toggleDayNightIndex;
    }
    notifyListeners();
  }

  updateToggleTextAlign(int index) {
    _toggleTextAlignIndex = index;
    for (int i = 0; i < _isTextAlignSelected.length; i++) {
      _isTextAlignSelected[i] = i == _toggleTextAlignIndex;
    }
    notifyListeners();
  }
}
