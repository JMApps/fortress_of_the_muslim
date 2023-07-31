import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:fortress_of_the_muslim/application/state/content_settings_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:provider/provider.dart';

class ContentSettingsPage extends StatelessWidget {
  const ContentSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.settings),
      ),
      body: SingleChildScrollView(
        padding: AppStyles.mainPadding,
        child: Consumer<ContentSettingsState>(
          builder: (context, contentSettings, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppStrings.arabicTextFont,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                CupertinoSlidingSegmentedControl(
                  padding: const EdgeInsets.all(4),
                  children: <int, Widget>{
                    0: Text(
                      'Scheherazade',
                      style: theme.textTheme.labelMedium,
                    ),
                    1: Text(
                      'Hafs',
                      style: theme.textTheme.labelMedium,
                    ),
                    2: Text(
                      'Amiri',
                      style: theme.textTheme.labelMedium,
                    ),
                  },
                  thumbColor: theme.colorScheme.segmentControlItemColor,
                  groupValue: contentSettings.getArabicFontIndex,
                  onValueChanged: (int? index) {
                    contentSettings.changeArabicFontIndex = index!;
                  },
                ),
                const Divider(indent: 16, endIndent: 16),
                Text(
                  AppStrings.helloArabic,
                  style: TextStyle(
                    fontFamily: AppStrings.fontArabicText[contentSettings.getArabicFontIndex],
                    fontSize: contentSettings.getArabicTextSize,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Divider(indent: 16, endIndent: 16),
                const SizedBox(height: 16),
                Text(
                  AppStrings.translationTextFont,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                CupertinoSlidingSegmentedControl(
                  padding: const EdgeInsets.all(4),
                  children: <int, Widget>{
                    0: Text(
                      'Gilroy',
                      style: theme.textTheme.labelMedium,
                    ),
                    1: Text(
                      'Ubuntu',
                      style: theme.textTheme.labelMedium,
                    ),
                    2: Text(
                      'Verdana',
                      style: theme.textTheme.labelMedium,
                    ),
                  },
                  thumbColor: theme.colorScheme.segmentControlItemColor,
                  groupValue: contentSettings.getTranslationFontIndex,
                  onValueChanged: (int? index) {
                    contentSettings.changeTranslationFontIndex = index!;
                  },
                ),
                const Divider(indent: 16, endIndent: 16),
                Text(
                  AppStrings.helloTranslation,
                  style: TextStyle(
                    fontFamily: AppStrings.fontTranslateText[contentSettings.getTranslationFontIndex],
                    fontSize: contentSettings.getTranslationTextSize,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Divider(indent: 16, endIndent: 16),
                const SizedBox(height: 16),
                Text(
                  AppStrings.textAlign,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                CupertinoSlidingSegmentedControl(
                  padding: const EdgeInsets.all(4),
                  children: const <int, Widget>{
                    0: Icon(CupertinoIcons.text_alignleft),
                    1: Icon(CupertinoIcons.text_aligncenter),
                    2: Icon(CupertinoIcons.text_alignright),
                    3: Icon(CupertinoIcons.text_justify),
                  },
                  thumbColor: theme.colorScheme.segmentControlItemColor,
                  groupValue: contentSettings.getTextAlignIndex,
                  onValueChanged: (int? index) {
                    contentSettings.changeTextAlignIndex = index!;
                  },
                ),
                const SizedBox(height: 8),
                const Divider(indent: 16, endIndent: 16),
                Text(
                  AppStrings.arabicTextSize,
                  style: theme.textTheme.bodyMedium,
                ),
                Slider(
                  value: contentSettings.getArabicTextSize,
                  min: 14,
                  max: 100,
                  divisions: 100,
                  label: contentSettings.getArabicTextSize.round().toString(),
                  onChanged: (double? size) {
                    contentSettings.changeArabicTextSize = size!;
                  },
                ),
                Text(
                  AppStrings.translationTextSize,
                  style: theme.textTheme.bodyMedium,
                ),
                Slider(
                  value: contentSettings.getTranslationTextSize,
                  min: 14,
                  max: 100,
                  divisions: 100,
                  label: contentSettings.getTranslationTextSize.round().toString(),
                  onChanged: (double? size) {
                    contentSettings.changeTranslationTextSize = size!;
                  },
                ),
                const Divider(indent: 16, endIndent: 16),
                Text(
                  AppStrings.textColor,
                  style: theme.textTheme.bodyMedium,
                ),
                const Divider(indent: 16, endIndent: 16),
                ListTile(
                  shape: AppStyles.mainShape,
                  visualDensity: const VisualDensity(
                    horizontal: -4,
                    vertical: -4,
                  ),
                  title: Text(
                    AppStrings.arabic,
                    style: theme.textTheme.bodyMedium,
                  ),
                  leading: Icon(
                    Icons.palette_outlined,
                    color: theme.brightness == Brightness.light
                        ? contentSettings.getArabicLightTextColor
                        : contentSettings.getArabicDarkTextColor,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text(
                                AppStrings.forLightTheme,
                                style: theme.textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                              shape: AppStyles.mainShape,
                              content: Material(
                                color: Colors.transparent,
                                child: MaterialColorPicker(
                                  onColorChange: (Color color) {
                                    contentSettings.changeArabicLightColor = color;
                                  },
                                  selectedColor: contentSettings.getArabicLightTextColor,
                                ),
                              ),
                              actions: [
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  shape: AppStyles.mainShape,
                                  child: Text(
                                    AppStrings.close,
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: contentSettings.getArabicLightTextColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text(
                                AppStrings.forDarkTheme,
                                style: theme.textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                              shape: AppStyles.mainShape,
                              content: Material(
                                color: Colors.transparent,
                                child: MaterialColorPicker(
                                  onColorChange: (Color color) {
                                    contentSettings.changeArabicDarkColor = color;
                                  },
                                  selectedColor: contentSettings.getArabicDarkTextColor,
                                ),
                              ),
                              actions: [
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  shape: AppStyles.mainShape,
                                  child: Text(
                                    AppStrings.close,
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor:
                              contentSettings.getArabicDarkTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  shape: AppStyles.mainShape,
                  visualDensity: const VisualDensity(
                    horizontal: -4,
                    vertical: -4,
                  ),
                  title: Text(
                    AppStrings.transcription,
                    style: theme.textTheme.bodyMedium,
                  ),
                  leading: Icon(
                    Icons.palette_outlined,
                    color: theme.brightness == Brightness.light
                        ? contentSettings.getTranscriptionLightTextColor
                        : contentSettings.getTranscriptionDarkTextColor,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text(
                                AppStrings.forLightTheme,
                                style: theme.textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                              shape: AppStyles.mainShape,
                              content: Material(
                                color: Colors.transparent,
                                child: MaterialColorPicker(
                                  onColorChange: (Color color) {
                                    contentSettings.changeTranscriptionLightColor = color;
                                  },
                                  selectedColor: contentSettings.getTranscriptionLightTextColor,
                                ),
                              ),
                              actions: [
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  shape: AppStyles.mainShape,
                                  child: Text(
                                    AppStrings.close,
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor:
                              contentSettings.getTranscriptionLightTextColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text(
                                AppStrings.forDarkTheme,
                                style: theme.textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                              shape: AppStyles.mainShape,
                              content: Material(
                                color: Colors.transparent,
                                child: MaterialColorPicker(
                                  onColorChange: (Color color) {
                                    contentSettings.changeTranscriptionDarkColor = color;
                                  },
                                  selectedColor: contentSettings.getTranscriptionDarkTextColor,
                                ),
                              ),
                              actions: [
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  shape: AppStyles.mainShape,
                                  child: Text(
                                    AppStrings.close,
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor:
                              contentSettings.getTranscriptionDarkTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  shape: AppStyles.mainShape,
                  visualDensity: const VisualDensity(
                    horizontal: -4,
                    vertical: -4,
                  ),
                  title: Text(
                    AppStrings.translation,
                    style: theme.textTheme.bodyMedium,
                  ),
                  leading: Icon(
                    Icons.palette_outlined,
                    color: theme.brightness == Brightness.light
                        ? contentSettings.getTranslationLightTextColor
                        : contentSettings.getTranslationDarkTextColor,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text(
                                AppStrings.forLightTheme,
                                style: theme.textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                              shape: AppStyles.mainShape,
                              content: Material(
                                color: Colors.transparent,
                                child: MaterialColorPicker(
                                  onColorChange: (Color color) {
                                    contentSettings.changeTranslationLightColor = color;
                                  },
                                  selectedColor: contentSettings.getTranslationLightTextColor,
                                ),
                              ),
                              actions: [
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  shape: AppStyles.mainShape,
                                  child: Text(
                                    AppStrings.close,
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor:
                              contentSettings.getTranslationLightTextColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text(
                                AppStrings.forDarkTheme,
                                style: theme.textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                              shape: AppStyles.mainShape,
                              content: Material(
                                color: Colors.transparent,
                                child: MaterialColorPicker(
                                  onColorChange: (Color color) {
                                    contentSettings.changeTranslationDarkColor =
                                        color;
                                  },
                                  selectedColor: contentSettings
                                      .getTranslationDarkTextColor,
                                ),
                              ),
                              actions: [
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  shape: AppStyles.mainShape,
                                  child: Text(
                                    AppStrings.close,
                                    style: theme.textTheme.labelMedium,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor:
                              contentSettings.getTranslationDarkTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(indent: 16, endIndent: 16),
                SwitchListTile(
                  value: contentSettings.getTranslationShowState,
                  onChanged: (bool? state) {
                    contentSettings.transcriptionShowState = state!;
                  },
                  visualDensity: const VisualDensity(
                    horizontal: -4,
                    vertical: -4,
                  ),
                  shape: AppStyles.mainShape,
                  title: Text(
                    AppStrings.transcription,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
