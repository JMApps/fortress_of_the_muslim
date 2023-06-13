import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/main_chapters_state.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/data/arguments/main_chapter_arguments.dart';
import 'package:fortress_of_the_muslim/data/model/main_chapter_model.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/for_html_text.dart';
import 'package:provider/provider.dart';

class MainChapterItem extends StatelessWidget {
  const MainChapterItem({
    super.key,
    required this.item,
    required this.itemIndex,
  });

  final MainChapterModel item;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final chapterItemState = context.read<MainChaptersState>();
    return Card(
      elevation: 0,
      color: itemIndex.isOdd
          ? theme.colorScheme.cardColor
          : theme.colorScheme.cardOddColor,
      child: ListTile(
        onTap: () {
          chapterItemState.saveLastChapter(item.id);
          Navigator.pushNamed(
            context,
            '/chapter_content_page',
            arguments: MainChapterArguments(
              chapterId: item.id,
            ),
          );
        },
        contentPadding: AppStyles.mainPaddingMini,
        shape: AppStyles.mainShape,
        title: Text(
          item.chapterNumber,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.mainChaptersColor,
          ),
        ),
        subtitle: ForHtmlText(
          textData: item.chapterTitle,
          textSize: 17,
        ),
        leading: IconButton(
          onPressed: () {
            chapterItemState.addRemoveChapterBookmark(
              item.favoriteState == 1 ? 0 : 1,
              item.id,
            );
          },
          splashRadius: 25,
          visualDensity: const VisualDensity(horizontal: -4),
          icon: item.favoriteState == 1
              ? Icon(
                  CupertinoIcons.bookmark_fill,
                  color: theme.colorScheme.mainChaptersColor,
                )
              : Icon(
                  CupertinoIcons.bookmark,
                  color: theme.colorScheme.mainDefaultColor,
                ),
        ),
      ),
    );
  }
}
