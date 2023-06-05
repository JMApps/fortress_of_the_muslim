import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.teal,
    fontFamily: 'Gilroy',
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      shape: AppStyles.appBarShape,
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
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 17,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.bold,
        color: Colors.teal,
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontFamily: 'Gilroy',
        color: Color(0xFFE0E0E0),
      ),
    ),
    cardTheme: const CardTheme(
      elevation: 1,
      shape: AppStyles.mainShape,
    ),
  );

  static final darkTheme = ThemeData();
}

extension ColorsSchemes on ColorScheme {
  Color get mainChaptersColor => brightness == Brightness.light
      ? const Color(0xBF4DB6AC)
      : const Color(0xFF004D40);

  Color get mainBookmarksColor => brightness == Brightness.light
      ? const Color(0xBFFFB74D)
      : const Color(0xFFE65100);

  Color get mainSupplicationsColor => brightness == Brightness.light
      ? const Color(0xBFE57373)
      : const Color(0xFFB71C1C);

  Color get mainFavoritesColor => brightness == Brightness.light
      ? const Color(0xBF64B5F6)
      : const Color(0xFF0D47A1);

  Color get lastChapterBorderSideColor => brightness == Brightness.light
      ? const Color(0xFF009688)
      : const Color(0xBFFFB74D);

  Color get counterBorderSideColor => brightness == Brightness.light
      ? const Color(0xFFF44336)
      : const Color(0xFFE65100);

  Color get optionsCircleAvatarColor => brightness == Brightness.light
      ? const Color(0xBF4DB6AC)
      : const Color(0xFFE65100);

  Color get mainDefaultColor => brightness == Brightness.light
      ? const Color(0xBF000000)
      : const Color(0xFFF1F1F1);

  Color get arrowIconColor => brightness == Brightness.light
      ? const Color(0xBF181818)
      : const Color(0xFFDCDCDC);
}
