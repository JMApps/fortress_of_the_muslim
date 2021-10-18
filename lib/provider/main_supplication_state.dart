import 'package:flutter/cupertino.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainSupplicationState with ChangeNotifier {
  final _databaseQuery = DatabaseQuery();

  final _itemScrollController = ItemScrollController();

  ItemScrollController get getItemScrollController => _itemScrollController;

  String _textFiledText = '';

  String get getTextFieldText => _textFiledText;

  bool _updateList = true;

  bool get getUpdateList => _updateList;

  scrollTo(int randomNumber) {
    _itemScrollController.scrollTo(
        index: randomNumber,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOutCubic);
  }

  updateTextFiledData(String newString) {
    _textFiledText = newString;
    notifyListeners();
  }

  updateBookmarkState(int state, int id) {
    _databaseQuery.addRemoveFavoriteSupplication(state, id);
    _updateList = !_updateList;
    notifyListeners();
  }
}
