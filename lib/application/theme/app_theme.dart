import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/style/app_style.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.teal,
    fontFamily: 'Nexa',
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      shape: AppStyle.appBarShape,
    ),
  );

  static final darkTheme = ThemeData();
}
