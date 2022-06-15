import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/chapter_content_day_night_item_model.dart';
import 'package:fortress_of_the_muslim/domain/state/app_player_state.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/domain/state/main_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/content_chapter_day_night_share_copy_popup.dart';
import 'package:provider/provider.dart';

class ChapterContentDayNightBottomButtons extends StatelessWidget {
  const ChapterContentDayNightBottomButtons({Key? key, required this.item})
      : super(key: key);

  final ChapterContentDayNightItemModel item;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Consumer<AppPlayerState>(
      builder: (context, appPlayer, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Дуа № ${item.id}',
              style: TextStyle(
                color: myColor.chapterContentItemColor,
                fontSize: 16,
              ),
            ),
            Visibility(
              visible: item.nameAudio != null ? true : false,
              maintainAnimation: false,
              maintainSize: false,
              child: Transform.scale(
                scale: 0.85,
                child: ChoiceChip(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: myColor.playerChoiceChipColor,
                  selectedColor: myColor.contentChapterTitleColor,
                  label: const Text(
                    '0,5x',
                  ),
                  selected: appPlayer.isPlaybackSpeed &&
                      appPlayer.currentPlayItem == item.id,
                  onSelected: (value) {
                    appPlayer.changePlaybackSpeedState(value, item.id);
                  },
                ),
              ),
            ),
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
                  context.read<AppPlayerState>().playOneAudio(item.id);
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
                onPressed: () {
                  appPlayer.changeRepeatState(!appPlayer.repeatState, item.id);
                },
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
                    return ContentChapterDayNightShareCopyPopup(
                      item: item,
                      color: myColor.chapterContentItemColor,
                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
