import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ChapterContentSettingsState with ChangeNotifier {
  var contentSettingsBox = Hive.box(Constants.keyMainSettingBox);

  final List<bool> isDayNightSelected = [
    DateTime.now().hour < 12 ? true : false,
    DateTime.now().hour > 12 ? true : false
  ];

  final List<bool> isTextAlignSelected = [false, false, false, true];

  List<bool> get getIsDayNightSelected => isDayNightSelected;

  List<bool> get getIsTextAlignSelected => isTextAlignSelected;

  int toggleDayNightIndex = 0;

  int toggleTextAlignIndex = 3;

  int get getToggleTextAlignIndex => toggleTextAlignIndex;

  double textArabicSize = 16;

  double get getTextArabicSize => textArabicSize;

  double textTranslateSize = 16;

  double get getTextTranslateSize => textTranslateSize;

  int arabicTextColor = Colors.purple[400]!.value;

  int get getArabicTextColor => arabicTextColor;

  int transcriptionTextColor = Colors.teal[400]!.value;

  int get getTranscriptionTextColor => transcriptionTextColor;

  int translateTextColor = Colors.black54.value;

  int get getTranslateTextColor => translateTextColor;

  bool isDefaultColors = false;

  bool get getIsDefaultColors => isDefaultColors;

  bool isTranscriptionShow = true;

  bool get getIsTranscriptionShow => isTranscriptionShow;

  bool isDay = DateTime.now().hour < 12 ? true : false;

  bool get getIsDay => isDay;

  final List<TextAlign> _myTextAlign = [
    TextAlign.start,
    TextAlign.center,
    TextAlign.end,
    TextAlign.justify,
  ];

  List get getMyTextAlign => _myTextAlign;

  updateToggleDayNight(int index) {
    toggleDayNightIndex = index;
    toggleDayNightIndex == 0 ? isDay = true : isDay = false;
    for (int i = 0; i < isDayNightSelected.length; i++) {
      isDayNightSelected[i] = i == toggleDayNightIndex;
    }
    notifyListeners();
  }

  updateToggleTextAlign(int index) {
    toggleTextAlignIndex = index;
    for (int i = 0; i < isTextAlignSelected.length; i++) {
      isTextAlignSelected[i] = i == toggleTextAlignIndex;
    }
    contentSettingsBox.put(Constants.keyTextAlignIndex, toggleTextAlignIndex);
    notifyListeners();
  }

  changeTextArabicSize(double arabicTextSize) {
    textArabicSize = arabicTextSize;
    notifyListeners();
  }

  changeTextTranslateSize(double translateTextSize) {
    textTranslateSize = translateTextSize;
    notifyListeners();
  }

  changeTextArabicColor(Color color) {
    arabicTextColor = color.value;
    contentSettingsBox.put(Constants.keyTextArabicColor, color.value);
    notifyListeners();
  }

  changeTextTranscriptionColor(Color color) {
    transcriptionTextColor = color.value;
    contentSettingsBox.put(Constants.keyTextTranscriptionColor, color.value);
    notifyListeners();
  }

  changeTextTranslateColor(Color color) {
    translateTextColor = color.value;
    contentSettingsBox.put(Constants.keyTextTranslateColor, color.value);
    notifyListeners();
  }

  changeDefaultColorsState(bool state) {
    isDefaultColors = state;
    contentSettingsBox.put(Constants.keyColorsWithDayNight, state);
    notifyListeners();
  }

  changeTranscriptionShow(bool state) {
    isTranscriptionShow = state;
    contentSettingsBox.put(Constants.keyTextTranscriptionIsShow, state);
    notifyListeners();
  }

  saveDouble(String key, double value) async {
    await contentSettingsBox.put(key, value);
  }

  initContentSettings() {
    toggleTextAlignIndex =
        contentSettingsBox.get(Constants.keyTextAlignIndex) ?? 3;
    for (int i = 0; i < isTextAlignSelected.length; i++) {
      isTextAlignSelected[i] = i == toggleTextAlignIndex;
    }
    textArabicSize = contentSettingsBox.get(Constants.keyTextArabicSize) ?? 16;
    textTranslateSize =
        contentSettingsBox.get(Constants.keyTextTranslateSize) ?? 16;
    arabicTextColor = (contentSettingsBox.get(Constants.keyTextArabicColor) ??
        Colors.purple[400]!.value);
    transcriptionTextColor =
        (contentSettingsBox.get(Constants.keyTextTranscriptionColor) ??
            Colors.teal[400]!.value);
    translateTextColor =
        (contentSettingsBox.get(Constants.keyTextTranslateColor) ??
            Colors.black54.value);
    isDefaultColors =
        contentSettingsBox.get(Constants.keyColorsWithDayNight) ?? true;
    isTranscriptionShow =
        contentSettingsBox.get(Constants.keyTextTranscriptionIsShow) ?? true;
  }
}
