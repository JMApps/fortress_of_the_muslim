import 'package:flutter/cupertino.dart';

class MainState with ChangeNotifier {
  int _selectedItem = 0;

  int get getSelectedItem => _selectedItem;

  selectedItem(int selectedItem) {
    _selectedItem = selectedItem;
    notifyListeners();
  }
}