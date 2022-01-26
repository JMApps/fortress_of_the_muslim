import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/model/chapter_arguments.dart';
import 'package:fortress_of_the_muslim/provider/favorite_supplication_state.dart';
import 'package:fortress_of_the_muslim/provider/floating_counter_state.dart';
import 'package:fortress_of_the_muslim/provider/main_player_state.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';
import 'package:fortress_of_the_muslim/widget/app_settings.dart';
import 'package:fortress_of_the_muslim/widget/chapter_content_item.dart';
import 'package:fortress_of_the_muslim/widget/content_title.dart';
import 'package:fortress_of_the_muslim/widget/floating_counter_button.dart';
import 'package:fortress_of_the_muslim/widget/main_player.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ContentChapter extends StatefulWidget {
  const ContentChapter({Key? key}) : super(key: key);

  @override
  _ContentChapterState createState() => _ContentChapterState();
}

class _ContentChapterState extends State<ContentChapter> {
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
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ChapterArguments?;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainPlayerState>(
            create: (_) => MainPlayerState()),
      ],
      child: FutureBuilder<List>(
        future: context.watch<FavoriteSupplicationState>().getUpdateList
            ? _databaseQuery.getContentChapter(arguments!.chapterId!)
            : _databaseQuery.getContentChapter(arguments!.chapterId!),
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
                        title: Text(
                          'Глава ${arguments.chapterId}',
                          style: const TextStyle(
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
                          Switch(
                            activeColor: Colors.orange[700],
                            value: context
                                .watch<FloatingCounterState>()
                                .getIsCountButtonShow,
                            onChanged: (value) {
                              context
                                  .read<FloatingCounterState>()
                                  .updateButtonCountShow(value);
                            },
                          ),
                        ],
                      ),
                      floatingActionButton: context
                              .watch<FloatingCounterState>()
                              .getIsCountButtonShow
                          ? const FloatingCounterButton()
                          : const SizedBox(),
                      body: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 8, top: 8, right: 8),
                            child: ContentTitle(
                                contentTitle: arguments.chapterTitle!),
                          ),
                          Expanded(
                            child: Scrollbar(
                              child: ScrollablePositionedList.builder(
                                itemScrollController: context
                                    .read<MainPlayerState>()
                                    .getItemScrollController,
                                physics: const ClampingScrollPhysics(),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ChapterContentItem(
                                      item: snapshot.data![index],
                                      index: index,
                                      length: snapshot.data!.length,
                                      chapterTitle: arguments.chapterTitle!,
                                      player: _player);
                                },
                              ),
                            ),
                          ),
                        ],
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
