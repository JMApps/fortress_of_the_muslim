import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/name_routes.dart';
import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../data/models/arguments/chapter_model_args.dart';
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
    final itemOddColor = appColors.inversePrimary.withOpacity(0.125);
    final itemEvenColor = appColors.inversePrimary.withOpacity(0.250);
    final bool chapterIsFavorite = Provider.of<MainChaptersState>(context).chapterIsFavorite(chapterModel.chapterId);
    return Padding(
      padding: AppStyles.paddingBottomMini,
      child: ListTile(
        onTap: () {
          HapticFeedback.lightImpact();
          Navigator.pushNamed(
            context,
            NameRoutes.chapterContentPage,
            arguments: ChapterModelArgs(chapterModel: chapterModel),
          );
        },
        horizontalTitleGap: 8,
        contentPadding: AppStyles.paddingHorMiniVerMicro,
        splashColor: appColors.inversePrimary.withOpacity(0.5),
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
          footnoteColor: Colors.orange,
          fontSize: 17.0,
          textAlign: TextAlign.start,
        ),
        leading: IconButton(
          onPressed: () {
            Provider.of<MainChaptersState>(context, listen: false).toggleChapterFavorite(chapterId: chapterModel.chapterId);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: appColors.secondaryContainer,
                duration: const Duration(milliseconds: 750),
                behavior: SnackBarBehavior.floating,
                margin: AppStyles.paddingMini,
                shape: AppStyles.shape,
                elevation: 0,
                content: Text(
                  chapterIsFavorite ? AppStrings.removed : AppStrings.added,
                  style: TextStyle(
                    fontSize: 17.0,
                    color: appColors.onSurface,
                  ),
                ),
              ),
            );
          },
          padding: EdgeInsets.zero,
          icon: Icon(
            Icons.bookmark,
            color: appColors.primary,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
