import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/provider/day_night_chapter_state.dart';
import 'package:fortress_of_the_muslim/provider/main_player_state.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';
import 'package:fortress_of_the_muslim/widget/app_settings.dart';
import 'package:fortress_of_the_muslim/widget/content_title.dart';
import 'package:fortress_of_the_muslim/widget/day_night_chapter_content_item.dart';
import 'package:fortress_of_the_muslim/widget/main_player.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DayNightContentChapter extends StatefulWidget {
  const DayNightContentChapter({Key? key}) : super(key: key);

  @override
  _DayNightContentChapterState createState() => _DayNightContentChapterState();
}

class _DayNightContentChapterState extends State<DayNightContentChapter> {
  final _databaseQuery = DatabaseQuery();
  final _player = AssetsAudioPlayer();

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  setupPlayList(AsyncSnapshot snapshot) async {
    var myList = List<Audio>.generate(snapshot.data!.length,
        (i) => Audio('assets/audios/${snapshot.data[i].nameAudio}.mp3'));

    _player.open(
        Playlist(
          audios: myList,
        ),
        autoStart: false,
        loopMode: LoopMode.none);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainPlayerState>(
            create: (_) => MainPlayerState()),
      ],
      child: FutureBuilder<List>(
        future: _databaseQuery.getDayNightSupplications(
            context.watch<DayNightChapterState>().getDayNight),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            setupPlayList(snapshot);
          }
          return snapshot.hasError
              ? Center(
                  child: Text('${snapshot.error}'),
                )
              : snapshot.hasData
                  ? Scaffold(
                      backgroundColor: Colors.blueGrey[50],
                      appBar: AppBar(
                        centerTitle: true,
                        elevation: 0,
                        title: const Text(
                          'Глава 27',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.blueGrey,
                        actions: [
                          IconButton(
                            onPressed: () {
                              showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AppSettings();
                                },
                              );
                            },
                            icon: const Icon(
                              CupertinoIcons.settings,
                              color: Colors.white,
                            ),
                          ),
                          Consumer<DayNightChapterState>(
                            builder: (context, dayNightState, _) => IconButton(
                                onPressed: () {
                                  dayNightState.updateDayNightState();
                                  setupPlayList(snapshot);
                                  context.read<MainPlayerState>().toIndex(0);
                                  context
                                      .read<MainPlayerState>()
                                      .setCurrentIndex(-1);
                                },
                                icon: Icon(dayNightState.getDayNight
                                    ? CupertinoIcons.sunrise
                                    : CupertinoIcons.sunset),
                                iconSize: 30,
                                color: dayNightState.getDayNight
                                    ? Colors.yellow
                                    : Colors.orange),
                          ),
                        ],
                      ),
                      body: _player.builderRealtimePlayingInfos(
                        builder: (context, realtimePlayingInfo) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, top: 8, right: 8),
                                child: ContentTitle(
                                  contentTitle: 'Слова поминания Аллаха, которые желательно произносить ${context.watch<DayNightChapterState>().getDayNight ? 'утром' : 'вечером'}',
                                ),
                              ),
                              Expanded(
                                child: Scrollbar(
                                  child: ScrollablePositionedList.builder(
                                    itemScrollController: context.read<MainPlayerState>().getItemScrollController,
                                    physics: const ClampingScrollPhysics(),
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return DayNightChapterContentItem(
                                        item: snapshot.data![index],
                                        index: index,
                                        length: snapshot.data!.length,
                                        player: _player,
                                        realtimePlayingInfo: realtimePlayingInfo,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      ),
                      bottomNavigationBar:
                          MainPlayer(player: _player, snapshot: snapshot),
                    )
                  : Center(
                      child: Platform.isAndroid
                          ? const CircularProgressIndicator()
                          : const CupertinoActivityIndicator(),
                    );
        },
      ),
    );
  }
}
