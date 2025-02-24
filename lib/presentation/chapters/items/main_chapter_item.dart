import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fortress_of_the_muslim/core/strings/app_constraints.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/name_routes.dart';
import '../../../core/styles/app_styles.dart';
import '../../../data/models/arguments/chapter_id_args.dart';
import '../../../domain/entities/chapter_entity.dart';
import '../../states/main_chapters_state.dart';
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
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    final itemOddColor = appColors.inversePrimary.withAlpha(15);
    final itemEvenColor = appColors.inversePrimary.withAlpha(35);
    return Padding(
      padding: AppStyles.paddingBottomMini,
      child: ListTile(
        onTap: () async {
          HapticFeedback.lightImpact();
          Provider.of<MainChaptersState>(context, listen: false).saveLastChapter(chapterModel.chapterId);
          await Navigator.pushNamed(
            context,
            NameRoutes.chapterContentPage,
            arguments: ChapterIdArgs(
              chapterId: chapterModel.chapterId,
              chaptersTableName: appLocale.chapterTableName,
              supplicationsTableName: appLocale.supplicationsTableName,
            ),
          );
        },
        horizontalTitleGap: 8,
        contentPadding: AppStyles.paddingHorMiniVerMicro,
        splashColor: appColors.inversePrimary.withAlpha(155),
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
          font: AppConstraints.fontGilroy,
          fontSize: 17.0,
          textAlign: TextAlign.start,
          fontColor: appColors.onSurface,
        ),
        leading: Consumer<MainChaptersState>(
          builder: (context, mainChaptersState, _) {
            bool isFavorite = mainChaptersState.chapterIsFavorite(chapterModel.chapterId);
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
                      isFavorite ? appLocale.removed : appLocale.added,
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
                isFavorite ? Icons.bookmark : Icons.bookmark_outline_outlined,
                color: appColors.tertiary,
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
