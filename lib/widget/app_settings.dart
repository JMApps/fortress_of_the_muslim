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
          child: SizedBox(
            width: double.infinity,
            child: Material(
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Размер арабского текста',
                        style: TextStyle(fontSize: 16),
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
                            value: context
                                .watch<AppSettingsState>()
                                .getArabicTextSize,
                            onChanged: (value) {
                              context
                                  .read<AppSettingsState>()
                                  .updateArabicTextSizeValue(value);
                            },
                            onChangeEnd: (value) {
                              context
                                  .read<AppSettingsState>()
                                  .saveArabicTextSizeValue(value);
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          flex: 1,
                          child: Text(
                            '${context.watch<AppSettingsState>().getArabicTextSize.toInt()}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Размер текста перевода',
                        style: TextStyle(fontSize: 16),
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
                            value: context
                                .watch<AppSettingsState>()
                                .getTranslationTextSize,
                            onChanged: (value) {
                              context
                                  .read<AppSettingsState>()
                                  .updateTranslationTextSizeValue(value);
                            },
                            onChangeEnd: (value) {
                              context
                                  .read<AppSettingsState>()
                                  .saveTranslationTextSizeValue(value);
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Flexible(
                          flex: 1,
                          child: Text(
                            '${context.watch<AppSettingsState>().getTranslationTextSize.toInt()}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                    const Divider(indent: 16, endIndent: 16),
                    const SizedBox(height: 8),
                    const Text(
                      'Расположение текста',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: ToggleButtons(
                        selectedColor: Colors.blueGrey[800],
                        children: const [
                          Icon(Icons.format_align_left),
                          Icon(Icons.format_align_center),
                          Icon(Icons.format_align_right),
                          Icon(Icons.format_align_justify),
                        ],
                        isSelected:
                            context.watch<AppSettingsState>().getIsSelected,
                        onPressed: (index) {
                          context
                              .read<AppSettingsState>()
                              .updateToggleTextLayout(index);
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
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
                          borderRadius: BorderRadius.circular(7.5),
                          color: context
                              .watch<AppSettingsState>()
                              .getArabicTextColor,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(7.5),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(7.5),
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
                          borderRadius: BorderRadius.circular(7.5),
                          color: context
                              .watch<AppSettingsState>()
                              .getTranscriptionTextColor,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(7.5),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(7.5),
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
                            borderRadius: BorderRadius.circular(7.5),
                            color: context
                                .watch<AppSettingsState>()
                                .getTranslationTextColor),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(7.5),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(7.5),
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
                    const Divider(indent: 16, endIndent: 16),
                    SwitchListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      activeColor: Colors.blueGrey,
                      value:
                          context.watch<AppSettingsState>().getIsArabicTextShow,
                      onChanged: (value) {
                        context
                            .read<AppSettingsState>()
                            .updateArabicTextShowState(value);
                        context
                            .read<AppSettingsState>()
                            .saveArabicTextShowState(value);
                      },
                      title: Text(
                          context.watch<AppSettingsState>().getIsArabicTextShow
                              ? 'Показать арабский текст'
                              : 'Скрыть арабский текст'),
                    ),
                    SwitchListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
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
                      title: Text(context
                              .watch<AppSettingsState>()
                              .getIsTranscriptionTextShow
                          ? 'Показать текст транскрипции'
                          : 'Скрыть текст транскрипции'),
                    ),
                    SwitchListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        value:
                            context.watch<AppSettingsState>().getScreenWakelock,
                        onChanged: (value) {
                          context
                              .read<AppSettingsState>()
                              .updateScreenWakeLock(value);
                          context
                              .read<AppSettingsState>()
                              .saveScreenWakeLock(value);
                        },
                        activeColor: Colors.blueGrey,
                        title: Text(
                            context.watch<AppSettingsState>().getScreenWakelock
                                ? 'Дисплей не выключится'
                                : 'Дисплей выключится')),
                    const Divider(indent: 16, endIndent: 16),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'Закрыть',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.blueGrey,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
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
