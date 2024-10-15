import 'package:flutter/cupertino.dart';

import '../../core/strings/app_strings.dart';
import 'main_item_chapter.dart';

class SecondMainThree extends StatelessWidget {
  const SecondMainThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: MainItemChapter(
            iconName: 'kaaba',
            chapterNumber: 25,
            itemIcon: CupertinoIcons.person_2,
            itemTitle: AppStrings.afterPrayer,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: MainItemChapter(
            iconName: 'question',
            chapterNumber: 26,
            itemIcon: CupertinoIcons.lightbulb,
            itemTitle: AppStrings.istikhara,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: MainItemChapter(
            iconName: 'numbers',
            chapterNumber: 1000,
            itemIcon: CupertinoIcons.arrow_right,
            itemTitle: AppStrings.counter,
          ),
        ),
      ],
    );
  }
}
