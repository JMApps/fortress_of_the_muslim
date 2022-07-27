import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/chapter_content_item_model.dart';
import 'package:fortress_of_the_muslim/domain/state/app_player_state.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/domain/state/main_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/content_chapter_share_copy_popup.dart';
import 'package:provider/provider.dart';

class ChapterContentBottomButtons extends StatelessWidget {
  const ChapterContentBottomButtons({
    Key? key,
    required this.index,
    required this.supplicationsLength,
    required this.item,
  }) : super(key: key);

  final int index;
  final int supplicationsLength;
  final ChapterContentItemModel item;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Consumer<AppPlayerState>(
      builder: (context, appPlayer, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Visibility(
              visible: item.nameAudio != null ? true : false,
              maintainAnimation: false,
              maintainSize: false,
              child: IconButton(
                splashRadius: 20,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  appPlayer.currentPlayItem == item.id && appPlayer.playingState
                      ? Icons.stop_circle_outlined
                      : Icons.play_circle_outline,
                ),
                onPressed: () {
                  context
                      .read<AppPlayerState>()
                      .playOneAudio(item.nameAudio!, item.id);
                },
              ),
            ),
            Visibility(
              visible: item.nameAudio != null ? true : false,
              maintainAnimation: false,
              maintainSize: false,
              child: IconButton(
                splashRadius: 20,
                color: appPlayer.repeatState &&
                        appPlayer.currentPlayItem == item.id
                    ? myColor.contentChapterTitleColor
                    : Colors.grey,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.repeat),
                onPressed: appPlayer.currentPlayItem == item.id
                    ? () {
                        appPlayer.changeRepeatState(
                            !appPlayer.repeatState, item.id);
                      }
                    : null,
              ),
            ),
            Visibility(
              visible: item.nameAudio != null ? true : false,
              maintainAnimation: false,
              maintainSize: false,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: appPlayer.playingState &&
                        appPlayer.currentPlayItem == item.id
                    ? () {
                        appPlayer.changePlaybackSpeedState(item.id);
                      }
                    : null,
                child: Container(
                  width: 45,
                  height: 30,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: myColor.playSpeedButtonColor,
                  ),
                  child: Center(
                    child: Text(
                      appPlayer.getSpeedName,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              splashRadius: 22,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              color: myColor.chapterContentItemColor,
              icon: item.favoriteState == 0
                  ? const Icon(Icons.bookmark_border)
                  : const Icon(Icons.bookmark),
              onPressed: () {
                context.read<MainState>().showSnackBarMessage(
                    context,
                    myColor.chapterContentItemColor,
                    item.favoriteState == 0 ? 'Добавлено' : 'Удалено');
                context
                    .read<BookmarkButtonState>()
                    .addRemoveSupplicationBookmark(
                        item.favoriteState == 0 ? 1 : 0, item.id);
              },
            ),
            IconButton(
              splashRadius: 20,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Icon(Icons.share),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return ContentChapterShareCopyPopup(
                      item: item,
                      color: myColor.chapterContentItemColor,
                    );
                  },
                );
              },
            ),
            Text(
              '$index/$supplicationsLength',
              style: TextStyle(
                color: myColor.chapterContentItemColor,
                fontSize: 16,
              ),
            ),
          ],
        );
      },
    );
  }
}
