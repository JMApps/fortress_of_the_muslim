import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/domain/state/chapter_content_settings_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:provider/provider.dart';

class ContentChapterSettings extends StatelessWidget {
  const ContentChapterSettings({Key? key, required this.isDayNight})
      : super(key: key);

  final bool isDayNight;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Consumer<ChapterContentSettingsState>(
      builder: (context, chapterContentSettings, _) {
        return Material(
          borderRadius: BorderRadius.circular(15),
          child: Wrap(
            children: [
              Container(
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
                            'Отображать ${chapterContentSettings.getIsDay ? 'утренние' : 'вечерние'} азкары',
                            style: const TextStyle(fontSize: 18),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: ToggleButtons(
                              borderRadius: BorderRadius.circular(15),
                              isSelected:
                                  chapterContentSettings.getIsDayNightSelected,
                              onPressed: (index) => chapterContentSettings
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
                        isSelected:
                            chapterContentSettings.getIsTextAlignSelected,
                        onPressed: (index) =>
                            chapterContentSettings.updateToggleTextAlign(index),
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
                        value: 50,
                        onChanged: (value) {},
                      ),
                      trailing: const Text(
                        '20',
                        style: TextStyle(fontSize: 18),
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
                        value: 50,
                        onChanged: (value) {},
                      ),
                      trailing: const Text(
                        '20',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Divider(),
                    const SizedBox(height: 8),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.palette_outlined),
                      title: const Text(
                        'Цвет арабского текста',
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: InkWell(
                        child: const Icon(
                          Icons.palette,
                          size: 35,
                        ),
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(height: 8),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.palette_outlined),
                      title: const Text(
                        'Цвет текста транскрипции',
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: InkWell(
                        child: const Icon(
                          Icons.palette,
                          size: 35,
                        ),
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(height: 8),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.palette_outlined),
                      title: const Text(
                        'Цвет текста перевода',
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: InkWell(
                        child: const Icon(
                          Icons.palette,
                          size: 35,
                        ),
                        onTap: () {},
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
                        value: false,
                        onChanged: (value) {},
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
                        value: true,
                        onChanged: (value) {},
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
            ],
          ),
        );
      },
    );
  }
}
