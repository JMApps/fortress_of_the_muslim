import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/supplication_entity.dart';
import '../../states/content_settings_state.dart';
import '../../states/supplication_count_state.dart';
import '../../widgets/main_html_data.dart';
import '../../widgets/supplication_counter_button.dart';
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
    final arabicIsNotEmpty = supplicationModel.arabicText != null;
    final transcriptionIsNotEmpty = supplicationModel.transcriptionText != null;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SupplicationCountState(supplicationModel.countNumber),
        ),
      ],
      child: Card(
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
                    Text(
                      supplicationModel.arabicText!,
                      style: TextStyle(
                        fontFamily: AppStrings.arabicFontNames[contentSettings.getArabicFontIndex],
                        fontSize: AppStyles.textSizes[contentSettings.getArabicFontSizeIndex] + 5,
                        color: isLightTheme ? Color(contentSettings.getArabicLightTextColor) : Color(contentSettings.getArabicDarkTextColor),
                        height: 1.75,
                      ),
                      textAlign: AppStyles.textAligns[contentSettings.getArabicFontAlignIndex],
                      textDirection: TextDirection.rtl,
                    ),
                  SizedBox(height: arabicIsNotEmpty ? 16 : 0),
                  transcriptionIsNotEmpty ? contentSettings.getShowTranscriptionState
                      ? Text(
                    supplicationModel.transcriptionText!,
                    style: TextStyle(
                      fontFamily: AppStrings.translationFontNames[contentSettings.getTranscriptionFontIndex],
                      fontSize: AppStyles.textSizes[contentSettings.getTranscriptionFontSizeIndex],
                      color: isLightTheme ? Color(contentSettings.getTranscriptionLightTextColor) : Color(contentSettings.getTranscriptionDarkTextColor),
                    ),
                    textAlign: AppStyles.textAligns[contentSettings.getTranscriptionFontAlignIndex],
                  ) : const SizedBox() : const SizedBox(),
                  SizedBox(height: transcriptionIsNotEmpty ? contentSettings.getShowTranscriptionState ? 16 : 0 : 0),
                  MainHtmlData(
                    htmlData: supplicationModel.translationText,
                    footnoteColor: appTheme.colorScheme.primary,
                    font: AppStrings.translationFontNames[contentSettings.getTranslationFontIndex],
                    fontSize: AppStyles.textSizes[contentSettings.getTranslationFontSizeIndex],
                    textAlign: AppStyles.textAligns[contentSettings.getTranslationFontAlignIndex],
                    fontColor: isLightTheme ? Color(contentSettings.getTranslationLightTextColor) : Color(contentSettings.getTranslationDarkTextColor),
                  ),
                  SizedBox(height: supplicationModel.countNumber > 0 ? 16 : 0),
                  supplicationModel.countNumber > 0 ? SupplicationCounterButton(count: supplicationModel.countNumber) : const SizedBox(),
                  const SizedBox(height: 16),
                  SupplicationMediaCard(supplicationModel: supplicationModel),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
