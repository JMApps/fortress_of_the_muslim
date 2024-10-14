import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/core/strings/app_strings.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/supplication_entity.dart';
import '../../states/content_settings_state.dart';
import '../../widgets/main_html_data.dart';
import '../../widgets/supplication_media_card.dart';

class ContentSupplicationItem extends StatelessWidget {
  const ContentSupplicationItem({
    super.key,
    required this.supplicationModel,
    required this.supplicationIndex,
  });

  final SupplicationEntity supplicationModel;
  final int supplicationIndex;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final appColors = appTheme.colorScheme;
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
                  fontFamily:AppStrings.arabicFontNames[contentSettings.getArabicFontIndex],
                  fontSize: AppStyles.textSizes[contentSettings.getArabicFontSizeIndex] + 5,
                  color: isLightTheme ? Color(contentSettings.getArabicLightTextColor) : Color(contentSettings.getArabicDarkTextColor),
                  height: 2,
                ),
                textAlign: AppStyles.textAligns[contentSettings.getArabicFontAlignIndex],
                textDirection: TextDirection.rtl,
              ) : const SizedBox(),
              SizedBox(height: arabicShowState ? 16 : 0),
              transcriptionShowState ? contentSettings.getShowTranscriptionState ? Text(
                supplicationModel.transcriptionText!,
                style: TextStyle(
                  fontFamily: AppStrings.translationFontNames[contentSettings.getTranscriptionFontIndex],
                  fontSize: AppStyles.textSizes[contentSettings.getTranscriptionFontSizeIndex],
                  color: isLightTheme ? Color(contentSettings.getTranscriptionLightTextColor) : Color(contentSettings.getTranscriptionDarkTextColor),
                ),
                textAlign: AppStyles.textAligns[contentSettings.getTranscriptionFontAlignIndex],
              ) : const SizedBox() : const SizedBox(),
              SizedBox(height: transcriptionShowState ? contentSettings.getShowTranscriptionState ? 16 : 0 : 0),
              MainHtmlData(
                htmlData: supplicationModel.translationText,
                footnoteColor: Colors.red,
                font: AppStrings.translationFontNames[contentSettings.getTranslationFontIndex],
                fontSize: AppStyles.textSizes[contentSettings.getTranslationFontSizeIndex],
                textAlign: AppStyles.textAligns[contentSettings.getTranslationFontAlignIndex],
                fontColor: isLightTheme ? Color(contentSettings.getTranslationLightTextColor) : Color(contentSettings.getTranslationDarkTextColor),
              ),
              SizedBox(height: supplicationModel.countNumber > 0 ? 4 : 0),
              supplicationModel.countNumber > 0 ? InkWell(
                onTap: () {},
                borderRadius: AppStyles.border,
                splashColor: appColors.primary.withOpacity(0.05),
                child: Row(
                  mainAxisAlignment: AppStyles.counterAlign[contentSettings.getCounterAlignIndex],
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: appColors.inversePrimary,
                      child: Text(
                        supplicationModel.countNumber.toString(),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppStrings.fontMontserrat,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ) : const SizedBox(),
              SizedBox(height: supplicationModel.countNumber > 0 ? 16 : 16),
              SupplicationMediaCard(supplicationModel: supplicationModel),
            ],
          );
        },
        ),
      ),
    );
  }
}
