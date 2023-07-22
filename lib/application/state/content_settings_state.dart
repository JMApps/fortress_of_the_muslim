import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/string/app_constraints.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ContentSettingsState extends ChangeNotifier {

  final _contentSettingsBox = Hive.box(AppConstraints.keyContentSettings);

  int _arabicFontIndex = 0;

  int get getArabicFontIndex => _arabicFontIndex;

  set changeArabicFontIndex(int index) {
    _arabicFontIndex = index;
    _contentSettingsBox.put(AppConstraints.keyArabicFontIndex, index);
    notifyListeners();
  }

  int _translationFontIndex = 0;

  int get getTranslationFontIndex => _translationFontIndex;

  set changeTranslationFontIndex(int index) {
    _translationFontIndex = index;
    _contentSettingsBox.put(AppConstraints.keyTranslationFontIndex, index);
    notifyListeners();
  }

  int _textAlignIndex = 0;

  int get getTextAlignIndex => _textAlignIndex;

  set changeTextAlignIndex(int index) {
    _textAlignIndex = index;
    _contentSettingsBox.put(AppConstraints.keyTextAlignIndex, index);
    notifyListeners();
  }

  double _arabicTextSize = 20;

  double get getArabicTextSize => _arabicTextSize;

  set changeArabicTextSize(double size) {
    _arabicTextSize = size;
    _contentSettingsBox.put(AppConstraints.keyArabicTextSize, size);
    notifyListeners();
  }

  double _translationTextSize = 18;

  double get getTranslationTextSize => _translationTextSize;

  set changeTranslationTextSize(double size) {
    _translationTextSize = size;
    _contentSettingsBox.put(AppConstraints.keyTranslationTextSize, size);
    notifyListeners();
  }

  Color _arabicLightTextColor = Colors.grey.shade900;

  Color get getArabicLightTextColor => _arabicLightTextColor;

  set changeArabicLightColor(Color color) {
    _arabicLightTextColor = color;
    _contentSettingsBox.put(AppConstraints.keyArabicLightColor, color.value);
    notifyListeners();
  }

  Color _arabicDarkTextColor = Colors.grey.shade50;

  Color get getArabicDarkTextColor => _arabicDarkTextColor;

  set changeArabicDarkColor(Color color) {
    _arabicDarkTextColor = color;
    _contentSettingsBox.put(AppConstraints.keyArabicDarkColor, color.value);
    notifyListeners();
  }

  Color _transcriptionLightTextColor = Colors.teal.shade800;

  Color get getTranscriptionLightTextColor => _transcriptionLightTextColor;

  set changeTranscriptionLightColor(Color color) {
    _transcriptionLightTextColor = color;
    _contentSettingsBox.put(AppConstraints.keyTranscriptionLightColor, color.value);
    notifyListeners();
  }

  Color _transcriptionDarkTextColor = Colors.teal.shade300;

  Color get getTranscriptionDarkTextColor => _transcriptionDarkTextColor;

  set changeTranscriptionDarkColor(Color color) {
    _transcriptionDarkTextColor = color;
    _contentSettingsBox.put(AppConstraints.keyTranscriptionDarkColor, color.value);
    notifyListeners();
  }

  Color _translationLightTextColor = Colors.grey.shade900;

  Color get getTranslationLightTextColor => _translationLightTextColor;

  set changeTranslationLightColor(Color color) {
    _translationLightTextColor = color;
    _contentSettingsBox.put(AppConstraints.keyTranslationLightColor, color.value);
    notifyListeners();
  }

  Color _translationDarkTextColor = Colors.grey.shade50;

  Color get getTranslationDarkTextColor => _translationDarkTextColor;

  set changeTranslationDarkColor(Color color) {
    _translationDarkTextColor = color;
    _contentSettingsBox.put(AppConstraints.keyTranslationDarkColor, color.value);
    notifyListeners();
  }

  bool _translationShowState = true;

  bool get getTranslationShowState => _translationShowState;

  set transcriptionShowState(bool state) {
    _translationShowState = state;
    _contentSettingsBox.put(AppConstraints.keyTranscriptionShowState, state);
    notifyListeners();
  }

  ContentSettingsState() {
    _arabicFontIndex = _contentSettingsBox.get(AppConstraints.keyArabicFontIndex, defaultValue: 0);
    _translationFontIndex = _contentSettingsBox.get(AppConstraints.keyTranslationFontIndex, defaultValue: 0);
    _textAlignIndex = _contentSettingsBox.get(AppConstraints.keyTextAlignIndex, defaultValue: 0);
    _arabicTextSize = _contentSettingsBox.get(AppConstraints.keyArabicTextSize, defaultValue: 20.0);
    _translationTextSize = _contentSettingsBox.get(AppConstraints.keyTranslationTextSize, defaultValue: 18.0);
    _arabicLightTextColor = Color(_contentSettingsBox.get(AppConstraints.keyArabicLightColor, defaultValue: Colors.grey.shade900.value));
    _arabicDarkTextColor = Color(_contentSettingsBox.get(AppConstraints.keyArabicDarkColor, defaultValue: Colors.grey.shade50.value));
    _transcriptionLightTextColor = Color(_contentSettingsBox.get(AppConstraints.keyTranscriptionLightColor, defaultValue: Colors.teal.shade800.value));
    _transcriptionDarkTextColor = Color(_contentSettingsBox.get(AppConstraints.keyTranscriptionDarkColor, defaultValue: Colors.teal.shade300.value));
    _translationLightTextColor = Color(_contentSettingsBox.get(AppConstraints.keyTranslationLightColor, defaultValue: Colors.grey.shade900.value));
    _translationDarkTextColor = Color(_contentSettingsBox.get(AppConstraints.keyTranslationDarkColor, defaultValue: Colors.grey.shade50.value));
    _translationShowState = _contentSettingsBox.get(AppConstraints.keyTranscriptionShowState, defaultValue: true);
  }
}
