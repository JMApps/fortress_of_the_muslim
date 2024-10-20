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
        ChangeNotifierProvider(create: (_) =>
            SupplicationCountState(supplicationModel.countNumber),
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
                    _buildText(
                      text: supplicationModel.arabicText!,
                      fontIndex: contentSettings.getArabicFontIndex,
                      fontSizeIndex: contentSettings.getArabicFontSizeIndex,
                      textColor: isLightTheme ? contentSettings.getArabicLightTextColor : contentSettings.getArabicDarkTextColor,
                      textAlignIndex: contentSettings.getArabicFontAlignIndex,
                      isArabic: true,
                    ),
                  SizedBox(height: arabicIsNotEmpty ? 16 : 0),
                  transcriptionIsNotEmpty ? contentSettings.getShowTranscriptionState ?
                    _buildText(
                      text: supplicationModel.transcriptionText!,
                      fontIndex: contentSettings.getTranscriptionFontIndex,
                      fontSizeIndex: contentSettings.getTranscriptionFontSizeIndex,
                      textColor: isLightTheme ? contentSettings.getTranscriptionLightTextColor : contentSettings.getTranscriptionDarkTextColor,
                      textAlignIndex: contentSettings.getTranscriptionFontAlignIndex,
                      isArabic: false,
                    ) : const SizedBox() : const SizedBox(),
                  SizedBox(height: transcriptionIsNotEmpty ? contentSettings.getShowTranscriptionState ? 16 : 0 : 0),
                  MainHtmlData(
                    htmlData: supplicationModel.translationText,
                    footnoteColor: Colors.red,
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