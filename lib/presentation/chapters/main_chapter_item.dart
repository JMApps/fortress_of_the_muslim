import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/application/state/main_chapters_state.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/data/model/main_chapter_model.dart';
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
    final appTheme = Theme.of(context);
    final chapterItemState = context.read<MainChaptersState>();
    return Card(
      elevation: 0,
      color: itemIndex.isOdd ? Colors.white : Colors.blueGrey.shade50,
      child: ListTile(
        contentPadding: AppStyles.mainPaddingMini,
        dense: true,
        onTap: () {},
        shape: AppStyles.mainShape,
        title: Text(
          item.chapterNumber,
          style: appTheme.textTheme.titleMedium,
        ),
        subtitle: Html(
          data: item.chapterTitle,
          style: {
            '#': Style(
              fontSize: FontSize(17),
              fontFamily: 'Gilroy',
              color: appTheme.colorScheme.mainDefaultColor,
              padding: HtmlPaddings.zero,
              margin: Margins.zero,
            ),
            'b': Style(
              fontSize: FontSize(17),
              fontWeight: FontWeight.bold,
              color: appTheme.colorScheme.mainDefaultColor,
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
          icon: item.favoriteState == 1
              ? Icon(
                  CupertinoIcons.bookmark_fill,
                  color: appTheme.colorScheme.mainChaptersColor,
                )
              : Icon(CupertinoIcons.bookmark, color: appTheme.colorScheme.arrowIconColor,),
          visualDensity: const VisualDensity(horizontal: -4),
        ),
      ),
    );
  }
}
