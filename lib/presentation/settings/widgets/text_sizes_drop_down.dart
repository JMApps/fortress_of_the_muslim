import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/core/strings/app_constraints.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/styles/app_styles.dart';
import '../../states/content_settings_state.dart';

class TextSizesDropDown extends StatelessWidget {
  const TextSizesDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    final itemSelectedTextStyle = TextStyle(fontSize: 16, fontFamily: AppConstraints.fontGilroy, color: appColors.primary, fontWeight: FontWeight.bold);
    Widget buildDropDownRow({
      required String label,
      required int selectedIndex,
      required ValueChanged<int?> onChanged,
    }) {
      return Row(
        children: [
          Text(label, style: AppStyles.mainTextStyle17),
          const Spacer(),
          DropdownButton<int>(
            iconEnabledColor: appColors.primary,
            padding: AppStyles.paddingHorizontal,
            borderRadius: AppStyles.border,
            elevation: 1,
            alignment: Alignment.centerRight,
            value: selectedIndex,
            items: List.generate(
              appLocale.fontSizeNames.split(', ').length,
              (index) => DropdownMenuItem<int>(
                value: index,
                child: Center(
                  child: Padding(
                    padding: AppStyles.paddingRightMini,
                    child: Text(
                      appLocale.fontSizeNames.split(', ')[index],
                      style: selectedIndex == index ? itemSelectedTextStyle : AppStyles.mainTextStyle17,
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
        final appLocale = AppLocalizations.of(context)!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(vertical: -4),
              title: Text(
                appLocale.textSize,
                style: AppStyles.mainTextStyle17Bold,
              ),
              leading: Icon(
                Icons.format_size,
                color: appColors.primary,
              ),
            ),
            buildDropDownRow(
              label: appLocale.arabic,
              selectedIndex: contentSettings.getArabicFontSizeIndex,
              onChanged: (newIndex) => contentSettings.setArabicFontSizeIndex = newIndex!,
            ),
            buildDropDownRow(
              label: appLocale.transcription,
              selectedIndex: contentSettings.getTranscriptionFontSizeIndex,
              onChanged: (newIndex) => contentSettings.setTranscriptionFontSizeIndex = newIndex!,
            ),
            buildDropDownRow(
              label: appLocale.translation,
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
