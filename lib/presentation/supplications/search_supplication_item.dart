import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/content_settings_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/data/model/main_supplication_model.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/for_html_text.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/search_media_card.dart';
import 'package:provider/provider.dart';

class SearchSupplicationItem extends StatelessWidget {
  const SearchSupplicationItem({
    super.key,
    required this.item,
    required this.itemIndex,
  });

  final MainSupplicationModel item;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<ContentSettingsState>(
      builder: (context, settings, _) {
        return Card(
          elevation: 0,
          margin: AppStyles.mainMarginMini,
          color: itemIndex.isOdd
              ? theme.colorScheme.cardOddColor
              : theme.colorScheme.cardColor,
          child: Padding(
            padding: AppStyles.mainPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                item.arabicText != null
                    ? Text(
                        item.arabicText!,
                        style: TextStyle(
                            fontSize: settings.getArabicTextSize,
                            fontFamily: AppStrings.fontArabicText[settings.getArabicFontIndex],
                            color: Theme.of(context).brightness == Brightness.light
                                    ? settings.getArabicLightTextColor
                                    : settings.getArabicDarkTextColor),
                        textAlign: AppStyles
                            .arabicTextAlign[settings.getTextAlignIndex],
                        textDirection: TextDirection.rtl,
                      )
                    : const SizedBox(),
                item.arabicText != null
                    ? const SizedBox(height: 8)
                    : const SizedBox(),
                item.transcriptionText != null
                    ? settings.getTranslationShowState
                        ? Text(
                            item.transcriptionText!,
                            style: TextStyle(
                              fontSize: settings.getTranslationTextSize,
                              fontFamily: AppStrings.fontTranslateText[
                                  settings.getTranslationFontIndex],
                              color: Theme.of(context).brightness == Brightness.light
                                  ? settings.getTranscriptionLightTextColor
                                  : settings.getTranscriptionDarkTextColor,
                              fontWeight: FontWeight.w100,
                            ),
                            textAlign:
                                AppStyles.textAlign[settings.getTextAlignIndex],
                          )
                        : const SizedBox()
                    : const SizedBox(),
                item.transcriptionText != null
                    ? settings.getTranslationShowState
                        ? const SizedBox(height: 16)
                        : const SizedBox()
                    : const SizedBox(),
                ForHtmlText(
                  textData: item.translationText,
                  textSize: settings.getTranslationTextSize,
                  textColor: Theme.of(context).brightness == Brightness.light
                      ? settings.getTranslationLightTextColor
                      : settings.getTranslationDarkTextColor,
                  fontFamily: AppStrings.fontTranslateText[settings.getTranslationFontIndex],
                  footnoteColor: theme.colorScheme.mainSupplicationsColor,
                  textDataAlign:
                      AppStyles.textAlign[settings.getTextAlignIndex],
                ),
                const SizedBox(height: 16),
                SearchMediaCard(
                  item: item,
                  itemColor: theme.colorScheme.mainSupplicationsColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
