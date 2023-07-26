import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.teal,
    visualDensity: VisualDensity.adaptivePlatformDensity,
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
      bodyMedium: TextStyle(
        fontSize: 20,
        fontFamily: 'Gilroy',
        color: Color(0xFF1E1E1E),
      ),
      bodySmall: TextStyle(
        fontSize: 18,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w100,
        color: Color(0xFF414141),
      ),
      labelLarge: TextStyle(
        fontSize: 18,
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
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: const Color(0xFF151E1F),
    fontFamily: 'Gilroy',
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      shape: AppStyles.appBarShape,
      backgroundColor: Color(0xFF202D2F),
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
      bodyMedium: TextStyle(
        fontSize: 20,
        fontFamily: 'Gilroy',
        color: Color(0xFFD3D3D3),
      ),
      bodySmall: TextStyle(
        fontSize: 18,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w100,
        color: Color(0xFFA1A1A1),
      ),
      labelLarge: TextStyle(
        fontSize: 18,
        fontFamily: 'Gilroy',
        color: Color(0xFFD3D3D3),
      ),
    ),
    cardTheme: const CardTheme(
      elevation: 1,
      shape: AppStyles.mainShape,
    ),
    cardColor: const Color(0xFF1A2326),
  );
}

extension ColorsSchemes on ColorScheme {

  Color get mainChaptersColor => brightness == Brightness.light
      ? const Color(0xFF26A69A)
      : const Color(0xFF00695C);

  Color get mainChaptersBackgroundColor => brightness == Brightness.light
      ? const Color(0xFFE0F2F1)
      : const Color(0xFF192326);

  Color get mainBookmarksColor => brightness == Brightness.light
      ? const Color(0xFFFFA726)
      : const Color(0xFFEF6C00);

  Color get mainBookmarksBackgroundColor => brightness == Brightness.light
      ? const Color(0xFFFFF3E0)
      : const Color(0xFF192326);

  Color get mainSupplicationsColor => brightness == Brightness.light
      ? const Color(0xFFEF5350)
      : const Color(0xFFC62828);

  Color get mainSupplicationsBackgroundColor => brightness == Brightness.light
      ? const Color(0xFFFFEBEE)
      : const Color(0xFF192326);

  Color get mainSupplicationsBookmarkColor => brightness == Brightness.light
      ? const Color(0xFF42A5F5)
      : const Color(0xFF1565C0);

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
      : const Color(0xFF233036);

  Color get cardColor => brightness == Brightness.light
      ? const Color(0xFFFFFFFF)
      : const Color(0xFF1E282D);

  Color get segmentControlItemColor => brightness == Brightness.light
      ? const Color(0xFFE0F2F1)
      : const Color(0xFF1A2326);

  Color get contentCountColor => brightness == Brightness.light
      ? const Color(0xFF455A64)
      : const Color(0xFFEF6C00);
}
