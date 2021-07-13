import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPlayer extends StatefulWidget {
  final AssetsAudioPlayer audioPlayer;
  final AsyncSnapshot snapshot;

  MyPlayer({Key? key, required this.audioPlayer, required this.snapshot})
      : super(key: key);

  @override
  _MyPlayerState createState() => _MyPlayerState();
}

class _MyPlayerState extends State<MyPlayer> {
  bool _loopTrack = false;
  bool _loopPlayList = false;

  @override
  void initState() {
    setupPlayList();
    super.initState();
  }

  setupPlayList() async {
    var myList = List<Audio>.generate(widget.snapshot.data.length,
        (i) => Audio('assets/audios/${widget.snapshot.data[i].nameAudio}.mp3'));

    widget.audioPlayer.open(
        Playlist(
          audios: myList,
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
        child: widget.audioPlayer.builderRealtimePlayingInfos(
            builder: (context, realtimePLayingInfo) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
                onPressed: () {
                  setState(() {
                    _loopPlayList = !_loopPlayList;
                  });
                  widget.audioPlayer.setLoopMode(
                      _loopPlayList ? LoopMode.playlist : LoopMode.none);
                },
                icon: Icon(Icons.compare_arrows_outlined),
                splashColor: Colors.blueGrey,
                color: _loopPlayList ? Colors.red[800] : Colors.blueGrey[800],
                iconSize: 30,
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
                  widget.audioPlayer.next(stopIfLast: true);
                },
                icon: Icon(Icons.skip_next_outlined),
                splashColor: Colors.blueGrey,
                color: Colors.blueGrey[800],
                iconSize: 30,
              ),
              IconButton(
                icon: Icon(Icons.loop),
                color: _loopTrack ? Colors.red[800] : Colors.blueGrey[800],
                iconSize: 30,
                onPressed: () {
                  setState(() {
                    _loopTrack = !_loopTrack;
                  });
                  widget.audioPlayer.setLoopMode(
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
              Text(
                '0',
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            ],
          );
        }));
  }

  String getTimeString(int seconds) {
    String minuteString =
        '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString';
  }
}
