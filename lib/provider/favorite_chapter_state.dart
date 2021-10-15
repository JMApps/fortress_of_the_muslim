import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';

class FavoriteChapterState with ChangeNotifier {
  final _databaseQuery = DatabaseQuery();

  String _textFiledText = '';

  String get getTextFieldText => _textFiledText;

  bool _updateList = true;

  bool get getUpdateList => _updateList;

  updateTextFiledData(String newString) {
    _textFiledText = newString;
    notifyListeners();
  }

  updateBookmarkState(int state, int id) {
    _databaseQuery.addRemoveFavoriteChapter(state, id);
    _updateList = !_updateList;
    notifyListeners();
  }
}
