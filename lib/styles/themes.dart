import 'package:flutter/material.dart';

class Themes {
  ThemeData themeData(bool isDarkTheme, int selectedIndex) {

    List<Color?> _changeColor = [
      isDarkTheme ? Colors.teal[900] : Colors.teal[500],
      isDarkTheme ? Colors.orange[900] : Colors.orange[500],
      isDarkTheme ? Colors.red[900] : Colors.red[500],
      isDarkTheme ? Colors.blue[900] : Colors.blue[500],
    ];

    return ThemeData(
      scaffoldBackgroundColor: _changeColor[selectedIndex],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: _changeColor[selectedIndex],
        centerTitle: true,
      ),
    );
  }
}