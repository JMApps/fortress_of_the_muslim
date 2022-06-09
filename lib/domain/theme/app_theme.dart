import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade50,
    fontFamily: 'Gilroy',
    colorScheme: const ColorScheme.light(),
    cardColor: const Color(0xFFFFFFFF),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontFamily: 'Gilroy',
      ),
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.blueGrey.shade800,
    fontFamily: 'Gilroy',
    colorScheme: const ColorScheme.dark(),
    cardColor: const Color(0xFF263238),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontFamily: 'Gilroy',
      ),
    ),
  );
}

extension ColorSchemeS on ColorScheme {
  Color get mainChapterRowColor => brightness == Brightness.light
      ? const Color(0xFF3F968C)
      : const Color(0xBF00695C);

  Color get mainChapterItemColor => brightness == Brightness.light
      ? const Color(0xFF00342C)
      : const Color(0xFFB2DFDB);

  Color get chapterContentColor => brightness == Brightness.light
      ? const Color(0xFF455A64)
      : const Color(0xFF263238);

  Color get chapterContentItemColor => brightness == Brightness.light
      ? const Color(0xFF455A64)
      : const Color(0xFF78909C);

  Color get favoriteChapterRowColor => brightness == Brightness.light
      ? const Color(0xFFD19834)
      : const Color(0xBFFF6F00);

  Color get favoriteChapterItemColor => brightness == Brightness.light
      ? const Color(0xFF853B00)
      : const Color(0xFFFFECB3);

  Color get supplicationRowColor => brightness == Brightness.light
      ? const Color(0xFFBF615B)
      : const Color(0xBFB71C1C);

  Color get supplicationItemColor => brightness == Brightness.light
      ? const Color(0xFF671111)
      : const Color(0xFFFFCDD2);

  Color get favoriteSupplicationRowColor => brightness == Brightness.light
      ? const Color(0xFF2196F3)
      : const Color(0xBF01579B);

  Color get favoriteSupplicationItemColor => brightness == Brightness.light
      ? const Color(0xFF092F69)
      : const Color(0xFFB3E5FC);

  Color get mainContentBookItemColor => brightness == Brightness.light
      ? const Color(0xFF795548)
      : const Color(0xFF604237);

  Color get mainContentContentBookItemColor => brightness == Brightness.light
      ? const Color(0xFF4CAF50)
      : const Color(0xBF1B5E20);

  Color get mainSettingsColor => brightness == Brightness.light
      ? const Color(0xFF009688)
      : const Color(0xFF00695C);

  Color get sliverAppBarColor => brightness == Brightness.light
      ? const Color(0xFFBDBDBD)
      : const Color(0xFF263238);

  Color get sliverAppBarTextColor => brightness == Brightness.light
      ? const Color(0xDD000000)
      : const Color(0xFFEEEEEE);

  Color get searchBackgroundColor => brightness == Brightness.light
      ? const Color(0xFFFAFAFA)
      : const Color(0xFF374752);

  Color get searchPlaceholderColor => brightness == Brightness.light
      ? const Color(0xDD000000)
      : const Color(0xFFF5F5F5);

  Color get mainChapterTitleColor => brightness == Brightness.light
      ? const Color(0xFF26A69A)
      : const Color(0xFF26A69A);

  Color get favoriteChapterTitleColor => brightness == Brightness.light
      ? const Color(0xFFFF8F00)
      : const Color(0xFFFF6F00);

  Color get mainSupplicationTitleColor => brightness == Brightness.light
      ? const Color(0xFFEF5350)
      : const Color(0xFFEF5350);

  Color get favoriteSupplicationTitleColor => brightness == Brightness.light
      ? const Color(0xFF42A5F5)
      : const Color(0xFF42A5F5);

  Color get firstIs0dd => brightness == Brightness.light
      ? const Color(0xFFFFFFFF)
      : const Color(0xFF314148);

  Color get secondIs0dd => brightness == Brightness.light
      ? const Color(0xFFEEEEEE)
      : const Color(0xFF263238);
}
