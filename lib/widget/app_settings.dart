import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/provider/app_settings_state.dart';
import 'package:o_color_picker/o_color_picker.dart';
import 'package:provider/provider.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          margin: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            child: Material(
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Размер текста',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: CupertinoSlider(
                            activeColor: Colors.blue,
                            min: 14,
                            max: 40,
                            value:
                                context.watch<AppSettingsState>().getTextSize,
                            onChanged: (value) {
                              context
                                  .read<AppSettingsState>()
                                  .updateTextSizeValue(value);
                            },
                            onChangeEnd: (value) {
                              context
                                  .read<AppSettingsState>()
                                  .saveTextSizeValue(value);
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          flex: 1,
                          child: Text(
                            '${context.watch<AppSettingsState>().getTextSize.toInt()}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                    const Divider(indent: 16, endIndent: 16),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.palette_outlined,
                        color: context
                            .watch<AppSettingsState>()
                            .getArabicTextColor,
                      ),
                      title: const Text(
                        'Цвет арабского текста',
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: context
                              .watch<AppSettingsState>()
                              .getArabicTextColor,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                content: OColorPicker(
                                  selectedColor: context
                                      .watch<AppSettingsState>()
                                      .getArabicTextColor,
                                  colors: primaryColorsPalette,
                                  onColorChange: (color) {
                                    context
                                        .read<AppSettingsState>()
                                        .updateArabicTextColor(color);
                                    context
                                        .read<AppSettingsState>()
                                        .saveArabicTextColor(color);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.palette_outlined,
                        color: context
                            .watch<AppSettingsState>()
                            .getTranscriptionTextColor,
                      ),
                      title: const Text(
                        'Цвет текста транскрипции',
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: context
                              .watch<AppSettingsState>()
                              .getTranscriptionTextColor,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                content: OColorPicker(
                                  selectedColor: context
                                      .watch<AppSettingsState>()
                                      .getTranscriptionTextColor,
                                  colors: primaryColorsPalette,
                                  onColorChange: (color) {
                                    context
                                        .read<AppSettingsState>()
                                        .updateTranscriptionTextColor(color);
                                    context
                                        .read<AppSettingsState>()
                                        .saveTranscriptionTextColor(color);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.palette_outlined,
                        color: context
                            .watch<AppSettingsState>()
                            .getTranslationTextColor,
                      ),
                      title: const Text(
                        'Цвет текста перевода',
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: context
                                .watch<AppSettingsState>()
                                .getTranslationTextColor),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                content: OColorPicker(
                                  selectedColor: context
                                      .watch<AppSettingsState>()
                                      .getTranslationTextColor,
                                  colors: primaryColorsPalette,
                                  onColorChange: (color) {
                                    context
                                        .read<AppSettingsState>()
                                        .updateTranslationTextColor(color);
                                    context
                                        .read<AppSettingsState>()
                                        .saveTranslationTextColor(color);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Divider(indent: 16, endIndent: 16),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      leading: Switch(
                        activeColor: Colors.blueGrey,
                        value: context
                            .watch<AppSettingsState>()
                            .getIsArabicTextShow,
                        onChanged: (value) {
                          context
                              .read<AppSettingsState>()
                              .updateArabicTextShowState(value);
                          context
                              .read<AppSettingsState>()
                              .saveArabicTextShowState(value);
                        },
                      ),
                      title: Text(
                          context.watch<AppSettingsState>().getIsArabicTextShow
                              ? 'Скрыть арабский текст'
                              : 'Показать арабский текст'),
                    ),
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      leading: Switch(
                        activeColor: Colors.blueGrey,
                        value: context
                            .watch<AppSettingsState>()
                            .getIsTranscriptionTextShow,
                        onChanged: (value) {
                          context
                              .read<AppSettingsState>()
                              .updateTranscriptionTextShowState(value);
                          context
                              .read<AppSettingsState>()
                              .saveTranscriptionTextShowState(value);
                        },
                      ),
                      title: Text(context
                              .watch<AppSettingsState>()
                              .getIsTranscriptionTextShow
                          ? 'Скрыть текст транскрипции'
                          : 'Показать текст транскрипции'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
