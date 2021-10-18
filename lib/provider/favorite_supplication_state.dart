import 'package:flutter/cupertino.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';

class FavoriteSupplicationState with ChangeNotifier {
  final _databaseQuery = DatabaseQuery();

  bool _updateList = true;

  bool get getUpdateList => _updateList;

  updateBookmarkState(int state, int id) {
    _databaseQuery.addRemoveFavoriteSupplication(state, id);
    _updateList = !_updateList;
    notifyListeners();
  }
}
