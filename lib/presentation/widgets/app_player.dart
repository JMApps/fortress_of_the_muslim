import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/domain/state/app_player_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:provider/provider.dart';

class AppPlayer extends StatefulWidget {
  const AppPlayer({Key? key}) : super(key: key);

  @override
  State<AppPlayer> createState() => _AppPlayerState();
}

class _AppPlayerState extends State<AppPlayer> {
  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Consumer<AppPlayerState>(builder: (context, appPlayer, _) {
      return Material(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        color: myColor.chapterContentColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ChoiceChip(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: myColor.playerChoiceChipColor,
                selectedColor: myColor.favoriteChapterRowColor,
                label: Text(
                  '0,5x',
                  style: TextStyle(color: myColor.chapterContentColor),
                ),
                selected: appPlayer.isPlaybackSpeed,
                onSelected: (value) {
                  appPlayer.changePlaybackSpeedState(value);
                },
              ),
              IconButton(
                icon: const Icon(
                  CupertinoIcons.backward_end,
                  color: Colors.white,
                ),
                splashRadius: 25,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  CupertinoIcons.play,
                  color: Colors.white,
                  size: 25,
                ),
                splashRadius: 25,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  CupertinoIcons.forward_end,
                  color: Colors.white,
                ),
                splashRadius: 25,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  CupertinoIcons.refresh_bold,
                  color: Colors.white,
                ),
                splashRadius: 25,
                onPressed: () {},
              ),
            ],
          ),
        ),
      );
    });
  }
}
