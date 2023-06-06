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
      backgroundColor: Color(0xFF00796B),
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
      titleMedium: TextStyle(
        fontSize: 17,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.bold,
        color: Color(0xFF00796B),
      ),
      bodyMedium: TextStyle(
        fontSize: 17,
        fontFamily: 'Gilroy',
        color: Color(0xFFE0E0E0),
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
    scaffoldBackgroundColor: const Color(0xFF263238),
    fontFamily: 'Gilroy',
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      shape: AppStyles.appBarShape,
      backgroundColor: Color(0xFF192326),
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
      titleMedium: TextStyle(
        fontSize: 17,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.bold,
        color: Color(0xFF455A64),
      ),
      bodyMedium: TextStyle(
        fontSize: 17,
        fontFamily: 'Gilroy',
        color: Color(0xFFE0E0E0),
      ),
    ),
    cardTheme: const CardTheme(
      elevation: 1,
      shape: AppStyles.mainShape,
    ),
    cardColor: const Color(0xFF192326),
  );
}

extension ColorsSchemes on ColorScheme {
  Color get mainChaptersColor => brightness == Brightness.light
      ? const Color(0xBF00897B)
      : const Color(0xFF00443E);

  Color get mainBookmarksColor => brightness == Brightness.light
      ? const Color(0xBFFB8C00)
      : const Color(0xFF7A2A00);

  Color get mainSupplicationsColor => brightness == Brightness.light
      ? const Color(0xBFE53935)
      : const Color(0xFF671616);

  Color get mainFavoritesColor => brightness == Brightness.light
      ? const Color(0xBF1E88E5)
      : const Color(0xFF002054);

  Color get mainDefaultColor => brightness == Brightness.light
      ? const Color(0xFF1C1C1C)
      : const Color(0xFFD3D3D3);

  Color get cardOddColor => brightness == Brightness.light
      ? const Color(0xFFE0F2F1)
      : const Color(0xFF263238);

  Color get cardColor => brightness == Brightness.light
      ? const Color(0xFFFFFFFF)
      : const Color(0xFF192326);

  Color get primaryDefaultColor => brightness == Brightness.light
      ? const Color(0xBF00897B)
      : const Color(0xFF4DB6AC);
}
