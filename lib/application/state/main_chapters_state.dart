import 'package:flutter/cupertino.dart';
import 'package:fortress_of_the_muslim/data/service/database_query.dart';

class MainChaptersState extends ChangeNotifier {

  final DatabaseQuery _databaseQuery = DatabaseQuery();

  DatabaseQuery get getDatabaseQuery => _databaseQuery;

  addRemoveChapterBookmark(int state, int chapterId) {
    _databaseQuery.addRemoveFavoriteChapter(state, chapterId);
    notifyListeners();
  }
}
