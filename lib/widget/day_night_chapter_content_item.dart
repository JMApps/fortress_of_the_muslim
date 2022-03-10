import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/model/supplication_day_night_item.dart';
import 'package:fortress_of_the_muslim/provider/app_settings_state.dart';
import 'package:fortress_of_the_muslim/provider/day_night_chapter_state.dart';
import 'package:fortress_of_the_muslim/provider/main_player_state.dart';
import 'package:fortress_of_the_muslim/provider/main_state.dart';
import 'package:fortress_of_the_muslim/provider/take_screenshot_state.dart';
import 'package:fortress_of_the_muslim/widget/day_night_button_count.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class DayNightChapterContentItem extends StatelessWidget {
  DayNightChapterContentItem({
    Key? key,
    required this.item,
    required this.index,
    required this.length,
    required this.player,
    required this.realtimePlayingInfo,
  }) : super(key: key);

  final SupplicationDayNightItem item;
  final int index;
  final int length;
  final AssetsAudioPlayer player;
  final RealtimePlayingInfos realtimePlayingInfo;

  final List<TextAlign> _getTextAlign = [
    TextAlign.left,
    TextAlign.center,
    TextAlign.right,
    TextAlign.justify,
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.watch<MainState>().getNightThemeState
          ? Colors.blueGrey[900]
          : Colors.white,
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
          color: !context.watch<MainPlayerState>().getPlayingState &&
                  context.watch<MainPlayerState>().getCurrentIndex == index
              ? context.watch<MainState>().getNightThemeState
                  ? const Color(0xFF131D21)
                  : const Color(0xFFFFFDE7)
              : context.watch<MainState>().getNightThemeState
                  ? Colors.blueGrey[900]
                  : Colors.white,
        ),
        child: Column(
          children: [
            context.watch<AppSettingsState>().getIsArabicTextShow
                ? item.contentArabic != null
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 16, top: 16, right: 16),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            item.contentArabic!,
                            style: TextStyle(
                              fontSize: context
                                      .watch<AppSettingsState>()
                                      .getArabicTextSize
                                      .toDouble() +
                                  3,
                              fontFamily: 'Hafs',
                              color: context
                                      .read<AppSettingsState>()
                                      .getNightThemeColorState
                                  ? context
                                      .watch<AppSettingsState>()
                                      .getArabicTextColor
                                  : context
                                          .watch<MainState>()
                                          .getNightThemeState
                                      ? Colors.blueGrey[100]
                                      : Colors.blueGrey[900],
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
                        padding:
                            const EdgeInsets.only(left: 16, top: 8, right: 16),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            item.contentTranscription!,
                            style: TextStyle(
                              fontSize: context
                                  .watch<AppSettingsState>()
                                  .getTranslationTextSize
                                  .toDouble(),
                              color: context
                                      .read<AppSettingsState>()
                                      .getNightThemeColorState
                                  ? context
                                      .watch<AppSettingsState>()
                                      .getTranscriptionTextColor
                                  : context
                                          .watch<MainState>()
                                          .getNightThemeState
                                      ? Colors.green[200]
                                      : Colors.green[400],
                            ), //
                            textAlign: _getTextAlign[context
                                .watch<AppSettingsState>()
                                .getToggleButtonIndex],
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
                          fontSize: const FontSize(20),
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
                    fontSize: FontSize(context
                        .watch<AppSettingsState>()
                        .getTranslationTextSize
                        .toDouble()),
                    color: context.read<AppSettingsState>().getNightThemeColorState
                        ? context
                            .watch<AppSettingsState>()
                            .getTranslationTextColor
                        : context.watch<MainState>().getNightThemeState
                            ? Colors.white
                            : Colors.black,
                    textAlign: _getTextAlign[
                        context.watch<AppSettingsState>().getToggleButtonIndex],
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
              color: realtimePlayingInfo.isPlaying &&
                      context.watch<MainPlayerState>().getCurrentIndex == index
                  ? Colors.red
                  : Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Дуа ${index + 1}/$length',
                  style: TextStyle(
                    fontSize: 15,
                    color: context.watch<MainPlayerState>().getCurrentIndex ==
                            index
                        ? Colors.red
                        : context.watch<MainState>().getNightThemeState
                            ? Colors.blueGrey[100]
                            : Colors.blueGrey[400],
                  ),
                ),
                item.nameAudio != null
                    ? IconButton(
                        icon: Icon(realtimePlayingInfo.isPlaying &&
                                context
                                        .watch<MainPlayerState>()
                                        .getCurrentIndex ==
                                    index
                            ? CupertinoIcons.stop_circle
                            : CupertinoIcons.play_circle),
                        color: context.watch<MainState>().getNightThemeState
                            ? Colors.blueGrey[100]
                            : Colors.blueGrey[400],
                        onPressed: () {
                          context
                              .read<MainPlayerState>()
                              .setCurrentIndex(index);
                          if (player.readingPlaylist!.currentIndex == index) {
                            if (realtimePlayingInfo.isPlaying) {
                              player.stop();
                            } else {
                              context
                                  .read<MainPlayerState>()
                                  .playOnlyTrack(player);
                            }
                          } else {
                            context
                                .read<MainPlayerState>()
                                .playOnlyTrack(player);
                          }
                        },
                      )
                    : const SizedBox(),
                IconButton(
                  icon: Icon(
                    CupertinoIcons.doc_on_doc,
                    color: context.watch<MainState>().getNightThemeState
                        ? Colors.blueGrey[100]
                        : Colors.blueGrey[400],
                  ),
                  onPressed: () {
                    FlutterClipboard.copy(
                      'Слова поминания Аллаха, которые желательно произносить ${context.read<DayNightChapterState>().getDayNight ? 'утром' : 'вечером'}\n\n'
                      'Дуа ${index + 1}/$length\n\n'
                      '${item.contentArabic != null ? '${item.contentArabic}\n\n' : ''}'
                      '${item.contentTranscription != null ? '${item.contentTranscription}\n\n' : ''}'
                      '${item.contentForCopyAndShare}',
                    );
                    _showMessage(context, false);
                  },
                ),
                IconButton(
                  icon: Icon(
                    CupertinoIcons.share,
                    color: context.watch<MainState>().getNightThemeState
                        ? Colors.blueGrey[100]
                        : Colors.blueGrey[400],
                  ),
                  onPressed: () {
                    Share.share(
                      'Слова поминания Аллаха, которые желательно произносить ${context.read<DayNightChapterState>().getDayNight ? 'утром' : 'вечером'}\n\n'
                      'Дуа ${index + 1}/$length\n\n'
                      '${item.contentArabic != null ? '${item.contentArabic}\n\n' : ''}'
                      '${item.contentTranscription != null ? '${item.contentTranscription}\n\n' : ''}'
                      '${item.contentForCopyAndShare}',
                      sharePositionOrigin: const Rect.fromLTWH(0, 0, 10, 10),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(
                    CupertinoIcons.photo,
                    color: context.watch<MainState>().getNightThemeState
                        ? Colors.blueGrey[100]
                        : Colors.blueGrey[400],
                  ),
                  onPressed: () {
                    context
                        .read<TakeScreenshotState>()
                        .takeDayNightScreenshot(item, index, length);
                  },
                ),
                item.buttonState == 1
                    ? DayNightButtonCount(buttonCount: item.buttonCount!)
                    : const SizedBox(),
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
      const SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(8),
        backgroundColor: Colors.blueGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        content: Text(
          'Скопировано',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        duration: Duration(milliseconds: 500),
      ),
    );
  }
}
