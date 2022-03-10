import 'package:flutter/cupertino.dart';
import 'package:fortress_of_the_muslim/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainState with ChangeNotifier {
  int _selectedItem = 0;

  int get getSelectedItem => _selectedItem;

  bool _nightThemeState = false;

  bool get getNightThemeState => _nightThemeState;

  selectedItem(int selectedItem) {
    _selectedItem = selectedItem;
    notifyListeners();
  }

  changeTheme() {
    _nightThemeState = !_nightThemeState;
    notifyListeners();
  }

  saveThemeState() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool(keyToggleNightTheme, _nightThemeState);
  }

  initTheme() async {
    final preferences = await SharedPreferences.getInstance();
    _nightThemeState = preferences.getBool(keyToggleNightTheme) ?? false;
  }
}
