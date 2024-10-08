import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/chapter_entity.dart';
import '../../states/main_chapters_state.dart';
import '../../widgets/main_html_data.dart';

class FavoriteChapterItem extends StatelessWidget {
  const FavoriteChapterItem({
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
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: MainHtmlData(
          htmlData: chapterModel.chapterTitle,
          footnoteColor: appColors.primary,
          fontSize: 17.0,
        ),
        leading: IconButton(
          onPressed: () {
            Provider.of<MainChaptersState>(context, listen: false).toggleChapterFavorite(chapterId: chapterModel.chapterId);
          },
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.bookmark),
        ),
      ),
    );
  }
}
