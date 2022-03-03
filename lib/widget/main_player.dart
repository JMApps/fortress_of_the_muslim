import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/provider/main_player_state.dart';
import 'package:fortress_of_the_muslim/provider/main_state.dart';
import 'package:provider/provider.dart';

class MainPlayer extends StatefulWidget {
  const MainPlayer({Key? key, required this.player, required this.snapshot})
      : super(key: key);

  final AssetsAudioPlayer player;
  final AsyncSnapshot snapshot;

  @override
  _MainPlayerState createState() => _MainPlayerState();
}

class _MainPlayerState extends State<MainPlayer> {
  @override
  void initState() {
    widget.player.playlistAudioFinished.listen((event) {
      context.read<MainPlayerState>().setCurrentIndex(widget.player.readingPlaylist!.currentIndex);
      context.read<MainPlayerState>().toIndex(widget.player.readingPlaylist!.currentIndex);
    });
    widget.player.playlistFinished.listen((playlistFinished) {
      if (playlistFinished) {
        context.read<MainPlayerState>().toIndex(0);
        context.read<MainPlayerState>().setCurrentIndex(-1);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.player.builderRealtimePlayingInfos(
        builder: (context, realTimePlayingInfo) {
          return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: context.watch<MainState>().getNightThemeState
              ? Colors.blueGrey[900]
              : Colors.blueGrey[400],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  _getTimeString(realTimePlayingInfo.currentPosition.inSeconds),
                  style: const TextStyle(color: Colors.white),
                ),
                IconButton(
                  icon: const Icon(
                    CupertinoIcons.backward_end,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    widget.player.previous();
                    context.read<MainPlayerState>().toIndex(widget.player.readingPlaylist!.currentIndex);
                  },
                ),
                IconButton(
                  icon: Icon(realTimePlayingInfo.isPlaying ? CupertinoIcons.pause : CupertinoIcons.play),
                  iconSize: 30,
                  color: Colors.white,
                  onPressed: () {
                    context.read<MainPlayerState>().playingState(realTimePlayingInfo.isPlaying);
                    widget.player.playOrPause();
                    context.read<MainPlayerState>().toIndex(widget.player.readingPlaylist!.currentIndex);
                  },
                ),
                IconButton(
                  icon: const Icon(
                    CupertinoIcons.forward_end,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    widget.player.next(stopIfLast: true);
                    context.read<MainPlayerState>().toIndex(widget.player.readingPlaylist!.currentIndex);
                  },
                ),
                IconButton(
                  icon: Icon(
                    CupertinoIcons.arrow_2_circlepath,
                    color: context.watch<MainPlayerState>().getLoopTrackState ? Colors.blueGrey[900] : Colors.white,
                  ),
                  onPressed: () {
                    context.read<MainPlayerState>().updateLoopTrackState();
                    widget.player.setLoopMode(context.read<MainPlayerState>().getLoopTrackState
                            ? LoopMode.single
                            : LoopMode.none);
                  },
                ),
                Text(
                  _getTimeString(realTimePlayingInfo.duration.inSeconds),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      );
    });
  }

  String _getTimeString(int seconds) {
    String minuteString = '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString';
  }
}
