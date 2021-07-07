import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';

class MyPlayer extends StatefulWidget {
  final int? chapterId;
  final AssetsAudioPlayer audioPlayer;

  MyPlayer({Key? key, required this.chapterId, required this.audioPlayer})
      : super(key: key);

  @override
  _MyPlayerState createState() => _MyPlayerState();
}

class _MyPlayerState extends State<MyPlayer> {
  var _databaseQuery = DatabaseQuery();
  bool _repeat = false;

  late List audios;

  @override
  void initState() {
    setupPlayList();
    super.initState();
  }

  setupPlayList() async {
    widget.audioPlayer.open(
        Playlist(
          audios: [
            Audio('assets/audios/dua_1.mp3'),
            Audio('assets/audios/dua_2.mp3'),
            Audio('assets/audios/dua_3.mp3'),
            Audio('assets/audios/dua_4.mp3'),
          ],
        ),
        autoStart: false,
        loopMode: LoopMode.none);
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25))),
      padding: EdgeInsets.all(8),
      child: FutureBuilder<List>(
        future: _databaseQuery.getContentChapter(widget.chapterId!),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? widget.audioPlayer.builderRealtimePlayingInfos(
                  builder: (context, realtimePLayingInfo) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '${getTimeString(realtimePLayingInfo.currentPosition.inSeconds)}',
                        style: TextStyle(
                            color: Colors.blueGrey[800],
                            fontSize: 16,
                            fontFamily: 'Gilroy'),
                      ),
                      IconButton(
                        onPressed: () {
                          widget.audioPlayer.previous();
                        },
                        icon: Icon(Icons.skip_previous_outlined),
                        splashColor: Colors.blueGrey,
                        color: Colors.blueGrey[800],
                        iconSize: 30,
                      ),
                      IconButton(
                        icon: Icon(realtimePLayingInfo.isPlaying
                            ? Icons.pause_circle_outline
                            : Icons.play_circle_outline),
                        color: Colors.blueGrey[800],
                        iconSize: 50,
                        onPressed: () {
                          widget.audioPlayer.playOrPause();
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          widget.audioPlayer.next();
                        },
                        icon: Icon(Icons.skip_next_outlined),
                        splashColor: Colors.blueGrey,
                        color: Colors.blueGrey[800],
                        iconSize: 30,
                      ),
                      Text(
                        '${getTimeString(realtimePLayingInfo.duration.inSeconds)}',
                        style: TextStyle(
                            color: Colors.blueGrey[800],
                            fontSize: 16,
                            fontFamily: 'Gilroy'),
                      ),
                      IconButton(
                        icon: Icon(Icons.loop),
                        color: _repeat ? Colors.red[800] : Colors.blueGrey[800],
                        iconSize: 30,
                        onPressed: () {
                          setState(() {
                            _repeat = !_repeat;
                          });
                        },
                      ),
                    ],
                  );
                })
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  String getTimeString(int seconds) {
    String minuteString =
        '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString'; // Returns a string with the format mm:ss
  }
}
