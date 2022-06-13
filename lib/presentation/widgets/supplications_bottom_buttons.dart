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
  const SupplicationsBottomButtons({Key? key, required this.item}) : super(key: key);

  final MainSupplicationItemModel item;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
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
          visible: item.nameAudio != null ? true : false,
          maintainAnimation: false,
          maintainSize: false,
          child: IconButton(
            splashRadius: 20,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: Icon(
              context.watch<AppPlayerState>().currentPlayItem == item.id &&
                      context.watch<AppPlayerState>().playingState
                  ? Icons.stop_circle_outlined
                  : Icons.play_circle_outline,
            ),
            onPressed: () {
              context.read<AppPlayerState>().playOneAudio(item.id);
            },
          ),
        ),
        IconButton(
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
            context.read<BookmarkButtonState>().addRemoveSupplicationBookmark(
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
  }
}
