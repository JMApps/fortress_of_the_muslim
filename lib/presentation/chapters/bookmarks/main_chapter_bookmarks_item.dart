import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/main_chapters_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/data/arguments/main_chapter_arguments.dart';
import 'package:fortress_of_the_muslim/data/model/main_chapter_model.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/for_html_text.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/snack_container.dart';
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
    final themeColors = Theme.of(context).colorScheme;
    final chapterItemState = context.read<MainChaptersState>();
    return Card(
      elevation: 0,
      color: itemIndex.isOdd
          ? themeColors.cardOddColor
          : themeColors.cardColor,
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
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFB8C00),
          ),
        ),
        subtitle: ForHtmlText(
          textData: item.chapterTitle,
          textSize: 17,
          textColor: themeColors.mainDefaultColor,
          fontFamily: 'Gilroy',
          footnoteColor: const Color(0xFFFB8C00),
          textDataAlign: TextAlign.start,
        ),
        leading: IconButton(
          onPressed: () {
            chapterItemState.addRemoveChapterBookmark(
              item.favoriteState == 1 ? 0 : 1,
              item.id,
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: themeColors.mainBookmarksColor,
                duration: const Duration(milliseconds: 750),
                behavior: SnackBarBehavior.floating,
                margin: AppStyles.mainPadding,
                shape: AppStyles.mainShape,
                content: const SnackContainer(
                  message: AppStrings.deleted,
                ),
              ),
            );
          },
          tooltip: AppStrings.removeFromBookmark,
          splashRadius: 25,
          icon: const Icon(
            CupertinoIcons.bookmark_fill,
            color: Color(0xFFFB8C00),
          ),
          visualDensity: const VisualDensity(horizontal: -4),
        ),
      ),
    );
  }
}
