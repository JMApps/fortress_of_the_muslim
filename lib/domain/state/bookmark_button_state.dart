import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/service/database_query.dart';

class BookmarkButtonState with ChangeNotifier {
  final DatabaseQuery _databaseQuery = DatabaseQuery();

  DatabaseQuery get getDatabaseQuery => _databaseQuery;

  bool _updateList = false;

  bool get getUpdateList => _updateList;

  addRemoveChapterBookmark(int state, int chapterId) {
    _databaseQuery.addRemoveFavoriteChapter(state, chapterId);
    _updateList = !_updateList;
    notifyListeners();
  }

  addRemoveSupplicationBookmark(int state, int supplicationId) {
    _databaseQuery.addRemoveFavoriteSupplication(state, supplicationId);
    _updateList = !_updateList;
    notifyListeners();
  }
}