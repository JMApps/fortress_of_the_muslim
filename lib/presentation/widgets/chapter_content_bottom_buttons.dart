import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/chapter_content_item_model.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/domain/state/main_state.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/share_copy_popup.dart';
import 'package:provider/provider.dart';

class ChapterContentBottomButtons extends StatelessWidget {
  const ChapterContentBottomButtons({Key? key, required this.item})
      : super(key: key);

  final ChapterContentItemModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Дуа ${item.id}',
          style: const TextStyle(
            color: Color(0xFF455A64),
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
          color: const Color(0xFF455A64),
          icon: item.favoriteState == 0
              ? const Icon(Icons.bookmark_border)
              : const Icon(Icons.bookmark),
          onPressed: () {
            context.read<MainState>().showSnackBarMessage(
                context,
                const Color(0xFF455A64),
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
                return ShareCopyPopup(
                  contentForShareAndCopy: item.contentForCopyAndShare,
                  color: const Color(0xFF455A64),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
