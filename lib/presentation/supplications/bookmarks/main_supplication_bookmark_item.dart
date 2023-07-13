import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/data/model/main_supplication_model.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/for_html_text.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/supplication_media_card.dart';

class MainSupplicationBookmarkItem extends StatelessWidget {
  const MainSupplicationBookmarkItem({
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
                    style: const TextStyle(
                      fontSize: 25,
                      fontFamily: 'Hafs',
                    ),
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
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w100,
                    ),
                    textAlign: TextAlign.start,
                  )
                : const SizedBox(),
            item.transcriptionText != null
                ? const SizedBox(height: 16)
                : const SizedBox(),
            ForHtmlText(
              textData: item.translationText,
              textSize: 17,
              textColor: theme.colorScheme.mainDefaultColor,
              footnoteColor: const Color(0xFF1E88E5),
              textDataAlign: TextAlign.start,
            ),
            const SizedBox(height: 16),
            SupplicationMediaCard(
              item: item,
              itemIndex: itemIndex,
              itemColor: const Color(0xFF1E88E5),
              itemsLength: itemsLength,
            ),
          ],
        ),
      ),
    );
  }
}
