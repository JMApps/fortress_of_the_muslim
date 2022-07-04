import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChapterContentSettingsState with ChangeNotifier {
  DateTime now = DateTime.now();

  final List<bool> _isDayNightSelected = [true, false];

  final List<bool> _isTextAlignSelected = [false, false, false, true];

  List<bool> get getIsDayNightSelected => _isDayNightSelected;

  List<bool> get getIsTextAlignSelected => _isTextAlignSelected;

  int _toggleDayNightIndex = 0;

  int _toggleTextAlignIndex = 3;

  int get getToggleTextAlignIndex => _toggleTextAlignIndex;

  int _textArabicSize = 16;

  int get getTextArabicSize => _textArabicSize;

  int _textTextTranslateSize = 16;

  int get getTextTranslateSize => _textTextTranslateSize;

  int _arabicTextColor = Colors.red[900]!.value;

  int get getArabicTextColor => _arabicTextColor;

  int _transcriptionTextColor = Colors.teal[900]!.value;

  int get getTranscriptionTextColor => _transcriptionTextColor;

  int _translateTextColor = Colors.black.value;

  int get getTranslateTextColor => _translateTextColor;

  bool _isDefaultColors = true;

  bool get getIsDefaultColors => _isDefaultColors;

  bool _isTranscriptionShow = true;

  bool get getIsTranscriptionShow => _isTranscriptionShow;

  bool _isDay = true;

  bool get getIsDay => _isDay;

  final List<TextAlign> _myTextAlign = [
    TextAlign.start,
    TextAlign.center,
    TextAlign.end,
    TextAlign.justify,
  ];

  List get getMyTextAlign => _myTextAlign;

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
    saveInt(Constants.keyTextAlignIndex, _toggleTextAlignIndex);
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
    _arabicTextColor = color.value;
    saveInt(Constants.keyTextArabicColor, color.value);
    notifyListeners();
  }

  changeTextTranscriptionColor(Color color) {
    _transcriptionTextColor = color.value;
    saveInt(Constants.keyTextTranscriptionColor, color.value);
    notifyListeners();
  }

  changeTextTranslateColor(Color color) {
    _translateTextColor = color.value;
    saveInt(Constants.keyTextTranslateColor, color.value);
    notifyListeners();
  }

  changeDefaultColorsState(bool state) {
    _isDefaultColors = state;
    saveBool(Constants.keyColorsWithDayNight, state);
    notifyListeners();
  }

  changeTranscriptionShow(bool state) {
    _isTranscriptionShow = state;
    saveBool(Constants.keyTextTranscriptionIsShow, state);
    notifyListeners();
  }

  saveInt(String key, int value) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setInt(key, value);
  }

  saveBool(String key, bool state) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool(key, state);
  }

  initSettings() async {
    final preferences = await SharedPreferences.getInstance();
    _toggleTextAlignIndex = preferences.getInt(Constants.keyTextAlignIndex) ?? 3;
    for (int i = 0; i < _isTextAlignSelected.length; i++) {
      _isTextAlignSelected[i] = i == _toggleTextAlignIndex;
    }
    _textArabicSize = preferences.getInt(Constants.keyTextArabicSize) ?? 16;
    _textTextTranslateSize = preferences.getInt(Constants.keyTextTranslateSize) ?? 16;
    _arabicTextColor = (preferences.getInt(Constants.keyTextArabicColor) ?? Colors.purple[400]!.value);
    _transcriptionTextColor = (preferences.getInt(Constants.keyTextTranscriptionColor) ?? Colors.teal[400]!.value);
    _translateTextColor = (preferences.getInt(Constants.keyTextTranslateColor) ?? Colors.black54.value);
    _isDefaultColors = preferences.getBool(Constants.keyColorsWithDayNight) ?? true;
    _isTranscriptionShow = preferences.getBool(Constants.keyTextTranscriptionIsShow) ?? true;
    notifyListeners();
  }
}
