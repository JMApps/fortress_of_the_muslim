import 'package:flutter/cupertino.dart';

import '../../core/strings/app_strings.dart';
import 'main_item_chapter.dart';

class FirstMainThree extends StatelessWidget {
  const FirstMainThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: MainItemChapter(
            iconName: 'morning',
            chapterNumber: 27,
            itemIcon: CupertinoIcons.sunrise,
            itemTitle: AppStrings.morning,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: MainItemChapter(
            iconName: 'evening',
            chapterNumber: 28,
            itemIcon: CupertinoIcons.sunset,
            itemTitle: AppStrings.evening,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: MainItemChapter(
            iconName: 'night',
            chapterNumber: 29,
            itemIcon: CupertinoIcons.moon,
            itemTitle: AppStrings.beforeSleep,
          ),
        ),
      ],
    );
  }
}
