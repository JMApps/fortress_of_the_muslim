import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/pages/content_chapter.dart';
import 'package:fortress_of_the_muslim/styles/text_styles.dart';
import 'package:o_color_picker/o_color_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChapterSettings extends StatefulWidget {
  ChapterSettings({Key? key}) : super(key: key);

  @override
  _ChapterSettingsState createState() => _ChapterSettingsState();
}

class _ChapterSettingsState extends State<ChapterSettings> {
  late SharedPreferences _sharedPreferences;
  var _textStyles = TextStyles();

  static const ARABIC_SHOW_STATE = "arabic_show_state";
  static const TRANSCRIPTION_SHOW_STATE = "transcription_show_state";

  static const ARABIC_COLOR = "arabic_color";
  static const TRANSCRIPTION_COLOR = "transcription_color";
  static const TRANSLATION_COLOR = "translation_color";

  static const ARABIC_FONT_SIZE = "arabic_font_size";
  static const TRANSC_TRANSL_FONT_SIZE = "transc_transl_font_size";

  late bool _contentArabicIsShow;
  late bool _contentTranscriptionIsShow;

  late Color? _arabicColor;
  late Color? _transcriptionColor;
  late Color? _translationColor;

  late double _arabicFontSize;
  late double _transcTranslFontSize;

  @override
  void initState() {
    initSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showSettings();
      },
      icon: Icon(CupertinoIcons.settings),
    );
  }

  showSettings() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter stateSetter) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.language),
                    title: Text(
                      'Арабский',
                      style: _textStyles.settingTitleItemTextStyle,
                    ),
                    trailing: CupertinoSwitch(
                      value: _contentArabicIsShow,
                      onChanged: (value) {
                        stateSetter(() {
                          _contentArabicIsShow = value;
                          setState(() {
                            _sharedPreferences.setBool(
                                ARABIC_SHOW_STATE, _contentArabicIsShow);
                          });
                        });
                      },
                    ),
                  ),
                  Divider(
                    height: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
                  ListTile(
                    leading: Icon(Icons.language),
                    title: Text(
                      'Транскрипция',
                      style: _textStyles.settingTitleItemTextStyle,
                    ),
                    trailing: CupertinoSwitch(
                      value: _contentTranscriptionIsShow,
                      onChanged: (value) {
                        stateSetter(() {
                          _contentTranscriptionIsShow = value;
                          setState(() {
                            _sharedPreferences.setBool(TRANSCRIPTION_SHOW_STATE,
                                _contentTranscriptionIsShow);
                          });
                        });
                      },
                    ),
                  ),
                  Divider(
                    height: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Размер арабского текста',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                  StatefulBuilder(
                    builder: (context, setSliderState) {
                      return Slider(
                        activeColor: Colors.blueGrey[800],
                        inactiveColor: Colors.blueGrey[200],
                        min: 14.0,
                        max: 40.0,
                        divisions: 20,
                        label: _arabicFontSize.round().toString(),
                        value: _arabicFontSize,
                        onChanged: (dynamic value) {
                          setSliderState(() {
                            _sharedPreferences.setDouble(
                                ARABIC_FONT_SIZE, _arabicFontSize);
                            _arabicFontSize = value;
                          });
                          setState(() {
                            _arabicFontSize = value;
                          });
                        },
                      );
                    },
                  ),
                  Divider(
                    height: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
                  Divider(
                    height: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Размер текста перевода',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                  StatefulBuilder(
                    builder: (context, setSliderState) {
                      return Slider(
                        activeColor: Colors.blueGrey[800],
                        inactiveColor: Colors.blueGrey[200],
                        min: 14.0,
                        max: 40.0,
                        divisions: 20,
                        label: _transcTranslFontSize.round().toString(),
                        value: _transcTranslFontSize,
                        onChanged: (dynamic value) {
                          setSliderState(() {
                            _sharedPreferences.setDouble(
                                TRANSC_TRANSL_FONT_SIZE, _transcTranslFontSize);
                            _transcTranslFontSize = value;
                          });
                          setState(() {
                            _transcTranslFontSize = value;
                          });
                        },
                      );
                    },
                  ),
                  Divider(
                    height: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
                  ListTile(
                    leading: Icon(Icons.color_lens, color: _arabicColor),
                    title: Text('Цвет арабского текста',
                        style: _textStyles.settingTitleItemTextStyle),
                    trailing: Transform.scale(
                      scale: 0.5,
                      child: FloatingActionButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OColorPicker(
                                    selectedColor: _arabicColor,
                                    colors: primaryColorsPalette,
                                    onColorChange: (color) {
                                      setState(() {
                                        _sharedPreferences.setInt(
                                            ARABIC_COLOR, color.value);
                                        _arabicColor = color;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        elevation: 0,
                        backgroundColor: _arabicColor,
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
                  ListTile(
                    leading: Icon(Icons.color_lens, color: _transcriptionColor),
                    title: Text('Цвет текста транскрипции',
                        style: _textStyles.settingTitleItemTextStyle),
                    trailing: Transform.scale(
                      scale: 0.5,
                      child: FloatingActionButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OColorPicker(
                                    selectedColor: _transcriptionColor,
                                    colors: primaryColorsPalette,
                                    onColorChange: (color) {
                                      setState(() {
                                        _sharedPreferences.setInt(
                                            TRANSCRIPTION_COLOR, color.value);
                                        _transcriptionColor = color;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        elevation: 0,
                        backgroundColor: _transcriptionColor,
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
                  ListTile(
                    leading: Icon(Icons.color_lens, color: _translationColor),
                    title: Text('Цвет текста перевода',
                        style: _textStyles.settingTitleItemTextStyle),
                    trailing: Transform.scale(
                      scale: 0.5,
                      child: FloatingActionButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OColorPicker(
                                    selectedColor: _translationColor,
                                    colors: primaryColorsPalette,
                                    onColorChange: (color) {
                                      setState(() {
                                        _sharedPreferences.setInt(
                                            TRANSLATION_COLOR, color.value);
                                        _translationColor = color;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        elevation: 0,
                        backgroundColor: _translationColor,
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
                  SizedBox(height: 24),
                ],
              ),
            );
          },
        );
      },
    );
  }

  initSharedPreferences() {
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      setState(() {
        _sharedPreferences = sp;
        _contentArabicIsShow = sp.getBool(ARABIC_SHOW_STATE) ?? true;
        _contentTranscriptionIsShow =
            sp.getBool(TRANSCRIPTION_SHOW_STATE) ?? true;

        _arabicColor = Color(
            _sharedPreferences.getInt(ARABIC_COLOR) ?? Colors.black.value);
        _transcriptionColor = Color(
            _sharedPreferences.getInt(TRANSCRIPTION_COLOR) ??
                Colors.grey.value);
        _translationColor = Color(
            _sharedPreferences.getInt(TRANSLATION_COLOR) ?? Colors.black.value);

        _arabicFontSize =
            _sharedPreferences.getDouble(ARABIC_FONT_SIZE) ?? 18.0;
        _transcTranslFontSize =
            _sharedPreferences.getDouble(TRANSC_TRANSL_FONT_SIZE) ?? 18.0;
      });
    });
  }
}
