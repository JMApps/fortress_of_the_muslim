import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/supplication_entity.dart';
import '../../states/content_settings_state.dart';
import '../../widgets/main_html_data.dart';
import '../../widgets/supplication_media_card.dart';

class MainSupplicationItem extends StatelessWidget {
  const MainSupplicationItem({
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
    final arabicShowState = supplicationModel.arabicText != null;
    final transcriptionShowState = supplicationModel.transcriptionText != null;
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
                arabicShowState ? Text(
                  supplicationModel.arabicText!,
                  style: TextStyle(
                    fontFamily: AppStyles.arabicFonts[contentSettings.getArabicFontIndex],
                    fontSize: AppStyles.textSizes[contentSettings.getArabicFontSizeIndex],
                    color: isLightTheme ? Color(contentSettings.getArabicLightTextColor) : Color(contentSettings.getArabicDarkTextColor),
                    height: 1.75,
                  ),
                  textAlign: AppStyles.textAligns[contentSettings.getArabicFontAlignIndex],
                  textDirection: TextDirection.rtl,
                ) : const SizedBox(),
                SizedBox(height: arabicShowState ? 16 : 0),
                transcriptionShowState ? Text(
                  supplicationModel.transcriptionText!,
                  style: TextStyle(
                    fontFamily: AppStyles.translationFonts[contentSettings.getTranscriptionFontIndex],
                    fontSize: AppStyles.textSizes[contentSettings.getTranscriptionFontSizeIndex] + 5,
                    color: isLightTheme ? Color(contentSettings.getTranscriptionLightTextColor) : Color(contentSettings.getTranscriptionDarkTextColor),
                    height: 1.75,
                  ),
                  textAlign: AppStyles.textAligns[contentSettings.getTranscriptionFontAlignIndex],
                ) : const SizedBox(),
                SizedBox(height: transcriptionShowState ? 16 : 0),
                MainHtmlData(
                  htmlData: supplicationModel.translationText,
                  footnoteColor: Colors.red,
                  font: AppStyles.translationFonts[contentSettings.getTranslationFontIndex],
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
}
