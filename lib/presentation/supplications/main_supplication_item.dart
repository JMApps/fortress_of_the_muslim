import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/main_chapters_state.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/data/model/main_supplication_model.dart';
import 'package:provider/provider.dart';

class MainSupplicationItem extends StatelessWidget {
  const MainSupplicationItem({
    super.key,
    required this.item,
    required this.itemIndex,
  });

  final MainSupplicationModel item;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final supplicationItemState = context.read<MainChaptersState>();
    return Card(
      elevation: 0,
      color: itemIndex.isOdd
          ? theme.colorScheme.cardColor
          : theme.colorScheme.cardOddColor,
      child: Padding(
        padding: AppStyles.mainPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            item.arabicText != null
                ? Text(
                    item.arabicText!,
                    style: theme.textTheme.labelMedium,
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.rtl,
                  )
                : const SizedBox(),
            item.arabicText != null
                ? const SizedBox(height: 16)
                : const SizedBox(),
            item.transcriptionText != null
                ? Text(
                    item.transcriptionText!,
                    style: theme.textTheme.labelMedium,
                    textAlign: TextAlign.start,
                  )
                : const SizedBox(),
            item.transcriptionText != null
                ? const SizedBox(height: 16)
                : const SizedBox(),
            Text(
              item.translationText,
              style: theme.textTheme.labelMedium,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 16),
            Card(
              margin: EdgeInsets.zero,
              color: itemIndex.isOdd
                  ? theme.colorScheme.cardOddColor
                  : theme.colorScheme.cardColor,
              child: Padding(
                padding: AppStyles.mainPaddingMini,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Дуа ${item.id}',
                      style: TextStyle(
                        fontSize: 17,
                        color: theme.colorScheme.mainDefaultColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      splashRadius: 20,
                      color: theme.colorScheme.mainDefaultColor,
                      visualDensity: const VisualDensity(
                        vertical: -4,
                        horizontal: -4,
                      ),
                      icon: const Icon(Icons.play_circle),
                    ),
                    IconButton(
                      onPressed: () {},
                      splashRadius: 20,
                      color: theme.colorScheme.mainDefaultColor,
                      visualDensity: const VisualDensity(
                        vertical: -4,
                        horizontal: -4,
                      ),
                      icon: const Icon(Icons.replay),
                    ),
                    IconButton(
                      onPressed: () {},
                      splashRadius: 20,
                      color: theme.colorScheme.mainDefaultColor,
                      visualDensity: const VisualDensity(
                        vertical: -4,
                        horizontal: -4,
                      ),
                      icon: const Icon(Icons.speed),
                    ),
                    IconButton(
                      onPressed: () {
                        supplicationItemState.addRemoveSupplicationBookmark(
                          item.favoriteState == 0 ? 1 : 0,
                          item.id,
                        );
                      },
                      splashRadius: 20,
                      color: theme.colorScheme.mainSupplicationsColor,
                      visualDensity: const VisualDensity(
                        vertical: -4,
                        horizontal: -4,
                      ),
                      icon: Icon(
                        item.favoriteState == 1
                            ? CupertinoIcons.bookmark_fill
                            : CupertinoIcons.bookmark,
                        color: item.favoriteState == 1
                            ? theme.colorScheme.mainSupplicationsColor
                            : theme.colorScheme.mainDefaultColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      splashRadius: 20,
                      color: theme.colorScheme.mainDefaultColor,
                      visualDensity: const VisualDensity(
                        vertical: -4,
                        horizontal: -4,
                      ),
                      icon: const Icon(Icons.share),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
