import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.teal,
    scaffoldBackgroundColor: const Color(0xFFE8F1F0),
    fontFamily: 'Gilroy',
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      shape: AppStyles.appBarShape,
      backgroundColor: Color(0xFF00897B),
      titleTextStyle: TextStyle(
        color: Color(0xFFFFFFFF),
        fontFamily: 'Gilroy',
        fontSize: 20,
      ),
    ),
    textTheme: const TextTheme(
      labelMedium: TextStyle(
        fontSize: 17,
        fontFamily: 'Gilroy',
        color: Color(0xFF1E1E1E),
      ),
      labelLarge: TextStyle(
        fontSize: 75,
        fontFamily: 'Gilroy',
        color: Color(0xFF1E1E1E),
      ),
    ),
    cardTheme: const CardTheme(
      elevation: 1,
      shape: AppStyles.mainShape,
    ),
    cardColor: const Color(0xFFFFFFFF),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blueGrey,
    scaffoldBackgroundColor: const Color(0xFF192326),
    fontFamily: 'Gilroy',
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      shape: AppStyles.appBarShape,
      backgroundColor: Color(0xFF243336),
      titleTextStyle: TextStyle(
        color: Color(0xFFFFFFFF),
        fontFamily: 'Gilroy',
        fontSize: 20,
      ),
    ),
    textTheme: const TextTheme(
      labelMedium: TextStyle(
        fontSize: 17,
        fontFamily: 'Gilroy',
        color: Color(0xFFD3D3D3),
      ),
      labelLarge: TextStyle(
        fontSize: 75,
        fontFamily: 'Gilroy',
        color: Color(0xFFD3D3D3),
      ),
    ),
    cardTheme: const CardTheme(
      elevation: 1,
      shape: AppStyles.mainShape,
    ),
    cardColor: const Color(0xFF263238),
  );
}

extension ColorsSchemes on ColorScheme {

  Color get mainChaptersColor => brightness == Brightness.light
      ? const Color(0xFF00897B)
      : const Color(0xFF004D40);

  Color get mainChaptersBackgroundColor => brightness == Brightness.light
      ? const Color(0xFFE0F2F1)
      : const Color(0xFF192326);

  Color get mainBookmarksColor => brightness == Brightness.light
      ? const Color(0xFFFB8C00)
      : const Color(0xFFE65100);

  Color get mainBookmarksBackgroundColor => brightness == Brightness.light
      ? const Color(0xFFFFF3E0)
      : const Color(0xFF192326);

  Color get mainSupplicationsColor => brightness == Brightness.light
      ? const Color(0xFFE53935)
      : const Color(0xFFB71C1C);

  Color get mainSupplicationsBackgroundColor => brightness == Brightness.light
      ? const Color(0xFFFFEBEE)
      : const Color(0xFF192326);

  Color get mainSupplicationsBookmarkColor => brightness == Brightness.light
      ? const Color(0xFF1E88E5)
      : const Color(0xFF0D47A1);

  Color get mainSupplicationsBookmarkBackgroundColor => brightness == Brightness.light
      ? const Color(0xFFE1F5FE)
      : const Color(0xFF192326);

  Color get chapterContentSupplicationsColor => brightness == Brightness.light
      ? const Color(0xFF546E7A)
      : const Color(0xFF263238);

  Color get chapterContentSupplicationsPrimaryColor => brightness == Brightness.light
      ? const Color(0xFF455A64)
      : const Color(0xFFB0BEC5);

  Color get chapterContentSupplicationsBackgroundColor => brightness == Brightness.light
      ? const Color(0xFFECEFF1)
      : const Color(0xFF192326);

  Color get mainDefaultColor => brightness == Brightness.light
      ? const Color(0xFF1C1C1C)
      : const Color(0xFFD3D3D3);

  Color get cardOddColor => brightness == Brightness.light
      ? const Color(0xFFF5F5F5)
      : const Color(0xFF263238);

  Color get cardColor => brightness == Brightness.light
      ? const Color(0xFFFFFFFF)
      : const Color(0xFF192326);
}
