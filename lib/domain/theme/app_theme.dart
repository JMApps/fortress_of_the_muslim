import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade50,
    colorScheme: const ColorScheme.light(),
    cardColor: const Color(0xFFFFFFFF),
    fontFamily: 'Gilroy',
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.blueGrey.shade800,
    colorScheme: const ColorScheme.dark(),
    cardColor: const Color(0xFF263238),
    fontFamily: 'Gilroy',
  );
}

extension ColorSchemeS on ColorScheme {
  Color get mainColor => brightness == Brightness.light
      ? const Color(0xFF009688)
      : const Color(0xFF263238);

  Color get mainChapterRowColor => brightness == Brightness.light
      ? const Color(0xFF263238)
      : const Color(0xFF009688);

  Color get favoriteChapterColor => brightness == Brightness.light
      ? const Color(0xffd19834)
      : const Color(0xff48340c);

  Color get favoriteChapterRowColor => brightness == Brightness.light
      ? const Color(0xff48340c)
      : const Color(0xffd19834);

  Color get supplicationColor => brightness == Brightness.light
      ? const Color(0xffbf615b)
      : const Color(0xff522929);

  Color get supplicationRowColor => brightness == Brightness.light
      ? const Color(0xff522929)
      : const Color(0xffbf615b);

  Color get mainContentBookColor => brightness == Brightness.light
      ? const Color(0xFF795548)
      : const Color(0xFF4E342E);

  Color get mainContentContentBookColor => brightness == Brightness.light
      ? const Color(0xFF4CAF50)
      : const Color(0xFF2E7D32);

  Color get mainSettingsColor => brightness == Brightness.light
      ? const Color(0xFF009688)
      : const Color(0xFF00695C);

  Color get favoriteSupplicationColor => brightness == Brightness.light
      ? const Color(0xFF52586C)
      : const Color(0xFF23242D);

  Color get favoriteSupplicationRowColor => brightness == Brightness.light
      ? const Color(0xFF23242D)
      : const Color(0xFF747F9D);

  Color get mainChapterSearchBackground => brightness == Brightness.light
      ? const Color(0xffffffff)
      : const Color(0xFF374752);

  Color get mainSupplicationSearchBackground => brightness == Brightness.light
      ? const Color(0xffffffff)
      : const Color(0xff643232);

  Color get mainChapterSearchPlaceholder => brightness == Brightness.light
      ? const Color(0xDD000000)
      : const Color(0xFFF5F5F5);

  Color get mainTitleColor => brightness == Brightness.light
      ? const Color(0xFF009688)
      : const Color(0xFF009688);

  Color get secondIs0dd => brightness == Brightness.light
      ? const Color(0xFFEEEEEE)
      : const Color(0xFF314148);

  Color get firstIs0dd => brightness == Brightness.light
      ? const Color(0xFFFFFFFF)
      : const Color(0xFF263238);
}
