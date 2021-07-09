import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:fortress_of_the_muslim/logic/current_index_cubit.dart';
import 'package:fortress_of_the_muslim/model/chapter_arguments.dart';
import 'package:fortress_of_the_muslim/model/supplication_item.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';
import 'package:fortress_of_the_muslim/styles/text_styles.dart';
import 'package:fortress_of_the_muslim/widget/player.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContentChapter extends StatefulWidget {
  const ContentChapter({Key? key}) : super(key: key);

  @override
  _ContentChapterState createState() => _ContentChapterState();
}

class _ContentChapterState extends State<ContentChapter> {
  var _databaseQuery = DatabaseQuery();
  var _textStyles = TextStyles();

  final itemScrollController = ItemScrollController();
  late AssetsAudioPlayer audioPlayer;

  late SharedPreferences _sharedPreferences;
  late ChapterArguments? args;

  static const ARABIC_SHOW_STATE = "arabic_show_state";
  static const TRANSCRIPTION_SHOW_STATE = "transcription_show_state";

  static const ARABIC_COLOR = "arabic_color";
  static const TRANSCRIPTION_COLOR = "transcription_color";
  static const TRANSLATION_COLOR = "translation_color";

  static const ARABIC_FONT_SIZE = "arabic_font_size";
  static const TRANSC_TRANSL_FONT_SIZE = "transc_transl_font_size";

  late bool contentArabicIsShow;
  late bool contentTranscriptionIsShow;

  late Color? _arabicColor;
  late Color? _transcriptionColor;
  late Color? _translationColor;

  late double _arabicFontSize;
  late double _transcTranslFontSize;

  static const COUNT_NUMBER_STATE = "count_number_state";
  late int _countNumber;
  int _currentIndex = -1;
  bool _isCountShow = false;

  @override
  void initState() {
    initSharedPreferences();
    initPlayer();
    super.initState();
  }

  initPlayer() async {
    audioPlayer = AssetsAudioPlayer();
  }

  initSharedPreferences() {
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      setState(() {
        _sharedPreferences = sp;
        _countNumber = sp.getInt(COUNT_NUMBER_STATE) ?? 0;

        contentArabicIsShow = sp.getBool(ARABIC_SHOW_STATE) ?? true;
        contentTranscriptionIsShow =
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

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as ChapterArguments?;
    return BlocProvider(
      create: (_) => CurrentIndexCubit(),
      child: BlocBuilder<CurrentIndexCubit, int>(
        builder: (BuildContext context, count) {
          return FutureBuilder<List>(
            future: _databaseQuery.getContentChapter(args!.chapterId!),
            builder: (BuildContext context, snapshot) {
              return snapshot.hasData
                  ? Scaffold(
                      backgroundColor: Colors.grey[100],
                      appBar: AppBar(
                        backgroundColor: Colors.blueGrey[500],
                        title: Text('Глава ${args!.chapterId}'),
                        centerTitle: true,
                        elevation: 0,
                        actions: [
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
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey[200],
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(25))),
                            child: Html(
                              data: args!.chapterTitle,
                              style: {
                                "#": Style(
                                    textAlign: TextAlign.center,
                                    fontSize: FontSize(18))
                              },
                            ),
                          ),
                          Expanded(
                            child: Scrollbar(
                              child: _buildList(snapshot),
                            ),
                          ),
                          MyPlayer(
                              audioPlayer: audioPlayer, snapshot: snapshot),
                        ],
                      ),
                      floatingActionButtonLocation:
                          FloatingActionButtonLocation.endFloat,
                      floatingActionButton: _isCountShow
                          ? InkWell(
                              onLongPress: () {
                                setState(() {
                                  _countNumber = 0;
                                  _sharedPreferences.setInt(
                                      COUNT_NUMBER_STATE, _countNumber);
                                });
                              },
                              child: Transform.scale(
                                scale: 1.2,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 16),
                                  child: FloatingActionButton(
                                    elevation: 0,
                                    child: CircularPercentIndicator(
                                      animationDuration: 0,
                                      radius: 55,
                                      lineWidth: 2,
                                      animation: true,
                                      percent: _countNumber / 100,
                                      center: Text('$_countNumber',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22)),
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
                                      progressColor: Colors.blueGrey[900],
                                    ),
                                    backgroundColor: Colors.blueGrey[500],
                                    onPressed: () {
                                      setState(() {
                                        if (_countNumber < 100) {
                                          _countNumber++;
                                        }
                                        _sharedPreferences.setInt(
                                            COUNT_NUMBER_STATE, _countNumber);
                                      });
                                    },
                                  ),
                                ),
                              ),
                            )
                          : SizedBox())
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          );
        },
      ),
    );
  }

  Widget _buildList(snapshot) {
    return ScrollablePositionedList.builder(
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      itemScrollController: itemScrollController,
      itemCount: snapshot.data!.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildContentChapterItem(snapshot.data![index], index);
      },
    );
  }

  Widget _buildContentChapterItem(SupplicationItem item, int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.all(8),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          contentArabicIsShow
              ? item.contentArabic != null
                  ? Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(item.contentArabic,
                          style: TextStyle(
                              color: _arabicColor,
                              fontSize: _arabicFontSize,
                              fontFamily: 'Hafs'),
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.rtl),
                    )
                  : SizedBox()
              : SizedBox(),
          contentTranscriptionIsShow
              ? item.contentTranscription != null
                  ? Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        item.contentTranscription,
                        style: TextStyle(
                            color: _transcriptionColor,
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
                    color: _translationColor,
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
                icon: Icon(CupertinoIcons.doc_on_doc),
                color: Colors.blueGrey[700],
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
                  color: Colors.blueGrey[700],
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
          SizedBox(height: 8)
        ],
      ),
    );
  }

  bool valuesIndex(currentIndex, index) {
    if (currentIndex == index) {
      return true;
    } else {
      return false;
    }
  }

  toIndex(count) {
    itemScrollController.scrollTo(
        index: count,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOutCubic);
  }
}
