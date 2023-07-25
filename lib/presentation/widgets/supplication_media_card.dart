import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/app_player_state.dart';
import 'package:fortress_of_the_muslim/application/state/main_chapters_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/data/model/main_supplication_model.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/copy_share_card.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/snack_container.dart';
import 'package:provider/provider.dart';

class SupplicationMediaCard extends StatelessWidget {
  const SupplicationMediaCard({
    super.key,
    required this.item,
    required this.itemIndex,
    required this.itemsLength,
    required this.itemColor,
  });

  final MainSupplicationModel item;
  final int itemIndex;
  final int itemsLength;
  final Color itemColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final supplicationItemState = context.read<MainChaptersState>();
    return Consumer<AppPlayerState>(
      builder: (context, playerState, _) {
        return Card(
          margin: EdgeInsets.zero,
          color: itemIndex.isOdd
              ? theme.colorScheme.cardColor
              : theme.colorScheme.cardOddColor,
          child: Padding(
            padding: AppStyles.mainPaddingMini,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                item.arabicText != null
                    ? IconButton(
                        onPressed: () {
                          playerState.playTrack(
                            nameAudio: item.nameAudio!,
                            trackId: item.id,
                          );
                        },
                        splashRadius: 20,
                        color: theme.colorScheme.mainDefaultColor,
                        visualDensity: const VisualDensity(
                          vertical: -4,
                          horizontal: -4,
                        ),
                        icon: playerState.getCurrentTrackItem == item.id && playerState.getPlayingState
                            ? const Icon(CupertinoIcons.stop_circle)
                            : const Icon(CupertinoIcons.play),
                      )
                    : const SizedBox(),
                item.arabicText != null
                    ? IconButton(
                        onPressed: () {
                          playerState.changeRepeatState(
                            trackId: item.id,
                          );
                        },
                        splashRadius: 20,
                        color: playerState.getCurrentTrackItem == item.id &&
                                playerState.getRepeatState
                            ? itemColor
                            : theme.colorScheme.mainDefaultColor,
                        visualDensity: const VisualDensity(
                          vertical: -4,
                          horizontal: -4,
                        ),
                        icon: const Icon(CupertinoIcons.arrow_2_squarepath)
                      )
                    : const SizedBox(),
                item.arabicText != null
                    ? IconButton(
                        onPressed: () {
                          playerState.changePlaybackSpeedState(
                            trackId: item.id,
                          );
                        },
                        color: playerState.getCurrentTrackItem == item.id &&
                                playerState.getSlowSpeedState
                            ? itemColor
                            : theme.colorScheme.mainDefaultColor,
                        splashRadius: 20,
                        visualDensity: const VisualDensity(
                          vertical: -4,
                          horizontal: -4,
                        ),
                        icon: const Icon(CupertinoIcons.timer),
                      )
                    : const SizedBox(),
                IconButton(
                  onPressed: () {
                    supplicationItemState.addRemoveSupplicationBookmark(
                      item.favoriteState == 0 ? 1 : 0,
                      item.id,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: itemColor,
                        duration: const Duration(milliseconds: 750),
                        behavior: SnackBarBehavior.floating,
                        margin: AppStyles.mainMargin,
                        shape: AppStyles.mainShape,
                        content: SnackContainer(
                          message: item.favoriteState == 0
                              ? AppStrings.added
                              : AppStrings.deleted,
                        ),
                      ),
                    );
                  },
                  splashRadius: 20,
                  visualDensity: const VisualDensity(
                    vertical: -4,
                    horizontal: -4,
                  ),
                  icon: Icon(
                    item.favoriteState == 1
                        ? CupertinoIcons.bookmark_fill
                        : CupertinoIcons.bookmark,
                    color: item.favoriteState == 1
                        ? itemColor
                        : theme.colorScheme.mainDefaultColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => CopyShareCard(
                        item: item,
                        backgroundColor: itemColor,
                      ),
                    );
                  },
                  splashRadius: 20,
                  color: theme.colorScheme.mainDefaultColor,
                  visualDensity: const VisualDensity(
                    vertical: -4,
                    horizontal: -4,
                  ),
                  icon: const Icon(CupertinoIcons.share),
                ),
                Text(
                  '${itemIndex + 1}/$itemsLength',
                  style: TextStyle(
                    fontSize: 17,
                    color: itemColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
