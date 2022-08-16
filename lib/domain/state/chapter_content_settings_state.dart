import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ChapterContentSettingsState with ChangeNotifier {
  var contentSettingsBox = Hive.box(Constants.keyMainSettingBox);

  final List<bool> isDayNightSelected = [
    DateTime.now().hour < 12 ? true : false,
    DateTime.now().hour > 12 ? true : false
  ];

  List<bool> get getIsDayNightSelected => isDayNightSelected;

  final List<bool> isTextAlignSelected = [false, false, false, true];

  List<bool> get getIsTextAlignSelected => isTextAlignSelected;

  final List<bool> isTextArabicFontSelected = [true, false, false];

  List<bool> get getIsTextArabicFontSelected => isTextArabicFontSelected;

  final List<bool> isTextTranslationFontSelected = [true, false, false];

  List<bool> get getIsTextTranslationFontSelected => isTextTranslationFontSelected;

  int toggleDayNightIndex = 0;

  int toggleTextAlignIndex = 3;

  int toggleTextArabicFontIndex = 0;

  int toggleTextTranslationFontIndex = 0;

  int get getToggleTextAlignIndex => toggleTextAlignIndex;

  double textArabicSize = 16;

  double get getTextArabicSize => textArabicSize;

  double textTranslateSize = 16;

  double get getTextTranslateSize => textTranslateSize;

  int arabicTextColor = Colors.purple[400]!.value;

  int arabicTextColorNight = Colors.purple[400]!.value;

  int get getArabicTextColor => arabicTextColor;

  int get getArabicTextColorNight => arabicTextColorNight;

  int transcriptionTextColor = Colors.teal[400]!.value;

  int transcriptionTextColorNight = Colors.teal[400]!.value;

  int get getTranscriptionTextColor => transcriptionTextColor;

  int get getTranscriptionTextColorNight => transcriptionTextColorNight;

  int translateTextColor = Colors.black54.value;

  int translateTextColorNight = Colors.white.value;

  int get getTranslateTextColor => translateTextColor;

  int get getTranslateTextColorNight => translateTextColorNight;

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

  final List<String> _arabicFonts = [
    'Hafs',
    'Amiri',
    'Quran',
  ];

  String get getArabicFont => _arabicFonts[toggleTextArabicFontIndex];

  final List<String> _translationFonts = [
    'Gilroy',
    'Calibri',
    'Times',
  ];

  String get getTranslationFont => _translationFonts[toggleTextTranslationFontIndex];

  TextAlign get getMyTextAlign => _myTextAlign[toggleTextAlignIndex];

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

  updateToggleTextArabicFont(int index) {
    toggleTextArabicFontIndex = index;
    for (int i = 0; i < isTextArabicFontSelected.length; i++) {
      isTextArabicFontSelected[i] = i == toggleTextArabicFontIndex;
    }
    contentSettingsBox.put(Constants.keyTextArabicFontIndex, toggleTextArabicFontIndex);
    notifyListeners();
  }

  updateToggleTextTranslationFont(int index) {
    toggleTextTranslationFontIndex = index;
    for (int i = 0; i < isTextTranslationFontSelected.length; i++) {
      isTextTranslationFontSelected[i] = i == toggleTextTranslationFontIndex;
    }
    contentSettingsBox.put(Constants.keyTextTranslationFontIndex, toggleTextTranslationFontIndex);
    notifyListeners();
  }

  changeTextArabicColor(Color color) {
    arabicTextColor = color.value;
    contentSettingsBox.put(Constants.keyTextArabicColor, color.value);
    notifyListeners();
  }


  changeTextArabicColorNight(Color color) {
    arabicTextColorNight = color.value;
    contentSettingsBox.put(Constants.keyTextArabicColorNight, color.value);
    notifyListeners();
  }

  changeTextTranscriptionColor(Color color) {
    transcriptionTextColor = color.value;
    contentSettingsBox.put(Constants.keyTextTranscriptionColor, color.value);
    notifyListeners();
  }

  changeTextTranscriptionColorNight(Color color) {
    transcriptionTextColorNight = color.value;
    contentSettingsBox.put(Constants.keyTextTranscriptionColorNight, color.value);
    notifyListeners();
  }

  changeTextTranslateColor(Color color) {
    translateTextColor = color.value;
    contentSettingsBox.put(Constants.keyTextTranslateColor, color.value);
    notifyListeners();
  }

  changeTextTranslateColorNight(Color color) {
    translateTextColorNight = color.value;
    contentSettingsBox.put(Constants.keyTextTranslateColorNight, color.value);
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
    toggleTextAlignIndex = contentSettingsBox.get(Constants.keyTextAlignIndex, defaultValue: 3);
    for (int i = 0; i < isTextAlignSelected.length; i++) {
      isTextAlignSelected[i] = i == toggleTextAlignIndex;
    }
    toggleTextArabicFontIndex = contentSettingsBox.get(Constants.keyTextArabicFontIndex, defaultValue: 0);
    for (int i = 0; i < isTextArabicFontSelected.length; i++) {
      isTextArabicFontSelected[i] = i == toggleTextArabicFontIndex;
    }
    toggleTextTranslationFontIndex = contentSettingsBox.get(Constants.keyTextTranslationFontIndex, defaultValue: 0);
    for (int i = 0; i < isTextTranslationFontSelected.length; i++) {
      isTextTranslationFontSelected[i] = i == toggleTextTranslationFontIndex;
    }
    textArabicSize = contentSettingsBox.get(Constants.keyTextArabicSize, defaultValue: 16.0);
    textTranslateSize = contentSettingsBox.get(Constants.keyTextTranslateSize, defaultValue: 16.0);
    arabicTextColor = (contentSettingsBox.get(Constants.keyTextArabicColor, defaultValue: Colors.purple[400]!.value));
    arabicTextColorNight = (contentSettingsBox.get(Constants.keyTextArabicColorNight, defaultValue: Colors.purple[400]!.value));
    transcriptionTextColor = (contentSettingsBox.get(Constants.keyTextTranscriptionColor, defaultValue: Colors.teal[400]!.value));
    transcriptionTextColorNight = (contentSettingsBox.get(Constants.keyTextTranscriptionColorNight, defaultValue: Colors.teal[400]!.value));
    translateTextColor = (contentSettingsBox.get(Constants.keyTextTranslateColor, defaultValue: Colors.black54.value));
    translateTextColorNight = (contentSettingsBox.get(Constants.keyTextTranslateColorNight, defaultValue: Colors.white.value));
    isTranscriptionShow = contentSettingsBox.get(Constants.keyTextTranscriptionIsShow, defaultValue: true);
  }
}
