import 'package:flutter/material.dart';

class MainChapterSearchState with ChangeNotifier {
  String _keyWord = '';

  String get getKeyWord => _keyWord;

  getCurrentKeyWord(String currentKeyWord) {
    _keyWord = currentKeyWord;
    notifyListeners();
  }
}