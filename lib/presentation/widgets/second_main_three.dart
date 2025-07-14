import 'package:flutter/cupertino.dart';
import '../../l10n/app_localizations.dart';
import 'main_item_chapter.dart';

class SecondMainThree extends StatelessWidget {
  const SecondMainThree({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Row(
      children: [
        Flexible(
          child: MainItemChapter(
            iconName: 'kaaba',
            chapterNumber: 25,
            itemIcon: CupertinoIcons.person_2,
            itemTitle: appLocale.afterPrayer,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: MainItemChapter(
            iconName: 'question',
            chapterNumber: 26,
            itemIcon: CupertinoIcons.lightbulb,
            itemTitle: appLocale.istikhara,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: MainItemChapter(
            iconName: 'numbers',
            chapterNumber: 1000,
            itemIcon: CupertinoIcons.forward,
            itemTitle: appLocale.counter,
          ),
        ),
      ],
    );
  }
}
