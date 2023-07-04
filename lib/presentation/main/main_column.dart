import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/main_chapters_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/data/arguments/main_chapter_arguments.dart';
import 'package:fortress_of_the_muslim/presentation/main/main_button_card.dart';
import 'package:fortress_of_the_muslim/presentation/main/select_button_card.dart';
import 'package:provider/provider.dart';

class MainColumn extends StatelessWidget {
  const MainColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: SingleChildScrollView(
        padding: AppStyles.mainPadding,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: MainButtonCard(
                    title: AppStrings.chapters,
                    icon: CupertinoIcons.square_list,
                    cardColor: theme.colorScheme.mainChaptersColor,
                    routeName: '/main_chapters_page',
                    borderRadiusIndex: 0,
                  ),
                ),
                Expanded(
                  child: MainButtonCard(
                    title: AppStrings.chapterBookmarks,
                    icon: CupertinoIcons.bookmark,
                    cardColor: theme.colorScheme.mainBookmarksColor,
                    routeName: '/bookmark_chapters_page',
                    borderRadiusIndex: 1,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: MainButtonCard(
                    title: AppStrings.supplications,
                    icon: CupertinoIcons.square_grid_2x2,
                    cardColor: theme.colorScheme.mainSupplicationsColor,
                    routeName: '/main_supplications_page',
                    borderRadiusIndex: 2,
                  ),
                ),
                Expanded(
                  child: MainButtonCard(
                    title: AppStrings.supplicationBookmarks,
                    icon: CupertinoIcons.book,
                    cardColor: theme.colorScheme.mainSupplicationsBookmarkColor,
                    routeName: '/bookmark_supplications_page',
                    borderRadiusIndex: 3,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Expanded(
                  child: SelectButtonCard(
                    title: AppStrings.morning,
                    icon: CupertinoIcons.sunrise,
                    pictureName: 'morning.jpg',
                    chapterId: 27,
                  ),
                ),
                Expanded(
                  child: SelectButtonCard(
                    title: AppStrings.evening,
                    icon: CupertinoIcons.sunset,
                    pictureName: 'evening.jpg',
                    chapterId: 28,
                  ),
                ),
                Expanded(
                  child: SelectButtonCard(
                    title: AppStrings.night,
                    icon: CupertinoIcons.moon,
                    pictureName: 'night.jpg',
                    chapterId: 29,
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Expanded(
                  child: SelectButtonCard(
                    title: AppStrings.afterPrayer,
                    icon: CupertinoIcons.person_2,
                    pictureName: 'kaaba.png',
                    chapterId: 25,
                  ),
                ),
                Expanded(
                  child: SelectButtonCard(
                    title: AppStrings.istikhara,
                    icon: CupertinoIcons.lightbulb,
                    pictureName: 'question.jpg',
                    chapterId: 26,
                  ),
                ),
                Expanded(
                  child: SelectButtonCard(
                    title: AppStrings.counter,
                    icon: CupertinoIcons.forward,
                    pictureName: 'numbers.jpg',
                    chapterId: 222,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Card(
              color: theme.colorScheme.mainSupplicationsColor,
              child: Card(
                margin: const EdgeInsets.only(right: 4),
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/chapter_content_page',
                      arguments: MainChapterArguments(
                        chapterId: context.read<MainChaptersState>().getLastSavedChapterIndex,
                      ),
                    );
                  },
                  shape: AppStyles.mainShape,
                  title: Text(
                    '${AppStrings.lastChapter} ${context.watch<MainChaptersState>().getLastSavedChapterIndex} ${AppStrings.heads}',
                    style: theme.textTheme.labelMedium,
                  ),
                  trailing: Icon(
                    CupertinoIcons.forward,
                    color: theme.colorScheme.mainDefaultColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
