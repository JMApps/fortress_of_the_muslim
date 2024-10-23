import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/routes/name_routes.dart';
import '../../core/styles/app_styles.dart';
import '../../data/models/arguments/chapter_id_args.dart';

class MainItemChapter extends StatelessWidget {
  const MainItemChapter({
    super.key,
    required this.iconName,
    required this.chapterNumber,
    required this.itemIcon,
    required this.itemTitle,
  });

  final String iconName;
  final int chapterNumber;
  final IconData itemIcon;
  final String itemTitle;

  @override
  Widget build(BuildContext context) {
    final themeIsDark = Theme.of(context).brightness == Brightness.dark;
    final fixColor = Theme.of(context).colorScheme.onSecondaryContainer.withOpacity(themeIsDark ? 0.85 : 0.95);
    return InkWell(
      onTap: () {
        HapticFeedback.lightImpact();
        if (chapterNumber == 1000) {
          Navigator.pushNamed(context, NameRoutes.appCounterPage);
        } else {
          Navigator.pushNamed(
            context,
            NameRoutes.chapterContentPage,
            arguments: ChapterIdArgs(chapterId: chapterNumber),
          );
        }
      },
      borderRadius: AppStyles.borderMini,
      splashColor: Colors.grey.withOpacity(themeIsDark ? 0.5 : 0.95),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Opacity(
              opacity: themeIsDark ? 0.25 : 0.65,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: AppStyles.borderMini,
                  image: DecorationImage(
                    image: AssetImage('assets/pictures/$iconName.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  itemIcon,
                color: fixColor,
                ),
                Text(
                  itemTitle,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: fixColor,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
