import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsState with ChangeNotifier {

  double _textSize = 20;

  double get getTextSize => _textSize;

  Color _arabicTextColor = Colors.blueGrey[800]!;

  Color get getArabicTextColor => _arabicTextColor;

  Color _transcriptionTextColor = Colors.teal[800]!;

  Color get getTranscriptionTextColor => _transcriptionTextColor;

  Color _translationTextColor = Colors.black;

  Color get getTranslationTextColor => _translationTextColor;

  bool _isArabicTextShow = true;

  bool get getIsArabicTextShow => _isArabicTextShow;

  bool _isTranscriptionTextShow = true;

  bool get getIsTranscriptionTextShow => _isTranscriptionTextShow;

  updateTextSizeValue(double textSize) {
    _textSize = textSize;
    notifyListeners();
  }

  saveTextSizeValue(double lastSizeValue) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setDouble(keyTextSizeValue, lastSizeValue);
  }

  updateArabicTextColor(Color newColor) {
    _arabicTextColor = newColor;
    notifyListeners();
  }

  saveArabicTextColor(Color lastArabicTextColor) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setInt(keyArabicTextColorValue, lastArabicTextColor.value);
  }

  updateTranscriptionTextColor(Color newColor) {
    _transcriptionTextColor = newColor;
    notifyListeners();
  }

  saveTranscriptionTextColor(Color lastTranscriptionTextColor) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setInt(keyTranscriptionTextColorValue, lastTranscriptionTextColor.value);
  }


  updateTranslationTextColor(Color newColor) {
    _translationTextColor = newColor;
    notifyListeners();
  }

  saveTranslationTextColor(Color lastTranslationTextColor) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setInt(keyTranslationTextColorValue, lastTranslationTextColor.value);
  }

  updateArabicTextShowState(bool state) {
    _isArabicTextShow = state;
    notifyListeners();
  }

  saveArabicTextShowState(bool state) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool(keyArabicTextShow, state);
  }

  updateTranscriptionTextShowState(bool state) {
    _isTranscriptionTextShow = state;
    notifyListeners();
  }

  saveTranscriptionTextShowState(bool state) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool(keyTranscriptionTextShow, state);
  }

  initPreferences() async {
    final preferences = await SharedPreferences.getInstance();
    _textSize = preferences.getDouble(keyTextSizeValue) ?? 20;
    _arabicTextColor = Color(preferences.getInt(keyArabicTextColorValue) ?? Colors.blueGrey[800]!.value);
    _transcriptionTextColor = Color(preferences.getInt(keyTranscriptionTextColorValue) ?? Colors.teal[800]!.value);
    _translationTextColor = Color(preferences.getInt(keyTranslationTextColorValue) ?? Colors.black.value);
    _isArabicTextShow = preferences.getBool(keyArabicTextShow) ?? true;
    _isTranscriptionTextShow = preferences.getBool(keyTranscriptionTextShow) ?? true;
  }
}