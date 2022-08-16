import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/constants.dart';
import 'package:fortress_of_the_muslim/domain/state/chapter_content_settings_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:o_color_picker/o_color_picker.dart';
import 'package:provider/provider.dart';

class ContentChapterSettings extends StatelessWidget {
  const ContentChapterSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.maxFinite,
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Отображать ${context.watch<ChapterContentSettingsState>().getIsDay ? 'утренние' : 'вечерние'} азкары',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 16),
              Center(
                child: ToggleButtons(
                  borderRadius: BorderRadius.circular(15),
                  isSelected: context
                      .watch<ChapterContentSettingsState>()
                      .getIsDayNightSelected,
                  onPressed: (index) => context
                      .read<ChapterContentSettingsState>()
                      .updateToggleDayNight(index),
                  children: const [
                    Icon(CupertinoIcons.sunrise),
                    Icon(CupertinoIcons.sunset_fill),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 4),
          const Text(
            'Расположение текста',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 16),
          Center(
            child: ToggleButtons(
              borderRadius: BorderRadius.circular(15),
              isSelected: context
                  .watch<ChapterContentSettingsState>()
                  .getIsTextAlignSelected,
              onPressed: (index) => context
                  .read<ChapterContentSettingsState>()
                  .updateToggleTextAlign(index),
              children: const [
                Icon(CupertinoIcons.text_alignleft),
                Icon(CupertinoIcons.text_aligncenter),
                Icon(CupertinoIcons.text_alignright),
                Icon(CupertinoIcons.text_justify),
              ],
            ),
          ),
          const Divider(),
          const SizedBox(height: 4),
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
              max: 50,
              value: context
                  .watch<ChapterContentSettingsState>()
                  .getTextArabicSize,
              onChanged: (currentArabicTextSize) {
                context
                    .read<ChapterContentSettingsState>()
                    .changeTextArabicSize(currentArabicTextSize);
              },
              onChangeEnd: (lastArabicTextSize) {
                context.read<ChapterContentSettingsState>().saveDouble(
                    Constants.keyTextArabicSize, lastArabicTextSize);
              },
            ),
            trailing: Text(
              '${context.watch<ChapterContentSettingsState>().getTextArabicSize.toInt()}',
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 8),
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
              max: 50,
              value: context
                  .watch<ChapterContentSettingsState>()
                  .getTextTranslateSize,
              onChanged: (currentTranslationTextSize) {
                context
                    .read<ChapterContentSettingsState>()
                    .changeTextTranslateSize(currentTranslationTextSize);
              },
              onChangeEnd: (lastTranslationTextSize) {
                context.read<ChapterContentSettingsState>().saveDouble(
                    Constants.keyTextTranslateSize, lastTranslationTextSize);
              },
            ),
            trailing: Text(
              '${context.watch<ChapterContentSettingsState>().getTextTranslateSize.toInt()}',
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const Divider(),
          const SizedBox(height: 4),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                'Шрифт арабского текста',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 8),
              ToggleButtons(
                borderRadius: BorderRadius.circular(15),
                direction: Axis.vertical,
                isSelected: context
                    .watch<ChapterContentSettingsState>()
                    .getIsTextArabicFontSelected,
                onPressed: (index) => context
                    .read<ChapterContentSettingsState>()
                    .updateToggleTextArabicFont(index),
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'السلام عليكم',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Hafs',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'السلام عليكم',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Amiri',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'السلام عليكم',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Quran',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
          const Divider(),
          const SizedBox(height: 4),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                'Шрифт текста перевода',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 8),
              ToggleButtons(
                borderRadius: BorderRadius.circular(15),
                direction: Axis.vertical,
                isSelected: context
                    .watch<ChapterContentSettingsState>()
                    .getIsTextTranslationFontSelected,
                onPressed: (index) => context
                    .read<ChapterContentSettingsState>()
                    .updateToggleTextTranslationFont(index),
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Ас-Саляму Аляй-кум',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Ас-Саляму Аляй-кум',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Calibri',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Ас-Саляму Аляй-кум',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Times',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
          const SizedBox(height: 4),
          const Divider(),
          const SizedBox(height: 4),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text(
              'Цвет арабского текста',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton.icon(
                  label: Icon(
                    CupertinoIcons.brightness,
                    color: myColor.sliverAppBarTextColor,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(myColor.colorButtonShadow),
                  ),
                  icon: Icon(
                    Icons.palette,
                    size: 35,
                    color: Color(context
                        .watch<ChapterContentSettingsState>()
                        .getArabicTextColor),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        backgroundColor:
                            Theme.of(context).colorScheme.firstIs0dd,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        content: OColorPicker(
                          selectedColor: Color(context
                              .watch<ChapterContentSettingsState>()
                              .getArabicTextColor),
                          colors: primaryColorsPalette,
                          onColorChange: (color) {
                            context
                                .read<ChapterContentSettingsState>()
                                .changeTextArabicColor(color);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 16,),
                TextButton.icon(
                  label: Icon(
                    CupertinoIcons.brightness_solid,
                    color: myColor.sliverAppBarTextColor,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(myColor.colorButtonShadow),
                  ),
                  icon: Icon(
                    Icons.palette,
                    size: 35,
                    color: Color(context
                        .watch<ChapterContentSettingsState>()
                        .getArabicTextColorNight),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        backgroundColor: myColor.firstIs0dd,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        content: OColorPicker(
                          selectedColor: Color(context
                              .watch<ChapterContentSettingsState>()
                              .getArabicTextColorNight),
                          colors: primaryColorsPalette,
                          onColorChange: (color) {
                            context
                                .read<ChapterContentSettingsState>()
                                .changeTextArabicColorNight(color);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text(
              'Цвет текста транскрипции',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton.icon(
                  label: Icon(
                    CupertinoIcons.brightness,
                    color: myColor.sliverAppBarTextColor,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(myColor.colorButtonShadow),
                  ),
                  icon: Icon(
                    Icons.palette,
                    size: 35,
                    color: Color(context
                        .watch<ChapterContentSettingsState>()
                        .getTranscriptionTextColor),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        backgroundColor: myColor.firstIs0dd,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        content: OColorPicker(
                          selectedColor: Color(context
                              .watch<ChapterContentSettingsState>()
                              .getTranscriptionTextColor),
                          colors: primaryColorsPalette,
                          onColorChange: (color) {
                            context
                                .read<ChapterContentSettingsState>()
                                .changeTextTranscriptionColor(color);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 16,),
                TextButton.icon(
                  label: Icon(
                    CupertinoIcons.brightness_solid,
                    color: myColor.sliverAppBarTextColor,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(myColor.colorButtonShadow),
                  ),
                  icon: Icon(
                    Icons.palette,
                    size: 35,
                    color: Color(context
                        .watch<ChapterContentSettingsState>()
                        .getTranscriptionTextColorNight),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        backgroundColor: myColor.firstIs0dd,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        content: OColorPicker(
                          selectedColor: Color(context
                              .watch<ChapterContentSettingsState>()
                              .getTranscriptionTextColorNight),
                          colors: primaryColorsPalette,
                          onColorChange: (color) {
                            context
                                .read<ChapterContentSettingsState>()
                                .changeTextTranscriptionColorNight(color);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text(
              'Цвет текста перевода',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton.icon(
                  label: Icon(CupertinoIcons.brightness, color: myColor.sliverAppBarTextColor,),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(myColor.colorButtonShadow),
                  ),
                  icon: Icon(
                    Icons.palette,
                    size: 35,
                    color: Color(context
                        .watch<ChapterContentSettingsState>()
                        .getTranslateTextColor),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        backgroundColor: myColor.firstIs0dd,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        content: OColorPicker(
                          selectedColor: Color(context
                              .watch<ChapterContentSettingsState>()
                              .getTranslateTextColor),
                          colors: primaryColorsPalette,
                          onColorChange: (color) {
                            context
                                .read<ChapterContentSettingsState>()
                                .changeTextTranslateColor(color);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 16,),
                TextButton.icon(
                  label: Icon(CupertinoIcons.brightness_solid, color: myColor.sliverAppBarTextColor,),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(myColor.colorButtonShadow),
                  ),
                  icon: Icon(
                    Icons.palette,
                    size: 35,
                    color: Color(context
                        .watch<ChapterContentSettingsState>()
                        .getTranslateTextColorNight),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        backgroundColor: myColor.firstIs0dd,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        content: OColorPicker(
                          selectedColor: Color(context
                              .watch<ChapterContentSettingsState>()
                              .getTranslateTextColorNight),
                          colors: primaryColorsPalette,
                          onColorChange: (color) {
                            context
                                .read<ChapterContentSettingsState>()
                                .changeTextTranslateColorNight(color);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.remove_red_eye),
            title: const Text(
              'Отображать транскрипцию',
              style: TextStyle(fontSize: 18),
            ),
            trailing: Switch.adaptive(
              value: context
                  .watch<ChapterContentSettingsState>()
                  .getIsTranscriptionShow,
              onChanged: (value) {
                context
                    .read<ChapterContentSettingsState>()
                    .changeTranscriptionShow(value);
              },
            ),
          ),
          const SizedBox(height: 8),
          const Divider(),
        ],
      ),
    );
  }
}
