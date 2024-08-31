import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/chapter_entity.dart';
import '../../widgets/main_html_data.dart';

class MainChapterItem extends StatelessWidget {
  const MainChapterItem({
    super.key,
    required this.chapterModel,
    required this.chapterIndex,
  });

  final ChapterEntity chapterModel;
  final int chapterIndex;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final itemOddColor = appColors.inversePrimary.withOpacity(0.05);
    final itemEvenColor = appColors.inversePrimary.withOpacity(0.125);
    return Padding(
      padding: AppStyles.paddingBottomMini,
      child: ListTile(
        onTap: () {
          HapticFeedback.lightImpact();
        },
        splashColor: appColors.inversePrimary.withOpacity(0.25),
        tileColor: chapterIndex.isOdd ? itemOddColor : itemEvenColor,
        shape: AppStyles.shape,
        title: Text(
          chapterModel.chapterNumber,
          style: TextStyle(
            color: appColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: MainHtmlData(
          htmlData: chapterModel.chapterTitle,
          footnoteColor: appColors.primary,
          fontSize: 16.0,
        ),
        leading: IconButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          icon: const Icon(CupertinoIcons.bookmark),
        ),
      ),
    );
  }
}
