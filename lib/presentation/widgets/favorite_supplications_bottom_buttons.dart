import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/favorite_supplication_item_model.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/domain/state/main_state.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/share_copy_popup.dart';
import 'package:provider/provider.dart';

class FavoriteSupplicationsBottomButtons extends StatelessWidget {
  const FavoriteSupplicationsBottomButtons({Key? key, required this.item})
      : super(key: key);

  final FavoriteSupplicationItemModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Дуа ${item.id}',
          style: const TextStyle(
            color: Colors.blue,
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
            icon: const Icon(Icons.play_circle_outline),
            onPressed: () {},
          ),
        ),
        IconButton(
          splashRadius: 22,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          color: Colors.blue,
          icon: item.favoriteState == 0
              ? const Icon(Icons.bookmark_border)
              : const Icon(Icons.bookmark),
          onPressed: () {
            context.read<MainState>().showSnackBarMessage(
                context, Colors.blue, item.favoriteState == 0 ? 'Добавлено' : 'Удалено');
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
                return ShareCopyPopup(
                  contentForShareAndCopy: item.contentForCopyAndShare,
                  color: Colors.blue,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
