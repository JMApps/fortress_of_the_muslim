import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../states/content_settings_state.dart';

class TextSizesDropDown extends StatelessWidget {
  const TextSizesDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final itemSelectedTextStyle = TextStyle(fontSize: 16, fontFamily: AppStrings.fontMontserrat, color: appColors.primary, fontWeight: FontWeight.bold);
    Widget buildDropDownRow({
      required String label,
      required int selectedIndex,
      required ValueChanged<int?> onChanged,
    }) {
      return Row(
        children: [
          Text(label, style: AppStyles.mainTextStyle20),
          const Spacer(),
          DropdownButton<int>(
            iconEnabledColor: appColors.primary,
            padding: AppStyles.paddingHorizontal,
            borderRadius: AppStyles.border,
            elevation: 1,
            value: selectedIndex,
            items: List.generate(
              AppStrings.fontSizeNames.length,
              (index) => DropdownMenuItem<int>(
                value: index,
                child: Center(
                  child: Padding(
                    padding: AppStyles.paddingRightMini,
                    child: Text(
                      AppStrings.fontSizeNames[index],
                      style: selectedIndex == index ? itemSelectedTextStyle : AppStyles.mainTextStyle,
                    ),
                  ),
                ),
              ),
            ),
            onChanged: onChanged,
            underline: Container(),
          ),
        ],
      );
    }

    return Consumer<ContentSettingsState>(
      builder: (context, contentSettings, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(vertical: -4),
              title: Text(
                AppStrings.textSize,
                style: AppStyles.mainTextStyle20Bold,
              ),
              leading: Icon(
                Icons.format_size,
                color: appColors.primary,
              ),
            ),
            buildDropDownRow(
              label: AppStrings.arabic,
              selectedIndex: contentSettings.getArabicFontSizeIndex,
              onChanged: (newIndex) => contentSettings.setArabicFontSizeIndex = newIndex!,
            ),
            buildDropDownRow(
              label: AppStrings.transcription,
              selectedIndex: contentSettings.getTranscriptionFontSizeIndex,
              onChanged: (newIndex) => contentSettings.setTranscriptionFontSizeIndex = newIndex!,
            ),
            buildDropDownRow(
              label: AppStrings.translation,
              selectedIndex: contentSettings.getTranslationFontSizeIndex,
              onChanged: (newIndex) => contentSettings.setTranslationFontSizeIndex = newIndex!,
            ),
            const Divider(indent: 16, endIndent: 16),
          ],
        );
      },
    );
  }
}
