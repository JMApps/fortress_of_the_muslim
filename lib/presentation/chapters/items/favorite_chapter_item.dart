import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fortress_of_the_muslim/core/strings/app_constraints.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/routes/name_routes.dart';
import '../../../core/styles/app_styles.dart';
import '../../../data/models/arguments/chapter_id_args.dart';
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
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    final itemOddColor = appColors.inversePrimary.withOpacity(0.075);
    final itemEvenColor = appColors.inversePrimary.withOpacity(0.150);
    return Padding(
      padding: AppStyles.paddingBottomMini,
      child: ListTile(
        onTap: () async {
          HapticFeedback.lightImpact();
          Provider.of<MainChaptersState>(context, listen: false).saveLastChapter(chapterModel.chapterId);
          await Navigator.pushNamed(
            context,
            NameRoutes.chapterContentPage,
            arguments: ChapterIdArgs(chapterId: chapterModel.chapterId),
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
          font: AppConstraints.fontRaleway,
          fontSize: 17.0,
          textAlign: TextAlign.start,
          fontColor: appColors.onSurface,
        ),
        leading: Consumer<MainChaptersState>(
          builder: (context, mainChaptersState, _) {
            return IconButton.filledTonal(
              onPressed: () {
                mainChaptersState.toggleChapterFavorite(chapterId: chapterModel.chapterId);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: appColors.secondaryContainer,
                    duration: const Duration(milliseconds: 500),
                    shape: AppStyles.shape,
                    elevation: 0,
                    content: Text(
                      mainChaptersState.chapterIsFavorite(chapterModel.chapterId) ? appLocale.removed : appLocale.added,
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
                color: appColors.secondary,
              ),
            );
          },
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: appColors.secondary,
        ),
      ),
    );
  }
}
