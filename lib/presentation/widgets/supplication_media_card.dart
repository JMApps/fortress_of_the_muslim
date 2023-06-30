import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/main_chapters_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/data/model/main_supplication_model.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/copy_share_card.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/snack_container.dart';
import 'package:provider/provider.dart';

class SupplicationMediaCard extends StatelessWidget {
  const SupplicationMediaCard({
    super.key,
    required this.item,
    required this.itemIndex,
    required this.itemsLength,
    required this.itemColor,
  });

  final MainSupplicationModel item;
  final int itemIndex;
  final int itemsLength;
  final Color itemColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final supplicationItemState = context.read<MainChaptersState>();
    return Card(
      margin: EdgeInsets.zero,
      color: itemIndex.isOdd
          ? theme.colorScheme.cardOddColor
          : theme.colorScheme.cardColor,
      child: Padding(
        padding: AppStyles.mainPaddingMini,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            item.arabicText != null
                ? IconButton(
                    onPressed: () {},
                    splashRadius: 20,
                    color: theme.colorScheme.mainDefaultColor,
                    visualDensity: const VisualDensity(
                      vertical: -4,
                      horizontal: -4,
                    ),
                    icon: const Icon(CupertinoIcons.play),
                  )
                : const SizedBox(),
            item.arabicText != null
                ? IconButton(
                    onPressed: () {},
                    splashRadius: 20,
                    color: theme.colorScheme.mainDefaultColor,
                    visualDensity: const VisualDensity(
                      vertical: -4,
                      horizontal: -4,
                    ),
                    icon: const Icon(Icons.repeat_rounded),
                  )
                : const SizedBox(),
            item.arabicText != null
                ? IconButton(
                    onPressed: () {},
                    splashRadius: 20,
                    color: theme.colorScheme.mainDefaultColor,
                    visualDensity: const VisualDensity(
                      vertical: -4,
                      horizontal: -4,
                    ),
                    icon: const Icon(Icons.speed),
                  )
                : const SizedBox(),
            IconButton(
              onPressed: () {
                supplicationItemState.addRemoveSupplicationBookmark(
                  item.favoriteState == 0 ? 1 : 0,
                  item.id,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: itemColor,
                    duration: const Duration(milliseconds: 750),
                    behavior: SnackBarBehavior.floating,
                    margin: AppStyles.symmetricHorizontalPadding,
                    shape: AppStyles.mainShape,
                    content: SnackContainer(
                      message: item.favoriteState == 0
                          ? AppStrings.added
                          : AppStrings.deleted,
                    ),
                  ),
                );
              },
              splashRadius: 20,
              visualDensity: const VisualDensity(
                vertical: -4,
                horizontal: -4,
              ),
              icon: Icon(
                item.favoriteState == 1
                    ? CupertinoIcons.bookmark_fill
                    : CupertinoIcons.bookmark,
                color: item.favoriteState == 1
                    ? itemColor
                    : theme.colorScheme.mainDefaultColor,
              ),
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => CopyShareCard(
                    contentForCopyAndShare: item.contentForShare,
                    backgroundColor: itemColor,
                  ),
                );
              },
              splashRadius: 20,
              color: theme.colorScheme.mainDefaultColor,
              visualDensity: const VisualDensity(
                vertical: -4,
                horizontal: -4,
              ),
              icon: const Icon(CupertinoIcons.share),
            ),
            Text(
              '${itemIndex + 1}/$itemsLength',
              style: TextStyle(
                fontSize: 17,
                color: itemColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
