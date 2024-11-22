import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/strings/app_constraints.dart';
import '../../../core/styles/app_styles.dart';
import '../../states/content_settings_state.dart';

class TextFontsDropDown extends StatelessWidget {
  const TextFontsDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    final itemSelectedTextStyle = TextStyle(fontSize: 16, fontFamily: AppConstraints.fontRaleway, color: appColors.primary, fontWeight: FontWeight.bold);
    return Consumer<ContentSettingsState>(
      builder: (context, contentSettings, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(vertical: -4),
              title: Text(
                appLocale.font,
                style: AppStyles.mainTextStyle17Bold,
              ),
              leading: Icon(
                Icons.font_download,
                color: appColors.primary,
              ),
            ),
            _buildFontRow(
              label: appLocale.arabic,
              fontNames: appLocale.arabicFontNames.split(', '),
              selectedFontIndex: contentSettings.getArabicFontIndex,
              onChanged: (newIndex) => contentSettings.setArabicFontIndex = newIndex,
              itemSelectedTextStyle: itemSelectedTextStyle,
              appColors: appColors,
            ),
            _buildFontRow(
              label: appLocale.transcription,
              fontNames: appLocale.translationFontNames.split(', '),
              selectedFontIndex: contentSettings.getTranscriptionFontIndex,
              onChanged: (newIndex) => contentSettings.setTranscriptionFontIndex = newIndex,
              itemSelectedTextStyle: itemSelectedTextStyle,
              appColors: appColors,
            ),
            _buildFontRow(
              label: appLocale.translation,
              fontNames: appLocale.translationFontNames.split(', '),
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
        Text(label, style: AppStyles.mainTextStyle17),
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
                      style: selectedFontIndex == index ? itemSelectedTextStyle : AppStyles.mainTextStyle17,
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
