import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../core/routes/name_routes.dart';
import '../../core/styles/app_styles.dart';
import '../../data/models/arguments/chapter_id_args.dart';
import '../states/main_chapters_state.dart';

class LastChapterCard extends StatelessWidget {
  const LastChapterCard({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return OutlinedButton(
      onPressed: () async {
        await Navigator.pushNamed(
          context,
          NameRoutes.chapterContentPage,
          arguments: ChapterIdArgs(
            chapterId: Provider.of<MainChaptersState>(context, listen: false).getLastChapterId,
            chaptersTableName: appLocale.chapterTableName,
            supplicationsTableName: appLocale.supplicationsTableName,
          ),
        );
      },
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            appLocale.readLastChapter.replaceAll('||', '${Provider.of<MainChaptersState>(context).getLastChapterId}'),
            style: AppStyles.mainTextStyle17,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.last_page_rounded,
            color: appColors.primary,
          ),
        ],
      ),
    );
  }
}
