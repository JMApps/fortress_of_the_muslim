import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/data/model/main_chapter_model.dart';

class MainChapterItem extends StatelessWidget {
  const MainChapterItem({
    super.key,
    required this.item,
    required this.itemIndex,
  });

  final MainChapterModel item;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context);
    return Card(
      elevation: 0,
      color: itemIndex.isOdd ? Colors.white : Colors.blueGrey.shade50,
      child: ListTile(
        contentPadding: AppStyles.mainPaddingMini,
        dense: true,
        onTap: () {},
        shape: AppStyles.mainShape,
        title: Text(
          item.chapterNumber,
          style: textTheme.textTheme.titleLarge,
        ),
        subtitle: Html(
          data: item.chapterTitle,
          style: {
            '#': Style(
              fontSize: FontSize(17),
              fontFamily: 'Gilroy',
              color: textTheme.colorScheme.mainDefaultColor,
              padding: HtmlPaddings.zero,
              margin: Margins.zero,
            ),
            'b': Style(
              fontSize: FontSize(17),
              fontWeight: FontWeight.bold,
              color: textTheme.colorScheme.mainDefaultColor,
              padding: HtmlPaddings.zero,
              margin: Margins.zero,
            )
          },
        ),
        leading: IconButton(
          onPressed: () {},
          splashRadius: 25,
          icon: const Icon(CupertinoIcons.bookmark),
          visualDensity: const VisualDensity(horizontal: -4),
        ),
      ),
    );
  }
}
