import 'package:flutter/material.dart';

class ChapterContentSettingsState with ChangeNotifier {
  DateTime now = DateTime.now();

  final List<bool> _isSelected = [true, false];

  int _toggleButtonIndex = 0;

  List<bool> get getIsSelected => _isSelected;

  bool _isDay = true;

  bool get getIsDay => _isDay;

  changeDayNight(bool state) {
    _isDay = state;
    notifyListeners();
  }

  updateToggleText(int index) {
    _toggleButtonIndex = index;
    _toggleButtonIndex == 0 ? _isDay = true : _isDay = false;
    for (int i = 0; i < _isSelected.length; i++) {
      _isSelected[i] = i == _toggleButtonIndex;
    }
    notifyListeners();
  }
}
