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

class SearchMediaCard extends StatelessWidget {
  const SearchMediaCard({
    super.key,
    required this.item,
    required this.itemColor,
  });

  final MainSupplicationModel item;
  final Color itemColor;

  @override
  Widget build(BuildContext context) {
    final supplicationItemState = Provider.of<MainChaptersState>(context);
    final bool isBookmark = supplicationItemState.supplicationIsFavorite(item.id);
    final theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.zero,
      color: item.id.isOdd
          ? theme.colorScheme.cardColor
          : theme.colorScheme.cardOddColor,
      child: Padding(
        padding: AppStyles.mainPaddingMini,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => CopyShareCard(
                    item: item,
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
            IconButton(
              onPressed: () {
                supplicationItemState.toggleFavorite(item.id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: itemColor,
                    duration: const Duration(milliseconds: 750),
                    behavior: SnackBarBehavior.floating,
                    margin: AppStyles.mainMargin,
                    shape: AppStyles.mainShape,
                    content: SnackContainer(
                      message: isBookmark
                          ? AppStrings.deleted
                          : AppStrings.added,
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
                isBookmark
                    ? CupertinoIcons.bookmark_fill
                    : CupertinoIcons.bookmark,
                color:
                    isBookmark ? itemColor : theme.colorScheme.mainDefaultColor,
              ),
            ),
            Text(
              '${item.id}',
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
