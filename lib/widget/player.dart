import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortress_of_the_muslim/logic/current_index_cubit.dart';
import 'package:fortress_of_the_muslim/model/supplication_item.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';

class MyPlayer extends StatefulWidget {
  MyPlayer({Key? key, this.chapterId, this.itemId}) : super(key: key);

  final int? chapterId;
  final int? itemId;

  @override
  _MyPlayerState createState() => _MyPlayerState();
}

class _MyPlayerState extends State<MyPlayer> {
  var _databaseQuery = DatabaseQuery();
  final assetsAudioPlayer = AssetsAudioPlayer();

  int currentIndex = 0;
  var totalDuration;
  bool _play = false;

  final List<StreamSubscription> _subscriptions = [];

  @override
  void initState() {
    _subscriptions.add(assetsAudioPlayer.onReadyToPlay.listen((audio) {
      totalDuration = audio!.duration;
    }));
    super.initState();
  }

  playOnly(SupplicationItem item) {
    assetsAudioPlayer.open(
      Audio('assets/audios/${item.nameAudio}.mp3'),
    );
  }

  @override
  dispose() {
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CurrentIndexCubit(),
      child: BlocBuilder<CurrentIndexCubit, int>(builder: (context, count) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25))),
          padding: EdgeInsets.all(8),
          child: FutureBuilder<List>(
            future: _databaseQuery.getContentChapter(widget.chapterId!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PlayerBuilder.currentPosition(
                      player: assetsAudioPlayer,
                      builder: (context, currentPosition) {
                        return Text(
                          '${currentPosition.toString().split('.').first}',
                          style: TextStyle(
                              color: Colors.blueGrey[800],
                              fontSize: 16,
                              fontFamily: 'Gilroy'),
                        );
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        if (currentIndex > 0) {
                          currentIndex--;
                          assetsAudioPlayer.previous();
                        }
                      },
                      icon: Icon(Icons.skip_previous_outlined),
                      splashColor: Colors.blueGrey,
                      color: Colors.blueGrey[800],
                      iconSize: 30,
                    ),
                    AudioWidget.assets(
                      path:
                          'assets/audios/${audioPath(snapshot.data![currentIndex])}.mp3',
                      play: _play,
                      child: IconButton(
                        icon: Icon(_play
                            ? Icons.pause_circle_outline
                            : Icons.play_circle_outline),
                        color: Colors.blueGrey[800],
                        iconSize: 50,
                        onPressed: () {
                          setState(() {
                            _play = !_play;
                          });
                        },
                      ),
                      onReadyToPlay: (duration) {
                        totalDuration = duration;
                      },
                      onPositionChanged: (current, duration) {
                        //onPositionChanged
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        if (currentIndex < snapshot.data!.length - 1) {
                          currentIndex++;
                          assetsAudioPlayer.next();
                          context.read<CurrentIndexCubit>().increment();
                          print('Player = $count');
                        }
                      },
                      icon: Icon(Icons.skip_next_outlined),
                      splashColor: Colors.blueGrey,
                      color: Colors.blueGrey[800],
                      iconSize: 30,
                    ),
                    PlayerBuilder.currentPosition(
                      player: assetsAudioPlayer,
                      builder: (context, currentPosition) {
                        return Text(
                          totalDuration != null
                              ? '${totalDuration.toString().split('.').first}'
                              : '00:00:00',
                          style: TextStyle(
                              color: Colors.blueGrey[800],
                              fontSize: 16,
                              fontFamily: 'Gilroy'),
                        );
                      },
                    ),
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        );
      }),
    );
  }

  String audioPath(SupplicationItem item) {
    return item.nameAudio;
  }
}
