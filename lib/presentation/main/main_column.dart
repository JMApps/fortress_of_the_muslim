import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/presentation/main/main_button_card.dart';
import 'package:fortress_of_the_muslim/presentation/main/option_button_card.dart';
import 'package:fortress_of_the_muslim/presentation/main/select_button_card.dart';

class MainColumn extends StatelessWidget {
  const MainColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      padding: AppStyles.mainPadding,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: MainButtonCard(
                  title: AppStrings.chapters,
                  icon: CupertinoIcons.square_list,
                  cardColor: themeColors.mainChaptersColor,
                  routeName: '/main_chapters_page',
                  borderRadiusIndex: 0,
                ),
              ),
              Expanded(
                child: MainButtonCard(
                  title: AppStrings.chapterBookmarks,
                  icon: CupertinoIcons.bookmark,
                  cardColor: themeColors.mainBookmarksColor,
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
                  cardColor: themeColors.mainSupplicationsColor,
                  routeName: '/all_supplications_page',
                  borderRadiusIndex: 2,
                ),
              ),
              Expanded(
                child: MainButtonCard(
                  title: AppStrings.supplicationBookmarks,
                  icon: CupertinoIcons.book,
                  cardColor: themeColors.mainFavoritesColor,
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
                  chapterIndex: 0,
                ),
              ),
              Expanded(
                child: SelectButtonCard(
                  title: AppStrings.evening,
                  icon: CupertinoIcons.sunset,
                  chapterIndex: 0,
                ),
              ),
              Expanded(
                child: SelectButtonCard(
                  title: AppStrings.night,
                  icon: CupertinoIcons.moon,
                  chapterIndex: 0,
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Expanded(
                child: SelectButtonCard(
                  title: AppStrings.afterPrayer,
                  icon: CupertinoIcons.hand_raised,
                  chapterIndex: 0,
                ),
              ),
              Expanded(
                child: SelectButtonCard(
                  title: AppStrings.istikhara,
                  icon: CupertinoIcons.lightbulb,
                  chapterIndex: 0,
                ),
              ),
              Expanded(
                child: SelectButtonCard(
                  title: AppStrings.counter,
                  icon: CupertinoIcons.forward,
                  chapterIndex: 0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: Theme.of(context).colorScheme.lastChapterBorderSideColor,
              ),
              borderRadius: AppStyles.mainBorder,
            ),
            child: ListTile(
              onTap: () {},
              shape: AppStyles.mainShape,
              title: Text(
                AppStrings.lastChapter,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              trailing: Icon(
                CupertinoIcons.forward,
                color: themeColors.arrowIconColor,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: AppStyles.mainPaddingMini,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OptionButtonCard(
                    icon: CupertinoIcons.settings,
                    avatarColor: themeColors.mainChaptersColor,
                    routeName: '/app_settings',
                  ),
                  OptionButtonCard(
                    icon: CupertinoIcons.book,
                    avatarColor: themeColors.mainBookmarksColor,
                    routeName: '/other_content',
                  ),
                  OptionButtonCard(
                    icon: CupertinoIcons.app_badge,
                    avatarColor: themeColors.mainSupplicationsColor,
                    routeName: 'for_share',
                  ),
                  OptionButtonCard(
                    icon: CupertinoIcons.share,
                    avatarColor: themeColors.mainFavoritesColor,
                    routeName: 'links',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
