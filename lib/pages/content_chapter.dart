import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:fortress_of_the_muslim/model/chapter_arguments.dart';
import 'package:fortress_of_the_muslim/model/supplication_item.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';
import 'package:fortress_of_the_muslim/styles/text_styles.dart';
import 'package:fortress_of_the_muslim/widget/player.dart';
import 'package:o_color_picker/o_color_picker.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContentChapter extends StatefulWidget {
  @override
  _ContentChapterState createState() => _ContentChapterState();
}

class _ContentChapterState extends State<ContentChapter>
    with SingleTickerProviderStateMixin {
  var _databaseQuery = DatabaseQuery();
  var _textStyles = TextStyles();

  static const ARABIC_SHOW_STATE = "arabic_show_state";
  static const TRANSCRIPTION_SHOW_STATE = "transcription_show_state";
  static const ARABIC_COLOR = "arabic_color";
  static const TRANSCRIPTION_COLOR = "transcription_color";
  static const TRANSLATION_COLOR = "translation_color";
  static const COUNT_NUMBER_STATE = "count_number_state";
  static const ARABIC_FONT_SIZE = "arabic_font_size";
  static const TRANSC_TRANSL_FONT_SIZE = "transc_transl_font_size";

  late SharedPreferences sharedPreferences;
  var _myPlayer = MyPlayer();

  late int _countNumber;
  bool _isCountShow = false;
  late bool _contentArabicIsShow;
  late bool _contentTranscriptionIsShow;

  late Color? arabicColor;
  late Color? transcriptionColor;
  late Color? translationColor;

  late double _arabicFontSize;
  late double _transcTranslFontSize;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      setState(() {
        sharedPreferences = sp;
        _contentArabicIsShow = sp.getBool(ARABIC_SHOW_STATE) ?? true;
        _contentTranscriptionIsShow =
            sp.getBool(TRANSCRIPTION_SHOW_STATE) ?? true;
        _countNumber = sp.getInt(COUNT_NUMBER_STATE) ?? 0;
        arabicColor =
            Color(sharedPreferences.getInt(ARABIC_COLOR) ?? Colors.black.value);
        transcriptionColor = Color(
            sharedPreferences.getInt(TRANSCRIPTION_COLOR) ?? Colors.grey.value);
        translationColor = Color(
            sharedPreferences.getInt(TRANSLATION_COLOR) ?? Colors.black.value);
        _arabicFontSize = sharedPreferences.getDouble(ARABIC_FONT_SIZE) ?? 18.0;
        _transcTranslFontSize =
            sharedPreferences.getDouble(TRANSC_TRANSL_FONT_SIZE) ?? 18.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ChapterArguments? args =
        ModalRoute.of(context)!.settings.arguments as ChapterArguments?;
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[500],
          title: Text('Глава ${args!.chapterId}'),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter stateSetter) {
                            return Column(
                              children: [
                                FractionallySizedBox(
                                  widthFactor: 0.25,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 12.0,
                                    ),
                                    child: Container(
                                      height: 5.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(2.5)),
                                      ),
                                    ),
                                  ),
                                ),
                                ListTile(
                                  leading: Icon(Icons.language),
                                  title: Text(
                                    'Арабский',
                                    style:
                                        _textStyles.settingTitleItemTextStyle,
                                  ),
                                  trailing: CupertinoSwitch(
                                    value: _contentArabicIsShow,
                                    onChanged: (value) {
                                      stateSetter(() {
                                        _contentArabicIsShow = value;
                                        setState(() {
                                          sharedPreferences.setBool(
                                              ARABIC_SHOW_STATE,
                                              _contentArabicIsShow);
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
                                    style:
                                        _textStyles.settingTitleItemTextStyle,
                                  ),
                                  trailing: CupertinoSwitch(
                                    value: _contentTranscriptionIsShow,
                                    onChanged: (value) {
                                      stateSetter(() {
                                        _contentTranscriptionIsShow = value;
                                        setState(() {
                                          sharedPreferences.setBool(
                                              TRANSCRIPTION_SHOW_STATE,
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
                                          sharedPreferences.setDouble(
                                              ARABIC_FONT_SIZE,
                                              _arabicFontSize);
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
                                      label: _transcTranslFontSize
                                          .round()
                                          .toString(),
                                      value: _transcTranslFontSize,
                                      onChanged: (dynamic value) {
                                        setSliderState(() {
                                          sharedPreferences.setDouble(
                                              TRANSC_TRANSL_FONT_SIZE,
                                              _transcTranslFontSize);
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
                                  leading: Icon(Icons.color_lens,
                                      color: arabicColor),
                                  title: Text('Цвет арабского текста',
                                      style: _textStyles
                                          .settingTitleItemTextStyle),
                                  trailing: Transform.scale(
                                    scale: 0.5,
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25))),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                OColorPicker(
                                                  selectedColor: arabicColor,
                                                  colors: primaryColorsPalette,
                                                  onColorChange: (color) {
                                                    setState(() {
                                                      sharedPreferences.setInt(
                                                          ARABIC_COLOR,
                                                          color.value);
                                                      arabicColor = color;
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
                                      backgroundColor: arabicColor,
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  indent: 16,
                                  endIndent: 16,
                                ),
                                ListTile(
                                  leading: Icon(Icons.color_lens,
                                      color: transcriptionColor),
                                  title: Text('Цвет текста транскрипции',
                                      style: _textStyles
                                          .settingTitleItemTextStyle),
                                  trailing: Transform.scale(
                                    scale: 0.5,
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25))),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                OColorPicker(
                                                  selectedColor:
                                                      transcriptionColor,
                                                  colors: primaryColorsPalette,
                                                  onColorChange: (color) {
                                                    setState(() {
                                                      sharedPreferences.setInt(
                                                          TRANSCRIPTION_COLOR,
                                                          color.value);
                                                      transcriptionColor =
                                                          color;
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
                                      backgroundColor: transcriptionColor,
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  indent: 16,
                                  endIndent: 16,
                                ),
                                ListTile(
                                  leading: Icon(Icons.color_lens,
                                      color: translationColor),
                                  title: Text('Цвет текста перевода',
                                      style: _textStyles
                                          .settingTitleItemTextStyle),
                                  trailing: Transform.scale(
                                    scale: 0.5,
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25))),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                OColorPicker(
                                                  selectedColor:
                                                      translationColor,
                                                  colors: primaryColorsPalette,
                                                  onColorChange: (color) {
                                                    setState(() {
                                                      sharedPreferences.setInt(
                                                          TRANSLATION_COLOR,
                                                          color.value);
                                                      translationColor = color;
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
                                      backgroundColor: translationColor,
                                    ),
                                  ),
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
                                SizedBox(height: 24),
                              ],
                            );
                          },
                        ),
                      );
                    });
              },
              icon: Icon(CupertinoIcons.settings),
            ),
            Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                  value: _isCountShow,
                  onChanged: (value) {
                    setState(() {
                      _isCountShow = value;
                    });
                  },
                  activeColor: Colors.blueGrey[900],
                  trackColor: Colors.blueGrey[700]),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.blueGrey[200],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: Html(
                data: args.chapterTitle,
                style: {
                  "#":
                      Style(textAlign: TextAlign.center, fontSize: FontSize(18))
                },
              ),
            ),
            Expanded(
              child: Scrollbar(
                child: _buildList(args.chapterId!),
              ),
            ),
            _myPlayer,
          ],
        ),
        floatingActionButton: _isCountShow
            ? InkWell(
                onLongPress: () {
                  setState(() {
                    _countNumber = 0;
                    sharedPreferences.setInt(COUNT_NUMBER_STATE, _countNumber);
                  });
                },
                child: FloatingActionButton(
                  elevation: 0,
                  child: Text('$_countNumber',
                      style: _textStyles.contentChapterFloatingButtonTextStyle),
                  backgroundColor: Colors.blueGrey[700],
                  onPressed: () {
                    setState(() {
                      if (_countNumber < 100) {
                        _countNumber++;
                      }
                      sharedPreferences.setInt(
                          COUNT_NUMBER_STATE, _countNumber);
                    });
                  },
                ),
              )
            : SizedBox());
  }

  Widget _buildList(int chapterId) {
    return FutureBuilder<List>(
      future: _databaseQuery.getContentChapter(chapterId),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildContentChapterItem(snapshot.data![index]);
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget _buildContentChapterItem(SupplicationItem item) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.all(8),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _contentArabicIsShow
              ? item.contentArabic != null
                  ? Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(item.contentArabic,
                          style: TextStyle(
                              color: arabicColor,
                              fontSize: _arabicFontSize,
                              fontFamily: 'Hafs'),
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.rtl),
                    )
                  : SizedBox()
              : SizedBox(),
          _contentTranscriptionIsShow
              ? item.contentTranscription != null
                  ? Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        item.contentTranscription,
                        style: TextStyle(
                            color: transcriptionColor,
                            fontSize: _transcTranslFontSize,
                            fontFamily: 'Gilroy'),
                      ),
                    )
                  : SizedBox()
              : SizedBox(),
          Padding(
            padding: EdgeInsets.all(8),
            child: Html(
              onLinkTap: (String? url, RenderContext rendContext,
                  Map<String, String> attributes, element) {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) => CupertinoActionSheet(
                    message: Html(
                      data: url,
                      style: {
                        "small":
                            Style(color: Colors.grey[500], fontFamily: 'Gilroy')
                      },
                    ),
                  ),
                );
              },
              data: item.contentTranslation,
              style: {
                "#": Style(
                    color: translationColor,
                    fontSize: FontSize(_transcTranslFontSize),
                    fontFamily: 'Gilroy'),
                "a": _textStyles.footnoteTextStyle,
                "small": _textStyles.smallTextTextStyle,
              },
            ),
          ),
          Divider(
            indent: 16,
            endIndent: 16,
            color: Colors.grey[500],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Дуа ${item.id}',
                  style: _textStyles.contentChapterNumberTextStyle),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.play_circle_outline),
                  color: Colors.blueGrey[500]),
              IconButton(
                icon: Icon(CupertinoIcons.doc_on_doc),
                color: Colors.grey[500],
                onPressed: () {
                  FlutterClipboard.copy('${item.contentArabic}\n\n'
                          '${item.contentTranscription}\n\n'
                          '${item.contentForCopyAndShare}')
                      .then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Скопировано'),
                        duration: Duration(milliseconds: 500),
                      ),
                    );
                  });
                },
              ),
              IconButton(
                  icon: Icon(CupertinoIcons.share),
                  color: Colors.grey[500],
                  onPressed: () {
                    Share.share('${item.contentArabic}\n\n'
                        '${item.contentTranscription}\n\n'
                        '${item.contentForCopyAndShare}');
                  }),
              IconButton(
                icon: item.favoriteState == 0
                    ? Icon(CupertinoIcons.bookmark)
                    : Icon(CupertinoIcons.bookmark_fill),
                color: Colors.blueGrey[700],
                onPressed: () {
                  setState(() {
                    item.favoriteState == 0
                        ? _databaseQuery.addRemoveFavoriteSupplication(
                            1, item.id)
                        : _databaseQuery.addRemoveFavoriteSupplication(
                            0, item.id);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: item.favoriteState == 0
                          ? Text('Добавлено')
                          : Text('Удалено'),
                      duration: Duration(milliseconds: 500),
                    ),
                  );
                },
              ),
            ],
          ),
          Divider(
            indent: 16,
            endIndent: 16,
            color: Colors.grey[500],
          ),
        ],
      ),
    );
  }
}
