import 'package:flutter/material.dart';

class ChapterContentSettingsState with ChangeNotifier {
  DateTime now = DateTime.now();

  final List<bool> _isDayNightSelected = [true, false];

  final List<bool> _isTextAlignSelected = [true, false, false, false];

  List<bool> get getIsDayNightSelected => _isDayNightSelected;

  List<bool> get getIsTextAlignSelected => _isTextAlignSelected;

  int _toggleDayNightIndex = 0;

  int _toggleTextAlignIndex = 0;

  int _textArabicSize = 16;

  int get getTextArabicSize => _textArabicSize;

  int _textTextTranslateSize = 16;

  int get getTextTranslateSize => _textTextTranslateSize;

  Color? _arabicTextColor = Colors.red[900];

  Color? get getArabicTextColor => _arabicTextColor;

  Color? _transcriptionTextColor = Colors.green[900];

  Color? get getTranscriptionTextColor => _transcriptionTextColor;

  Color? _translateTextColor = Colors.black;

  Color? get getTranslateTextColor => _translateTextColor;

  bool _isDefaultColors = false;

  bool get getIsDefaultColors => _isDefaultColors;

  bool _isTranscriptionShow = true;

  bool get getIsTranscriptionShow => _isTranscriptionShow;

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

  changeTextArabicSize(double size) {
    _textArabicSize = size.toInt();
    notifyListeners();
  }

  changeTextTranslateSize(double size) {
    _textTextTranslateSize = size.toInt();
    notifyListeners();
  }

  changeTextArabicColor(Color color) {
    _arabicTextColor = color;
    notifyListeners();
  }

  changeTextTranscriptionColor(Color color) {
    _transcriptionTextColor = color;
    notifyListeners();
  }

  changeTextTranslateColor(Color color) {
    _translateTextColor = color;
    notifyListeners();
  }

  changeDefaultColorsState(bool state) {
    _isDefaultColors = state;
    notifyListeners();
  }

  changeTranscriptionShow(bool state) {
    _isTranscriptionShow = state;
    notifyListeners();
  }
}
