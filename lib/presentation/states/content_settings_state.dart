import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../core/strings/app_constraints.dart';

class ContentSettingsState extends ChangeNotifier {

  final _mainAppSettingsBox = Hive.box(AppConstraints.keyMainSettingsBox);

  late int _arabicFontIndex;
  late int _transcriptionFontIndex;
  late int _translationFontIndex;

  late int _arabicFontSizeIndex;
  late int _transcriptionFontSizeIndex;
  late int _translationFontSizeIndex;

  late int _arabicFontAlignIndex;
  late int _transcriptionFontAlignIndex;
  late int _translationFontAlignIndex;

  late int _arabicLightTextColor;
  late int _arabicDarkTextColor;
  late int _transcriptionLightTextColor;
  late int _transcriptionDarkTextColor;
  late int _translationLightTextColor;
  late int _translationDarkTextColor;

  late bool _showTranscriptionState;
  late int _counterAlignIndex;

  ContentSettingsState() {
    _initializeSettings();
  }

  void _initializeSettings() {
    _arabicFontIndex = _getSetting(AppConstraints.keyArabicFontIndex, 0);
    _transcriptionFontIndex = _getSetting(AppConstraints.keyTranscriptionFontIndex, 0);
    _translationFontIndex = _getSetting(AppConstraints.keyTranslationFontIndex, 0);

    _arabicFontSizeIndex = _getSetting(AppConstraints.keyArabicFontSizeIndex, 1);
    _transcriptionFontSizeIndex = _getSetting(AppConstraints.keyTranscriptionFontSizeIndex, 1);
    _translationFontSizeIndex = _getSetting(AppConstraints.keyTranslationFontSizeIndex, 1);

    _arabicFontAlignIndex = _getSetting(AppConstraints.keyArabicFontAlignIndex, 0);
    _transcriptionFontAlignIndex = _getSetting(AppConstraints.keyTranscriptionFontAlignIndex, 0);
    _translationFontAlignIndex = _getSetting(AppConstraints.keyTranslationFontAlignIndex, 0);

    _arabicLightTextColor = _getSetting(AppConstraints.keyArabicLightColor, Colors.black.value);
    _arabicDarkTextColor = _getSetting(AppConstraints.keyArabicDarkColor, Colors.white.value);
    _transcriptionLightTextColor = _getSetting(AppConstraints.keyTranscriptionLightColor, Colors.grey.value);
    _transcriptionDarkTextColor = _getSetting(AppConstraints.keyTranscriptionDarkColor, Colors.grey.value);
    _translationLightTextColor = _getSetting(AppConstraints.keyTranslationLightColor, Colors.black.value);
    _translationDarkTextColor = _getSetting(AppConstraints.keyTranslationDarkColor, Colors.white.value);

    _showTranscriptionState = _mainAppSettingsBox.get(AppConstraints.keyShowTranscriptionState, defaultValue: true);
    _counterAlignIndex = _getSetting(AppConstraints.keyCounterAlignIndex, 2);
  }

  int _getSetting(String key, int defaultValue) {
    return _mainAppSettingsBox.get(key, defaultValue: defaultValue);
  }

  void _setSetting(int value, String key) {
    _mainAppSettingsBox.put(key, value);
    notifyListeners();
  }

  int get getArabicFontIndex => _arabicFontIndex;
  int get getTranscriptionFontIndex => _transcriptionFontIndex;
  int get getTranslationFontIndex => _translationFontIndex;

  int get getArabicFontSizeIndex => _arabicFontSizeIndex;
  int get getTranscriptionFontSizeIndex => _transcriptionFontSizeIndex;
  int get getTranslationFontSizeIndex => _translationFontSizeIndex;

  int get getArabicFontAlignIndex => _arabicFontAlignIndex;
  int get getTranscriptionFontAlignIndex => _transcriptionFontAlignIndex;
  int get getTranslationFontAlignIndex => _translationFontAlignIndex;

  int get getArabicLightTextColor => _arabicLightTextColor;
  int get getArabicDarkTextColor => _arabicDarkTextColor;
  int get getTranscriptionLightTextColor => _transcriptionLightTextColor;
  int get getTranscriptionDarkTextColor => _transcriptionDarkTextColor;
  int get getTranslationLightTextColor => _translationLightTextColor;
  int get getTranslationDarkTextColor => _translationDarkTextColor;

  bool get getShowTranscriptionState => _showTranscriptionState;
  int get getCounterAlignIndex => _counterAlignIndex;

  set setArabicFontIndex(int index) {
    _arabicFontIndex = index;
    _setSetting(index, AppConstraints.keyArabicFontIndex);
  }

  set setTranscriptionFontIndex(int index) {
    _transcriptionFontIndex = index;
    _setSetting(index, AppConstraints.keyTranscriptionFontIndex);
  }

  set setTranslationFontIndex(int index) {
    _translationFontIndex = index;
    _setSetting(index, AppConstraints.keyTranslationFontIndex);
  }

  set setArabicFontSizeIndex(int index) {
    _arabicFontSizeIndex = index;
    _setSetting(index, AppConstraints.keyArabicFontSizeIndex);
  }

  set setTranscriptionFontSizeIndex(int index) {
    _transcriptionFontSizeIndex = index;
    _setSetting(index, AppConstraints.keyTranscriptionFontSizeIndex);
  }

  set setTranslationFontSizeIndex(int index) {
    _translationFontSizeIndex = index;
    _setSetting(index, AppConstraints.keyTranslationFontSizeIndex);
  }

  set setArabicFontAlignIndex(int index) {
    _arabicFontAlignIndex = index;
    _setSetting(index, AppConstraints.keyArabicFontAlignIndex);
  }

  set setTranscriptionFontAlignIndex(int index) {
    _transcriptionFontAlignIndex = index;
    _setSetting(index, AppConstraints.keyTranscriptionFontAlignIndex);
  }

  set setTranslationFontAlignIndex(int index) {
    _translationFontAlignIndex = index;
    _setSetting(index, AppConstraints.keyTranslationFontAlignIndex);
  }

  set setArabicLightTextColor(int color) {
    _arabicLightTextColor = color;
    _setSetting(color, AppConstraints.keyArabicLightColor);
  }

  set setArabicDarkTextColor(int color) {
    _arabicDarkTextColor = color;
    _setSetting(color, AppConstraints.keyArabicDarkColor);
  }

  set setTranscriptionLightTextColor(int color) {
    _transcriptionLightTextColor = color;
    _setSetting(color, AppConstraints.keyTranscriptionLightColor);
  }

  set setTranscriptionDarkTextColor(int color) {
    _transcriptionDarkTextColor = color;
    _setSetting(color, AppConstraints.keyTranscriptionDarkColor);
  }

  set setTranslationLightTextColor(int color) {
    _translationLightTextColor = color;
    _setSetting(color, AppConstraints.keyTranslationLightColor);
  }

  set setTranslationDarkTextColor(int color) {
    _translationDarkTextColor = color;
    _setSetting(color, AppConstraints.keyTranslationDarkColor);
  }

  set setShowTranscriptionState(bool state) {
    _showTranscriptionState = state;
    _mainAppSettingsBox.put(AppConstraints.keyShowTranscriptionState, state);
    notifyListeners();
  }

  set setCounterAlignIndex(int index) {
    _counterAlignIndex = index;
    _setSetting(index, AppConstraints.keyCounterAlignIndex);
  }
}
