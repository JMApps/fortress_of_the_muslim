import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/core/strings/app_constraints.dart';

import '../styles/app_styles.dart';

class AppThemes {
  final Color _appColor;

  AppThemes(this._appColor);

  ThemeData get lightTheme => _buildTheme(Brightness.light);

  ThemeData get darkTheme => _buildTheme(Brightness.dark);

  ThemeData _buildTheme(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      brightness: brightness,
      seedColor: _appColor,
    );

    return ThemeData(
      fontFamily: AppConstraints.fontGilroy,
      fontFamilyFallback: const [AppConstraints.fontSFPro],
      colorScheme: ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: _appColor,
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
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: AppStyles.borderMini,
          border: Border.all(
            width: 1.0,
            color: colorScheme.primary,
          ),
        ),
        textStyle: AppStyles.mainTextStyle17,
      ),
    );
  }
}
