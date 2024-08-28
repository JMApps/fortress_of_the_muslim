import 'package:flutter/material.dart';

import '../strings/app_strings.dart';
import '../styles/app_styles.dart';

class AppTheme {
  final Color themeColor;

  AppTheme({required this.themeColor});

  ThemeData get lightTheme => ThemeData(
        fontFamily: AppStrings.fontRaleway,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: themeColor,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: AppStyles.paddingHorizontal,
          alignLabelWithHint: true,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          border: OutlineInputBorder(
            borderRadius: AppStyles.border,
            borderSide: BorderSide(
              width: 0.5,
            ),
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          showDragHandle: true,
          dragHandleSize: Size(48, 3),
        ),
      );

  ThemeData get darkTheme => ThemeData(
        fontFamily: AppStrings.fontRaleway,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: themeColor,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: AppStyles.paddingHorizontal,
          alignLabelWithHint: true,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          border: OutlineInputBorder(
            borderRadius: AppStyles.border,
            borderSide: BorderSide(
              width: 0.5,
            ),
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          showDragHandle: true,
          dragHandleSize: Size(48, 3),
        ),
      );
}
