import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:fortress_of_the_muslim/model/chapter_arguments.dart';
import 'package:fortress_of_the_muslim/model/supplication_item.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';
import 'package:fortress_of_the_muslim/styles/text_styles.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContentChapter extends StatefulWidget {
  @override
  _ContentChapterState createState() => _ContentChapterState();
}

class _ContentChapterState extends State<ContentChapter> {
  var _databaseQuery = DatabaseQuery();
  var _textStyles = TextStyles();
  static const ARABIC_SHOW_STATE = "arabic_show_state";
  static const TRANSCRIPTION_SHOW_STATE = "transcription_show_state";
  static const ARABIC_COLOR_NUMBER = "arabic_color_number";
  static const TRANSCRIPTION_COLOR_NUMBER = "transcription_color_number";
  static const TRANSLATION_COLOR_NUMBER = "translation_color_number";

  late SharedPreferences sharedPreferences;

  int _countNumber = 0;
  bool _isCountShow = false;
  late bool _contentArabicIsShow;
  late bool _contentTranscriptionIsShow;

  late int _arabicTextColor;
  late int _transcriptionTextColor;
  late int _translationTextColor;

  List<Color?> _itemColor = [
    Colors.white,
    Colors.black,
    Colors.grey[500],
    Colors.teal[500],
    Colors.orange[500],
    Colors.brown[500],
    Colors.red[500],
    Colors.blue[500],
  ];

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;
      setState(() {
        _contentArabicIsShow = sp.getBool(ARABIC_SHOW_STATE) ?? true;
        _contentTranscriptionIsShow =
            sp.getBool(TRANSCRIPTION_SHOW_STATE) ?? true;
        _arabicTextColor = sp.getInt(ARABIC_COLOR_NUMBER) ?? 1;
        _transcriptionTextColor = sp.getInt(TRANSCRIPTION_COLOR_NUMBER) ?? 2;
        _translationTextColor = sp.getInt(TRANSLATION_COLOR_NUMBER) ?? 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ChapterArguments? args =
        ModalRoute.of(context)!.settings.arguments as ChapterArguments?;
    return Scaffold(
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
                      return Container(
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
                                        borderRadius: const BorderRadius.all(
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
                                ListTile(
                                  leading: Icon(Icons.color_lens),
                                  title: Text('Цвет арабского текста',
                                      style: _textStyles
                                          .settingTitleItemTextStyle),
                                  trailing: Transform.scale(
                                    scale: 0.5,
                                    child: FloatingActionButton(
                                      onPressed: () {},
                                      backgroundColor:
                                          _itemColor[_arabicTextColor],
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  indent: 16,
                                  endIndent: 16,
                                ),
                                ListTile(
                                  leading: Icon(Icons.color_lens),
                                  title: Text('Цвет текста транскрипции',
                                      style: _textStyles
                                          .settingTitleItemTextStyle),
                                ),
                                Divider(
                                  height: 1,
                                  indent: 16,
                                  endIndent: 16,
                                ),
                                ListTile(
                                  leading: Icon(Icons.color_lens),
                                  title: Text('Цвет текста перевода',
                                      style: _textStyles
                                          .settingTitleItemTextStyle),
                                ),
                                Divider(
                                  height: 1,
                                  indent: 16,
                                  endIndent: 16,
                                ),
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
              color: Colors.blueGrey[200],
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
            )
          ],
        ),
        floatingActionButton: _isCountShow
            ? InkWell(
                onLongPress: () {
                  setState(() {
                    _countNumber = 0;
                  });
                },
                child: FloatingActionButton(
                  elevation: 0,
                  child: Text('$_countNumber',
                      style: _textStyles.contentChapterFloatingButtonTextStyle),
                  backgroundColor: Colors.blueGrey[700],
                  onPressed: () {
                    setState(() {
                      _countNumber++;
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
            ? ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    indent: 16,
                    endIndent: 16,
                    color: Colors.grey[500],
                  );
                },
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _contentArabicIsShow
            ? item.contentArabic != null
                ? Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(item.contentArabic,
                        style: TextStyle(
                            color: _itemColor[_arabicTextColor], fontSize: 20),
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
                          color: _itemColor[_transcriptionTextColor],
                          fontSize: 20),
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
                    style: {"small": Style(color: Colors.grey[500])},
                  ),
                ),
              );
            },
            data: item.contentTranslation,
            style: {
              "#": Style(
                  color: _itemColor[_translationTextColor],
                  fontSize: FontSize(20)),
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
            // IconButton(
            //     icon: Icon(CupertinoIcons.play),
            //     color: Colors.blueGrey[700],
            //     onPressed: () {}),
            // Container(
            //   width: 50,
            //   child: Text('00:00'),
            // ),
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
                }),
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
                      ? _databaseQuery.addRemoveFavoriteSupplication(1, item.id)
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
        )
      ],
    );
  }
}
