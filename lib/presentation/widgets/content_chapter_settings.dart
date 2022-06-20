import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/constants.dart';
import 'package:fortress_of_the_muslim/domain/state/chapter_content_settings_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:o_color_picker/o_color_picker.dart';
import 'package:provider/provider.dart';

class ContentChapterSettings extends StatelessWidget {
  const ContentChapterSettings({Key? key, required this.isDayNight})
      : super(key: key);

  final bool isDayNight;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Consumer<ChapterContentSettingsState>(
      builder: (context, chapterContentSettingsState, child) {
        return Material(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: const EdgeInsets.all(16),
            width: double.maxFinite,
            child: ListView(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                Visibility(
                  maintainAnimation: false,
                  maintainSize: false,
                  visible: isDayNight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Отображать ${chapterContentSettingsState.getIsDay ? 'утренние' : 'вечерние'} азкары',
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: ToggleButtons(
                          borderRadius: BorderRadius.circular(15),
                          isSelected: chapterContentSettingsState
                              .getIsDayNightSelected,
                          onPressed: (index) => chapterContentSettingsState
                              .updateToggleDayNight(index),
                          children: const [
                            Icon(CupertinoIcons.sunrise),
                            Icon(CupertinoIcons.sunset_fill),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Divider(),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                const Text(
                  'Расположение текста',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 16),
                Center(
                  child: ToggleButtons(
                    borderRadius: BorderRadius.circular(15),
                    isSelected: chapterContentSettingsState.getIsTextAlignSelected,
                    onPressed: (index) => chapterContentSettingsState.updateToggleTextAlign(index),
                    children: const [
                      Icon(CupertinoIcons.text_alignleft),
                      Icon(CupertinoIcons.text_aligncenter),
                      Icon(CupertinoIcons.text_alignright),
                      Icon(CupertinoIcons.text_justify),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(CupertinoIcons.textformat_size),
                  title: const Text(
                    'Размер арабского текста',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.start,
                  ),
                  subtitle: Slider.adaptive(
                    min: 14,
                    max: 100,
                    value: chapterContentSettingsState.getTextArabicSize.toDouble(),
                    onChanged: (value) {
                      chapterContentSettingsState.changeTextArabicSize(value);
                    },
                    onChangeEnd: (value) {
                      chapterContentSettingsState.saveInt(Constants.keyTextArabicSize, value.toInt());
                    },
                  ),
                  trailing: Text(
                    chapterContentSettingsState.getTextArabicSize
                        .toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(CupertinoIcons.textformat_size),
                  title: const Text(
                    'Размер текста перевода',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.start,
                  ),
                  subtitle: Slider.adaptive(
                    min: 14,
                    max: 100,
                    value: chapterContentSettingsState.getTextTranslateSize.toDouble(),
                    onChanged: (value) {
                      chapterContentSettingsState.changeTextTranslateSize(value);
                    },
                    onChangeEnd: (value) {
                      chapterContentSettingsState.saveInt(Constants.keyTextTranslateSize, value.toInt());
                    },
                  ),
                  trailing: Text(
                    chapterContentSettingsState.getTextTranslateSize
                        .toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.palette_outlined,
                    color: Color(chapterContentSettingsState.getArabicTextColor),
                  ),
                  title: const Text(
                    'Цвет арабского текста',
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    child: Icon(
                      Icons.palette,
                      size: 35,
                      color: Color(chapterContentSettingsState.getArabicTextColor),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          content: OColorPicker(
                            selectedColor: Color(chapterContentSettingsState.getArabicTextColor),
                            colors: primaryColorsPalette,
                            onColorChange: (color) {
                              chapterContentSettingsState
                                  .changeTextArabicColor(color);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.palette_outlined,
                    color: Color(chapterContentSettingsState.getTranscriptionTextColor)
                  ),
                  title: const Text(
                    'Цвет текста транскрипции',
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    child: Icon(
                      Icons.palette,
                      size: 35,
                      color: Color(chapterContentSettingsState.getTranscriptionTextColor),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          content: OColorPicker(
                            selectedColor: Color(chapterContentSettingsState.getTranscriptionTextColor),
                            colors: primaryColorsPalette,
                            onColorChange: (color) {
                              chapterContentSettingsState
                                  .changeTextTranscriptionColor(color);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 8),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.palette_outlined,
                    color: Color(chapterContentSettingsState.getTranslateTextColor),
                  ),
                  title: const Text(
                    'Цвет текста перевода',
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    child: Icon(
                      Icons.palette,
                      size: 35,
                      color: Color(chapterContentSettingsState.getTranslateTextColor),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          content: OColorPicker(
                            selectedColor: Color(chapterContentSettingsState.getTranslateTextColor),
                            colors: primaryColorsPalette,
                            onColorChange: (color) {
                              chapterContentSettingsState
                                  .changeTextTranslateColor(color);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.invert_colors_off),
                  title: const Text(
                    'Выбранные цвета для светлой и ночной темы',
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: Switch.adaptive(
                    value: chapterContentSettingsState.getIsDefaultColors,
                    onChanged: (value) {
                      chapterContentSettingsState
                          .changeDefaultColorsState(value);
                    },
                  ),
                ),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(CupertinoIcons.eye),
                  title: const Text(
                    'Отображать транскрипцию',
                    style: TextStyle(fontSize: 18),
                  ),
                  trailing: Switch.adaptive(
                    value: chapterContentSettingsState.getIsTranscriptionShow,
                    onChanged: (value) {
                      chapterContentSettingsState.changeTranscriptionShow(value);
                    },
                  ),
                ),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: myColor.contentChapterTitleColor,
                  child: const Text(
                    'Закрыть',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
