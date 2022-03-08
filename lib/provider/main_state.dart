import 'package:flutter/cupertino.dart';
import 'package:fortress_of_the_muslim/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainState with ChangeNotifier {
  int _selectedItem = 0;

  int get getSelectedItem => _selectedItem;

  bool _nightThemeState = false;

  bool get getNightThemeState => _nightThemeState;

  bool _nightThemeColorState = false;

  bool get getNightThemeColorState => _nightThemeColorState;

  selectedItem(int selectedItem) {
    _selectedItem = selectedItem;
    notifyListeners();
  }

  changeTheme() {
    _nightThemeState = !_nightThemeState;
    notifyListeners();
  }

  changeColorState() {
    _nightThemeColorState = !_nightThemeColorState;
    notifyListeners();
  }

  saveThemeState() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool(keyToggleNightTheme, _nightThemeState);
  }

  saveColorState() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool(keyToggleColorState, _nightThemeColorState);
  }

  initTheme() async {
    final preferences = await SharedPreferences.getInstance();
    _nightThemeState = preferences.getBool(keyToggleNightTheme) ?? false;
    _nightThemeColorState = preferences.getBool(keyToggleColorState) ?? false;
    notifyListeners();
  }
}
