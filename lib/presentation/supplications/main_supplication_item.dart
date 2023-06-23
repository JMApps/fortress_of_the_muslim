import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/data/model/main_supplication_model.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/for_html_text.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/supplication_media_card.dart';

class MainSupplicationItem extends StatelessWidget {
  const MainSupplicationItem({
    super.key,
    required this.item,
    required this.itemIndex,
    required this.itemsLength,
  });

  final MainSupplicationModel item;
  final int itemIndex;
  final int itemsLength;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
            ForHtmlText(
              textData: item.translationText,
              textSize: 17,
              footnoteColor: const Color(0xFFE53935),
              textDataAlign: TextAlign.start,
            ),
            const SizedBox(height: 16),
            SupplicationMediaCard(
              item: item,
              itemIndex: itemIndex,
              itemsLength: itemsLength,
              itemColor: const Color(0xFFE53935),
            ),
          ],
        ),
      ),
    );
  }
}
