import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/model/supplication_day_night_item.dart';
import 'package:fortress_of_the_muslim/pages/count_button.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';
import 'package:fortress_of_the_muslim/styles/text_styles.dart';
import 'package:html/parser.dart';
import 'package:screenshot/screenshot.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DayNightSupplications extends StatefulWidget {
  const DayNightSupplications({Key? key}) : super(key: key);

  @override
  _DayNightSupplicationsState createState() => _DayNightSupplicationsState();
}

class _DayNightSupplicationsState extends State<DayNightSupplications> {
  var _databaseQuery = DatabaseQuery();
  var _textStyles = TextStyles();
  var _screenshotController = ScreenshotController();

  final _itemScrollController = ItemScrollController();

  final assetsAudioPlayer = AssetsAudioPlayer();

  late SharedPreferences _sharedPreferences;

  late bool contentArabicIsShow;
  late bool contentTranscriptionIsShow;

  late Color? _arabicColor;
  late Color? _transcriptionColor;
  late Color? _translationColor;

  late double _arabicFontSize;
  late double _transcTranslFontSize;

  static const ARABIC_SHOW_STATE = "arabic_show_state";
  static const TRANSCRIPTION_SHOW_STATE = "transcription_show_state";

  static const ARABIC_COLOR = "arabic_color";
  static const TRANSCRIPTION_COLOR = "transcription_color";
  static const TRANSLATION_COLOR = "translation_color";

  static const ARABIC_FONT_SIZE = "arabic_font_size";
  static const TRANSC_TRANSL_FONT_SIZE = "transc_transl_font_size";

  bool _loopTrack = false;
  int _itemIndex = 0;

  var _time = DateTime.now();
  late bool _dayNight;

  @override
  void initState() {
    initSharedPreferences();
    _time.hour < 12 ? _dayNight = true : _dayNight = false;
    super.initState();
  }

  initSharedPreferences() {
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      setState(() {
        _sharedPreferences = sp;

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
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _databaseQuery.getDayNightSupplications(_dayNight),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Scaffold(
                backgroundColor: Colors.grey[100],
                appBar: AppBar(
                  centerTitle: true,
                  title: Text('Глава 27'),
                  backgroundColor: Colors.blueGrey,
                  actions: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _dayNight = !_dayNight;
                            _itemIndex = 0;
                            toIndex(_itemIndex);
                            _buildPlayer(snapshot);
                          });
                        },
                        icon: Icon(_dayNight
                            ? CupertinoIcons.sunrise
                            : CupertinoIcons.sunset),
                        iconSize: 30,
                        color: _dayNight ? Colors.yellow : Colors.orange),
                  ],
                ),
                body: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[200],
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        ),
                      ),
                      child: Html(
                        data:
                            'Слова поминания Аллаха, которые желательно произносить ${_dayNight ? '<b>утром</b>' : '<b>вечером</b>'}',
                        style: {
                          '#': Style(
                            fontSize: FontSize(18),
                            textAlign: TextAlign.center,
                          )
                        },
                      ),
                    ),
                    Expanded(
                      child: Scrollbar(child: _buildList(snapshot)),
                    ),
                    _buildPlayer(snapshot)
                  ],
                ),
              )
            : CircularProgressIndicator();
      },
    );
  }

  Widget _buildList(AsyncSnapshot snapshot) {
    return ScrollablePositionedList.builder(
      padding: EdgeInsets.zero,
      physics: ScrollPhysics(),
      itemScrollController: _itemScrollController,
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildContentChapterItem(
            snapshot.data![index], index, snapshot.data.length);
      },
    );
  }

  Widget _buildContentChapterItem(
      SupplicationDayNightItem item, int index, int supplicationLength) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(8),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          contentArabicIsShow
              ? item.contentArabic != null
                  ? Padding(
                      padding: EdgeInsets.only(left: 16, top: 16, right: 16),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(item.contentArabic!,
                            style: TextStyle(
                                color: _arabicColor,
                                fontSize: _arabicFontSize,
                                fontFamily: 'Hafs'),
                            textAlign: TextAlign.start,
                            textDirection: TextDirection.rtl),
                      ),
                    )
                  : SizedBox()
              : SizedBox(),
          contentTranscriptionIsShow
              ? item.contentTranscription != null
                  ? Padding(
                      padding: EdgeInsets.only(left: 16, top: 16, right: 16),
                      child: Text(
                        item.contentTranscription!,
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
                        "small": Style(
                          color: Colors.grey[500],
                          fontSize: FontSize(12),
                        ),
                        '#': Style(
                          fontSize: FontSize(18),
                        )
                      },
                    ),
                    actions: [
                      CupertinoButton(
                        child: Text('Закрыть'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
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
          item.nameAudio != null
              ? assetsAudioPlayer.builderRealtimePlayingInfos(
                  builder: (context, realtimePlayingInfo) {
                    return Divider(
                      indent: 16,
                      endIndent: 16,
                      color: realtimePlayingInfo.isPlaying &&
                              _assignPlayValue(index)
                          ? Colors.red[500]
                          : Colors.blueGrey[500],
                    );
                  },
                )
              : Divider(
                  indent: 16,
                  endIndent: 16,
                  color: Colors.blueGrey[500],
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              item.nameAudio != null
                  ? assetsAudioPlayer.builderRealtimePlayingInfos(
                      builder: (context, realtimePlayingInfo) {
                        return Text(
                          'Дуа ${item.id}',
                          style: TextStyle(
                            fontSize: 16,
                            color: realtimePlayingInfo.isPlaying &&
                                    _assignPlayValue(index)
                                ? Colors.red[500]
                                : Colors.blueGrey[500],
                          ),
                        );
                      },
                    )
                  : Text(
                      'Дуа ${item.id}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey[500],
                      ),
                    ),
              assetsAudioPlayer.builderRealtimePlayingInfos(
                builder: (context, realtimePLayingInfo) {
                  return item.nameAudio != null
                      ? IconButton(
                          onPressed: () {
                            _itemIndex = index;
                            if (assetsAudioPlayer.readingPlaylist!.currentIndex ==
                                index) {
                              if (realtimePLayingInfo.isPlaying) {
                                assetsAudioPlayer.stop();
                              } else {
                                assetsAudioPlayer.playlistPlayAtIndex(index);
                              }
                            } else {
                              assetsAudioPlayer.playlistPlayAtIndex(index);
                            }
                          },
                          icon: Icon(
                            realtimePLayingInfo.isPlaying &&
                                    _assignPlayValue(index)
                                ? Icons.stop_circle_outlined
                                : Icons.play_circle_outline,
                            color: Colors.blueGrey[500],
                          ),
                        )
                      : SizedBox();
                },
              ),
              IconButton(
                icon: Icon(CupertinoIcons.doc_on_doc),
                color: Colors.blueGrey[700],
                onPressed: () {
                  FlutterClipboard.copy(
                          '${_parseHtmlString('Слова поминания Аллаха, которые желательно произносить ${_dayNight ? '<b>утром</b>' : '<b>вечером</b>'}')}\n\n'
                          '${index + 1}/$supplicationLength\n\n'
                          '${item.contentArabic}\n\n'
                          '${item.contentTranscription}\n\n'
                          '${item.contentForCopyAndShare}')
                      .then(
                    (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.blueGrey,
                          content: Text(
                            'Скопировано',
                            style: TextStyle(fontSize: 18),
                          ),
                          duration: Duration(milliseconds: 500),
                        ),
                      );
                    },
                  );
                },
              ),
              IconButton(
                icon: Icon(CupertinoIcons.share),
                color: Colors.blueGrey[700],
                onPressed: () {
                  Share.share(
                    '${_parseHtmlString('Слова поминания Аллаха, которые желательно произносить ${_dayNight ? '<b>утром</b>' : '<b>вечером</b>'}')}\n\n'
                    '${index + 1}/$supplicationLength\n\n'
                    '${item.contentArabic}\n\n'
                    '${item.contentTranscription}\n\n'
                    '${item.contentForCopyAndShare}',
                    sharePositionOrigin: Rect.fromLTWH(0, 0, 10, 10),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.image_outlined),
                color: Colors.blueGrey[700],
                onPressed: () {},
              ),
              item.buttonState == 1
                  ? CountButton(buttonCount: item.buttonCount!)
                  : SizedBox(),
            ],
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  setupPlayList(AsyncSnapshot snapshot) async {
    var myList = List<Audio>.generate(snapshot.data.length,
        (i) => Audio('assets/audios/${snapshot.data[i].nameAudio}.mp3'));

    assetsAudioPlayer.open(
        Playlist(
          audios: myList,
        ),
        autoStart: false,
        loopMode: LoopMode.none);
  }

  Widget _buildPlayer(snapshot) {
    setupPlayList(snapshot);
    return assetsAudioPlayer.builderRealtimePlayingInfos(
      builder: (context, realtimePLayingInfo) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey[100],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          padding: EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 50,
                child: Text(
                  '${getTimeString(realtimePLayingInfo.currentPosition.inSeconds)}',
                  style: TextStyle(
                      color: Colors.blueGrey[800],
                      fontSize: 16,
                      fontFamily: 'Gilroy'),
                ),
              ),
              IconButton(
                icon: Icon(Icons.skip_previous_outlined),
                splashColor: Colors.blueGrey,
                color: Colors.blueGrey[800],
                iconSize: 30,
                onPressed: () {
                  assetsAudioPlayer.previous();
                  if (_itemIndex > 0) {
                    _itemIndex--;
                    toIndex(_itemIndex);
                  }
                },
              ),
              IconButton(
                icon: Icon(realtimePLayingInfo.isPlaying
                    ? Icons.pause_circle_outline
                    : Icons.play_circle_outline),
                color: Colors.blueGrey[800],
                iconSize: 50,
                onPressed: () {
                  assetsAudioPlayer.playOrPause();
                },
              ),
              IconButton(
                icon: Icon(Icons.skip_next_outlined),
                splashColor: Colors.blueGrey,
                color: Colors.blueGrey[800],
                iconSize: 30,
                onPressed: () {
                  if (_itemIndex < snapshot!.data.length - 1) {
                    _itemIndex++;
                    assetsAudioPlayer.playlistPlayAtIndex(_itemIndex);
                    toIndex(_itemIndex);
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.loop),
                color: _loopTrack ? Colors.red[800] : Colors.blueGrey[800],
                iconSize: 30,
                onPressed: () {
                  _loopTrack = !_loopTrack;
                  assetsAudioPlayer.setLoopMode(
                      _loopTrack ? LoopMode.single : LoopMode.none);
                },
              ),
              Container(
                width: 50,
                child: Text(
                  '${getTimeString(realtimePLayingInfo.duration.inSeconds)}',
                  style: TextStyle(
                      color: Colors.blueGrey[800],
                      fontSize: 16,
                      fontFamily: 'Gilroy'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String getTimeString(int seconds) {
    String minuteString =
        '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString';
  }

  bool _assignPlayValue(index) {
    return _itemIndex == index ? true : false;
  }

  toIndex(int index) {
    _itemScrollController.scrollTo(
        index: index,
        duration: Duration(milliseconds: 450),
        curve: Curves.easeInOutQuart);
  }

  String _parseHtmlString(String htmlString) {
    final documentText = parse(htmlString);
    final String parsedString =
        parse(documentText.body!.text).documentElement!.text;
    return parsedString;
  }
}
