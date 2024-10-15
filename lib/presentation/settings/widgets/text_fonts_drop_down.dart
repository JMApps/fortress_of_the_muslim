import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../states/content_settings_state.dart';

class TextFontsDropDown extends StatelessWidget {
  const TextFontsDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final itemSelectedTextStyle = TextStyle(fontSize: 16, fontFamily: AppStrings.fontMontserrat, color: appColors.primary, fontWeight: FontWeight.bold);
    return Consumer<ContentSettingsState>(
      builder: (context, contentSettings, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              visualDensity: VisualDensity(vertical: -4),
              title: Text(
                AppStrings.font,
                style: AppStyles.mainTextStyle18Bold,
              ),
              leading: Icon(
                Icons.font_download,
                color: appColors.primary,
              ),
            ),
            _buildFontRow(
              label: AppStrings.arabic,
              fontNames: AppStrings.arabicFontNames,
              selectedFontIndex: contentSettings.getArabicFontIndex,
              onChanged: (newIndex) => contentSettings.setArabicFontIndex = newIndex,
              itemSelectedTextStyle: itemSelectedTextStyle,
              appColors: appColors,
            ),
            _buildFontRow(
              label: AppStrings.transcription,
              fontNames: AppStrings.translationFontNames,
              selectedFontIndex: contentSettings.getTranscriptionFontIndex,
              onChanged: (newIndex) => contentSettings.setTranscriptionFontIndex = newIndex,
              itemSelectedTextStyle: itemSelectedTextStyle,
              appColors: appColors,
            ),
            _buildFontRow(
              label: AppStrings.translation,
              fontNames: AppStrings.translationFontNames,
              selectedFontIndex: contentSettings.getTranslationFontIndex,
              onChanged: (newIndex) => contentSettings.setTranslationFontIndex = newIndex,
              itemSelectedTextStyle: itemSelectedTextStyle,
              appColors: appColors,
            ),
            const Divider(indent: 16, endIndent: 16),
          ],
        );
      },
    );
  }

  Widget _buildFontRow({
    required String label,
    required List<String> fontNames,
    required int selectedFontIndex,
    required ValueChanged<int> onChanged,
    required TextStyle itemSelectedTextStyle,
    required ColorScheme appColors,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppStyles.mainTextStyle18),
        DropdownButton<int>(
          iconEnabledColor: appColors.primary,
          padding: AppStyles.paddingHorizontal,
          borderRadius: AppStyles.border,
          elevation: 1,
          alignment: Alignment.centerRight,
          value: selectedFontIndex,
          items: List.generate(
            fontNames.length,
            (index) {
              return DropdownMenuItem<int>(
                value: index,
                child: Center(
                  child: Padding(
                    padding: AppStyles.paddingRightMini,
                    child: Text(
                      fontNames[index],
                      style: selectedFontIndex == index ? itemSelectedTextStyle : AppStyles.mainTextStyle18,
                    ),
                  ),
                ),
              );
            },
          ),
          onChanged: (newIndex) => onChanged(newIndex!),
          underline: Container(),
        ),
      ],
    );
  }
}
