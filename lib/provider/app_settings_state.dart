import 'package:flutter/material.dart';

class AppSettingsState with ChangeNotifier {

  int _textSize = 20;

  int get getTextSize => _textSize;

  Color _arabicTextColor = Colors.red;

  Color get getArabicTextColor => _arabicTextColor;

  Color _transcriptionTextColor = Colors.green;

  Color get getTranscriptionTextColor => _transcriptionTextColor;

  Color _translationTextColor = Colors.black;

  Color get getTranslationTextColor => _translationTextColor;

  bool _isArabicTextShow = true;

  bool get getIsArabicTextShow => _isArabicTextShow;

  bool _isTranscriptionTextShow = true;

  bool get getIsTranscriptionTextShow => _isTranscriptionTextShow;

  updateTextSizeValue(int textSize) {
    _textSize = textSize;
    notifyListeners();
  }

  updateArabicTextColor(Color newColor) {
    _arabicTextColor = newColor;
    notifyListeners();
  }

  updateTranscriptionTextColor(Color newColor) {
    _transcriptionTextColor = newColor;
    notifyListeners();
  }

  updateTranslationTextColor(Color newColor) {
    _translationTextColor = newColor;
    notifyListeners();
  }

  updateArabicTextShowState(bool state) {
    _isArabicTextShow = state;
    notifyListeners();
  }

  updateTranscriptionTextShowState(bool state) {
    _isTranscriptionTextShow = state;
    notifyListeners();
  }
}