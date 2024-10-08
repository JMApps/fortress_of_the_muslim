import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/routes/name_routes.dart';
import '../../core/strings/app_strings.dart';
import '../../core/styles/app_styles.dart';
import '../widgets/last_chapter_card.dart';
import '../widgets/main_item_chapter.dart';
import '../widgets/main_item_container.dart';
import '../widgets/option_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: AppStrings.share,
            icon: const Icon(Icons.ios_share),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        padding: AppStyles.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 150,
              child: Row(
                children: [
                  MainItemContainer(
                    itemBorder: AppStyles.borderTopLeft,
                    itemColor: Colors.teal,
                    pictureName: 'texture_top_left',
                    itemIcon: CupertinoIcons.collections,
                    itemTitle: AppStrings.chapters,
                    routeName: NameRoutes.allChaptersPage,
                  ),
                  SizedBox(width: 8),
                  MainItemContainer(
                    itemBorder: AppStyles.borderTopRight,
                    itemColor: Colors.orange,
                    pictureName: 'texture_top_right',
                    itemIcon: CupertinoIcons.bookmark,
                    itemTitle: AppStrings.favoriteChapters,
                    routeName: NameRoutes.favoriteChaptersPage,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 150,
              child: Row(
                children: [
                  MainItemContainer(
                    itemBorder: AppStyles.borderMini,
                    itemColor: Colors.red,
                    pictureName: 'texture_bottom_left',
                    itemIcon: CupertinoIcons.square_grid_2x2,
                    itemTitle: AppStrings.allSupplications,
                    routeName: NameRoutes.allSupplicationsPage,
                  ),
                  SizedBox(width: 8),
                  MainItemContainer(
                    itemBorder: AppStyles.borderMini,
                    itemColor: Colors.blue,
                    pictureName: 'texture_bottom_right',
                    itemIcon: CupertinoIcons.book,
                    itemTitle: AppStrings.favoriteSupplications,
                    routeName: NameRoutes.favoriteSupplicationsPage,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                MainItemChapter(
                  iconName: 'morning',
                  chapterNumber: 27,
                  itemIcon: CupertinoIcons.sunrise,
                  itemTitle: AppStrings.morning,
                ),
                SizedBox(width: 8),
                MainItemChapter(
                  iconName: 'evening',
                  chapterNumber: 28,
                  itemIcon: CupertinoIcons.sunset,
                  itemTitle: AppStrings.evening,
                ),
                SizedBox(width: 8),
                MainItemChapter(
                  iconName: 'night',
                  chapterNumber: 29,
                  itemIcon: CupertinoIcons.moon,
                  itemTitle: AppStrings.beforeSleep,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                MainItemChapter(
                  iconName: 'kaaba',
                  chapterNumber: 25,
                  itemIcon: CupertinoIcons.person_2,
                  itemTitle: AppStrings.afterPrayer,
                ),
                SizedBox(width: 8),
                MainItemChapter(
                  iconName: 'question',
                  chapterNumber: 26,
                  itemIcon: CupertinoIcons.lightbulb,
                  itemTitle: AppStrings.istikhara,
                ),
                SizedBox(width: 8),
                MainItemChapter(
                  iconName: 'numbers',
                  chapterNumber: 1000,
                  itemIcon: CupertinoIcons.arrow_right,
                  itemTitle: AppStrings.counter,
                ),
              ],
            ),
            SizedBox(height: 8),
            LastChapterCard(),
            SizedBox(height: 8),
            Row(
              children: [
                OptionItem(
                  itemIcon: CupertinoIcons.settings,
                  itemTitle: AppStrings.settings,
                  itemBorder: AppStyles.borderBottomLeft,
                  itemColor: Colors.teal,
                  routeName: NameRoutes.settingsPage,
                ),
                SizedBox(width: 8),
                OptionItem(
                  itemIcon: CupertinoIcons.book,
                  itemTitle: AppStrings.bookContent,
                  itemBorder: AppStyles.borderMini,
                  itemColor: Colors.orange,
                  routeName: NameRoutes.bookContentTitlesPage,
                ),
                SizedBox(width: 8),
                OptionItem(
                  itemIcon: CupertinoIcons.app_badge,
                  itemTitle: AppStrings.aboutUs,
                  itemBorder: AppStyles.borderBottomRight,
                  itemColor: Colors.red,
                  routeName: AppStrings.aboutUs,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
