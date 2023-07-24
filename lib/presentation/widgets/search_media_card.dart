import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/data/model/main_supplication_model.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/copy_share_card.dart';

class SearchMediaCard extends StatelessWidget {
  const SearchMediaCard({
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
    return Card(
      margin: EdgeInsets.zero,
      color: itemIndex.isOdd
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
          ],
        ),
      ),
    );
  }
}
