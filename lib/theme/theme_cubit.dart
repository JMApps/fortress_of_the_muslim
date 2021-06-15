import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    fontFamily: 'Gilroy',
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
    ),
  );

  static final _darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.blueGrey[900],
    brightness: Brightness.dark,
    fontFamily: 'Gilroy',
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.blueGrey[900],
      centerTitle: true,
    ),
  );

  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
