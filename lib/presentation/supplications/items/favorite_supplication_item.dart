import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/supplication_entity.dart';
import '../../states/content_settings_state.dart';
import '../../widgets/main_html_data.dart';
import '../../widgets/supplication_media_card.dart';

class FavoriteSupplicationItem extends StatelessWidget {
  const FavoriteSupplicationItem({
    super.key,
    required this.supplicationModel,
    required this.supplicationIndex,
  });

  final SupplicationEntity supplicationModel;
  final int supplicationIndex;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final isLightTheme = appTheme.brightness == Brightness.light;
    final arabicIsNotEmpty = supplicationModel.arabicText != null;
    final transcriptionIsNotEmpty = supplicationModel.transcriptionText != null;
    return Card(
      elevation: 0,
      shape: AppStyles.shape,
      margin: AppStyles.paddingBottom,
      child: Padding(
        padding: AppStyles.padding,
        child: Consumer<ContentSettingsState>(
          builder: (context, contentSettings, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (arabicIsNotEmpty)
                  _buildText(
                    text: supplicationModel.arabicText!,
                    fontIndex: contentSettings.getArabicFontIndex,
                    fontSizeIndex: contentSettings.getArabicFontSizeIndex,
                    textColor: isLightTheme ? contentSettings.getArabicLightTextColor : contentSettings.getArabicDarkTextColor,
                    textAlignIndex: contentSettings.getArabicFontAlignIndex,
                    isArabic: true,
                  ),
                SizedBox(height: arabicIsNotEmpty ? 16 : 0),
                if (transcriptionIsNotEmpty)
                  _buildText(
                    text: supplicationModel.transcriptionText!,
                    fontIndex: contentSettings.getTranscriptionFontIndex,
                    fontSizeIndex: contentSettings.getTranscriptionFontSizeIndex,
                    textColor: isLightTheme ? contentSettings.getTranscriptionLightTextColor : contentSettings.getTranscriptionDarkTextColor,
                    textAlignIndex: contentSettings.getTranscriptionFontAlignIndex,
                    isArabic: false,
                  ),
                SizedBox(height: transcriptionIsNotEmpty ? 16 : 0),
                MainHtmlData(
                  htmlData: supplicationModel.translationText,
                  footnoteColor: Colors.blue,
                  font: AppStrings.translationFontNames[contentSettings.getTranslationFontIndex],
                  fontSize: AppStyles.textSizes[contentSettings.getTranslationFontSizeIndex],
                  textAlign: AppStyles.textAligns[contentSettings.getTranslationFontAlignIndex],
                  fontColor: isLightTheme ? Color(contentSettings.getTranslationLightTextColor) : Color(contentSettings.getTranslationDarkTextColor),
                ),
                const SizedBox(height: 16),
                SupplicationMediaCard(supplicationModel: supplicationModel),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildText({
    required String text,
    required int fontIndex,
    required int fontSizeIndex,
    required int textColor,
    required int textAlignIndex,
    required bool isArabic,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: isArabic ? AppStrings.arabicFontNames[fontIndex] : AppStrings.translationFontNames[fontIndex],
        fontSize: AppStyles.textSizes[fontSizeIndex] + (isArabic ? 5 : 0),
        color: Color(textColor),
        height: 1.75,
      ),
      textAlign: AppStyles.textAligns[textAlignIndex],
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
    );
  }
}