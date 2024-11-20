import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'main_item_chapter.dart';

class FirstMainThree extends StatelessWidget {
  const FirstMainThree({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Row(
      children: [
        Flexible(
          child: MainItemChapter(
            iconName: 'morning',
            chapterNumber: 27,
            itemIcon: CupertinoIcons.sunrise,
            itemTitle: appLocale.morning,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: MainItemChapter(
            iconName: 'evening',
            chapterNumber: 28,
            itemIcon: CupertinoIcons.sunset,
            itemTitle: appLocale.evening,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: MainItemChapter(
            iconName: 'night',
            chapterNumber: 29,
            itemIcon: CupertinoIcons.moon,
            itemTitle: appLocale.beforeSleep,
          ),
        ),
      ],
    );
  }
}
