import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/model/supplication_model_item.dart';
import 'package:fortress_of_the_muslim/provider/app_settings_state.dart';
import 'package:fortress_of_the_muslim/provider/favorite_supplication_state.dart';
import 'package:fortress_of_the_muslim/provider/main_player_state.dart';
import 'package:fortress_of_the_muslim/provider/take_screenshot_state.dart';
import 'package:html/parser.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ChapterContentItem extends StatelessWidget {
  ChapterContentItem({
    Key? key,
    required this.item,
    required this.index,
    required this.length,
    required this.chapterTitle,
    required this.player,
    required this.realtimePlayingInfo,
  }) : super(key: key);

  final SupplicationModelItem item;
  final int index;
  final int length;
  final String chapterTitle;
  final AssetsAudioPlayer player;
  final RealtimePlayingInfos? realtimePlayingInfo;

  final List<TextAlign> _getTextAlign = [
    TextAlign.left,
    TextAlign.center,
    TextAlign.right,
    TextAlign.justify,
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(8),
      elevation: 1,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 750),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: realtimePlayingInfo!.isPlaying && context.watch<MainPlayerState>().getCurrentIndex == index ? const Color(0xFFFFFDE7) : const Color(0xFFFFFFFF),
        ),
        child: Column(
          children: [
            context.watch<AppSettingsState>().getIsArabicTextShow
                ? item.contentArabic != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            item.contentArabic!,
                            style: TextStyle(
                              fontSize: context.watch<AppSettingsState>().getArabicTextSize.toDouble() + 3,
                              fontFamily: 'Hafs',
                              color: context.watch<AppSettingsState>().getArabicTextColor,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      )
                    : const SizedBox()
                : const SizedBox(),
            context.watch<AppSettingsState>().getIsTranscriptionTextShow
                ? item.contentTranscription != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            item.contentTranscription!,
                            style: TextStyle(
                              fontSize: context.watch<AppSettingsState>().getTranslationTextSize.toDouble(),
                              color: context.watch<AppSettingsState>().getTranscriptionTextColor,
                            ), //
                            textAlign: _getTextAlign[context.watch<AppSettingsState>().getToggleButtonIndex],
                          ),
                        ),
                      )
                    : const SizedBox()
                : const SizedBox(),
            Html(
              onLinkTap: (String? url, RenderContext rendContext,
                  Map<String, String> attributes, element) {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) => CupertinoActionSheet(
                    message: Html(
                      data: url,
                      style: {
                        '#': Style(
                          fontSize: const FontSize(18),
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                        ),
                        'small': Style(
                          color: Colors.grey,
                          fontSize: const FontSize(10),
                        ),
                      },
                    ),
                    actions: [
                      CupertinoButton(
                        child: const Text(
                          'Закрыть',
                          style: TextStyle(color: Colors.red),
                        ),
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
                '#': Style(
                    fontSize: FontSize(context.watch<AppSettingsState>().getTranslationTextSize.toDouble()),
                    color: context.watch<AppSettingsState>().getTranslationTextColor,
                    textAlign: _getTextAlign[context.watch<AppSettingsState>().getToggleButtonIndex],
                    padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                    margin: EdgeInsets.zero),
                'a': Style(
                  fontSize: const FontSize(14),
                  color: Colors.blue,
                ),
                'small': Style(
                  fontSize: const FontSize(10),
                  color: Colors.grey,
                ),
              },
            ),
            const SizedBox(height: 8),
            Divider(
              indent: 16,
              endIndent: 16,
              color: realtimePlayingInfo!.isPlaying && context.watch<MainPlayerState>().getCurrentIndex == index ? Colors.red : Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Дуа ${index + 1}/$length',
                  style: TextStyle(
                    fontSize: 15,
                    color: context.watch<MainPlayerState>().getCurrentIndex == index ? Colors.red : Colors.blueGrey,
                  ),
                ),
                item.nameAudio != null
                    ? IconButton(
                        icon: Icon(realtimePlayingInfo!.isPlaying && context.watch<MainPlayerState>().getCurrentIndex == index
                            ? CupertinoIcons.stop_circle
                            : CupertinoIcons.play_circle),
                        color: Colors.blueGrey,
                        onPressed: () {
                          context.read<MainPlayerState>().setCurrentIndex(index);
                          if (player.readingPlaylist!.currentIndex == index) {
                            if (realtimePlayingInfo!.isPlaying) {
                              player.stop();
                            } else {
                              context.read<MainPlayerState>().playOnlyTrack(player);
                            }
                          } else {
                            context.read<MainPlayerState>().playOnlyTrack(player);
                          }
                        },
                      )
                    : const SizedBox(),
                IconButton(
                  icon: const Icon(CupertinoIcons.doc_on_doc),
                  color: Colors.blueGrey,
                  onPressed: () {
                    FlutterClipboard.copy(
                      '${_parseHtmlString(chapterTitle)}\n\n'
                      'Дуа ${index + 1}/$length\n\n'
                      '${item.contentArabic != null ? '${item.contentArabic}\n\n' : ''}'
                      '${item.contentTranscription != null ? '${item.contentTranscription}\n\n' : ''}'
                      '${item.contentForCopyAndShare}',
                    );
                    _showMessage(context, false);
                  },
                ),
                IconButton(
                  icon: const Icon(CupertinoIcons.share),
                  color: Colors.blueGrey,
                  onPressed: () {
                    Share.share(
                      '${_parseHtmlString(chapterTitle)}\n\n'
                      'Дуа ${index + 1}/$length\n\n'
                      '${item.contentArabic != null ? '${item.contentArabic}\n\n' : ''}'
                      '${item.contentTranscription != null ? '${item.contentTranscription}\n\n' : ''}'
                      '${item.contentForCopyAndShare}',
                      sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(CupertinoIcons.photo_on_rectangle),
                  color: Colors.blueGrey,
                  onPressed: () {
                    context
                        .read<TakeScreenshotState>()
                        .takeScreenshot(item, index, length, chapterTitle);
                  },
                ),
                IconButton(
                  icon: Icon(
                    item.favoriteState == 0
                        ? CupertinoIcons.bookmark
                        : CupertinoIcons.bookmark_fill,
                  ),
                  color: Colors.blueGrey,
                  onPressed: () {
                    context.read<FavoriteSupplicationState>().updateBookmarkState(
                        item.favoriteState == 0 ? 1 : 0, item.id!);
                    _showMessage(context, true);
                  },
                )
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  _showMessage(BuildContext context, bool isBookmark) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(8),
        backgroundColor: isBookmark
            ? item.favoriteState == 0
                ? Colors.blue
                : Colors.blueGrey
            : Colors.blueGrey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        content: isBookmark
            ? item.favoriteState == 0
                ? const Text(
                    'Добавлено',
                    style: TextStyle(fontSize: 18),
                  )
                : const Text(
                    'Удалено',
                    style: TextStyle(fontSize: 18),
                  )
            : const Text(
                'Скопировано',
                style: TextStyle(fontSize: 18),
              ),
        duration: const Duration(milliseconds: 500),
      ),
    );
  }

  String _parseHtmlString(String htmlString) {
    final documentText = parse(htmlString);
    final String parsedString =
        parse(documentText.body!.text).documentElement!.text;
    return parsedString;
  }
}
