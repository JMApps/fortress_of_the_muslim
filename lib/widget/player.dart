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

  @override
  void initState() {
    super.initState();
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
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '00:00',
                      style: TextStyle(
                          color: Colors.blueGrey[800],
                          fontSize: 16,
                          fontFamily: 'Gilroy'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.skip_previous_outlined),
                      splashColor: Colors.blueGrey,
                      color: Colors.blueGrey[800],
                      iconSize: 30,
                    ),
                    IconButton(
                      icon: Icon(Icons.play_circle_outline),
                      color: Colors.blueGrey[800],
                      iconSize: 50,
                      onPressed: () {},
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.skip_next_outlined),
                      splashColor: Colors.blueGrey,
                      color: Colors.blueGrey[800],
                      iconSize: 30,
                    ),
                    Text(
                      '00:00',
                      style: TextStyle(
                          color: Colors.blueGrey[800],
                          fontSize: 16,
                          fontFamily: 'Gilroy'),
                    ),
                    IconButton(
                      icon: Icon(Icons.loop),
                      color: Colors.blueGrey[800],
                      iconSize: 30,
                      onPressed: () {},
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
