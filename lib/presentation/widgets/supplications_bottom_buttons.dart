import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/main_supplication_item_model.dart';
import 'package:fortress_of_the_muslim/domain/state/app_player_state.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/domain/state/main_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/main_supplication_share_copy_popup.dart';
import 'package:provider/provider.dart';

class SupplicationsBottomButtons extends StatelessWidget {
  const SupplicationsBottomButtons({
    Key? key,
    required this.item,
    required this.isSearch,
  }) : super(key: key);

  final MainSupplicationItemModel item;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Consumer<AppPlayerState>(
      builder: (context, appPlayer, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Дуа ${item.id}',
              style: TextStyle(
                color: myColor.mainSupplicationTitleColor,
                fontSize: 16,
              ),
            ),
            Visibility(
              visible: isSearch ? item.nameAudio != null ? true : false : false,
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
                  selectedColor: myColor.mainSupplicationTitleColor,
                  label: Text(
                    '0,5x',
                    style: TextStyle(color: myColor.chapterContentColor),
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
              visible: isSearch ? item.nameAudio != null ? true : false : false,
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
              visible: isSearch ? item.nameAudio != null ? true : false : false,
              maintainAnimation: false,
              maintainSize: false,
              child: IconButton(
                splashRadius: 20,
                color: appPlayer.repeatState &&
                        appPlayer.currentPlayItem == item.id
                    ? myColor.mainSupplicationTitleColor
                    : Colors.grey,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.repeat),
                onPressed: () {
                  appPlayer.changeRepeatState(!appPlayer.repeatState, item.id);
                },
              ),
            ),
            Visibility(
              visible: isSearch,
              maintainSize: false,
              maintainAnimation: false,
              child: IconButton(
                splashRadius: 22,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                color: myColor.mainSupplicationTitleColor,
                icon: item.favoriteState == 0
                    ? const Icon(Icons.bookmark_border)
                    : const Icon(Icons.bookmark),
                onPressed: () {
                  context.read<MainState>().showSnackBarMessage(
                      context,
                      myColor.mainSupplicationTitleColor,
                      item.favoriteState == 0 ? 'Добавлено' : 'Удалено');
                  context
                      .read<BookmarkButtonState>()
                      .addRemoveSupplicationBookmark(
                          item.favoriteState == 0 ? 1 : 0, item.id);
                },
              ),
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
                    return MainSupplicationShareCopyPopup(
                      item: item,
                      color: myColor.mainSupplicationTitleColor,
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
