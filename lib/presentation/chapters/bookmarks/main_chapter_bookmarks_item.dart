import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/application/state/main_chapters_state.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/data/model/main_chapter_model.dart';
import 'package:provider/provider.dart';

class MainChapterBookmarksItem extends StatelessWidget {
  const MainChapterBookmarksItem({
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
        },
        contentPadding: AppStyles.mainPaddingMini,
        shape: AppStyles.mainShape,
        title: Text(
          item.chapterNumber,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.mainBookmarksColor,
          ),
        ),
        subtitle: Html(
          data: item.chapterTitle,
          style: {
            '#': Style(
              fontSize: FontSize(17),
              fontFamily: 'Gilroy',
              color: theme.colorScheme.mainDefaultColor,
              padding: HtmlPaddings.zero,
              margin: Margins.zero,
            ),
            'b': Style(
              fontSize: FontSize(17),
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.mainDefaultColor,
              padding: HtmlPaddings.zero,
              margin: Margins.zero,
            )
          },
        ),
        leading: IconButton(
          onPressed: () {
            chapterItemState.addRemoveChapterBookmark(
              item.favoriteState == 1 ? 0 : 1,
              item.id,
            );
          },
          splashRadius: 25,
          icon: Icon(
            item.favoriteState == 1
                ? CupertinoIcons.bookmark_fill
                : CupertinoIcons.bookmark,
            color: item.favoriteState == 1
                ? theme.colorScheme.mainBookmarksColor
                : theme.colorScheme.mainDefaultColor,
          ),
          visualDensity: const VisualDensity(horizontal: -4),
        ),
      ),
    );
  }
}