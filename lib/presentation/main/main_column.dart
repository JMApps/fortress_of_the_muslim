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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: MainButtonCard(
                  title: AppStrings.chapters,
                  icon: CupertinoIcons.square_list,
                  cardColor: themeColors.mainChaptersColor,
                  routeName: '',
                  borderRadiusIndex: 0,
                ),
              ),
              Expanded(
                child: MainButtonCard(
                  title: AppStrings.chapterBookmarks,
                  icon: CupertinoIcons.bookmark,
                  cardColor: themeColors.mainBookmarksColor,
                  routeName: '',
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
                  routeName: '',
                  borderRadiusIndex: 2,
                ),
              ),
              Expanded(
                child: MainButtonCard(
                  title: AppStrings.supplicationBookmarks,
                  icon: CupertinoIcons.book,
                  cardColor: themeColors.mainFavoritesColor,
                  routeName: '',
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
                  routeName: '',
                ),
              ),
              Expanded(
                child: SelectButtonCard(
                  title: AppStrings.evening,
                  icon: CupertinoIcons.sunset,
                  routeName: '',
                ),
              ),
              Expanded(
                child: SelectButtonCard(
                  title: AppStrings.night,
                  icon: CupertinoIcons.moon,
                  routeName: '',
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
                  routeName: '',
                ),
              ),
              Expanded(
                child: SelectButtonCard(
                  title: AppStrings.istikhara,
                  icon: CupertinoIcons.lightbulb,
                  routeName: '',
                ),
              ),
              Expanded(
                child: SelectButtonCard(
                  title: AppStrings.counter,
                  icon: CupertinoIcons.greaterthan_circle,
                  routeName: '',
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
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: const Icon(CupertinoIcons.forward),
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
                    routeName: '',
                  ),
                  OptionButtonCard(
                    icon: CupertinoIcons.book,
                    avatarColor: themeColors.mainBookmarksColor,
                    routeName: '',
                  ),
                  OptionButtonCard(
                    icon: CupertinoIcons.app_badge,
                    avatarColor: themeColors.mainSupplicationsColor,
                    routeName: '',
                  ),
                  OptionButtonCard(
                    icon: CupertinoIcons.share,
                    avatarColor: themeColors.mainFavoritesColor,
                    routeName: '',
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
