import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final appLocale = AppLocalizations.of(context)!;
    final themeIsDark = Theme.of(context).brightness == Brightness.dark;
    final fixColor = Theme.of(context).colorScheme.onSecondaryContainer.withAlpha(themeIsDark ? 215 : 235);
    return InkWell(
      onTap: () async {
        HapticFeedback.lightImpact();
        if (chapterNumber == 1000) {
          Navigator.pushNamed(context, NameRoutes.appCounterPage);
        } else {
          await Navigator.pushNamed(
            context,
            NameRoutes.chapterContentPage,
            arguments: ChapterIdArgs(
              chapterId: chapterNumber,
              chaptersTableName: appLocale.chapterTableName,
              supplicationsTableName: appLocale.supplicationsTableName,
            ),
          );
        }
      },
      borderRadius: AppStyles.borderMini,
      splashColor: Colors.grey.withAlpha(themeIsDark ? 155 : 225),
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
                Padding(
                  padding: AppStyles.paddingHorizontalMini,
                  child: Text(
                    itemTitle,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: fixColor,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
