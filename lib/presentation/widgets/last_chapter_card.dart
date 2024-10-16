import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/routes/name_routes.dart';
import '../../core/strings/app_strings.dart';
import '../../core/styles/app_styles.dart';
import '../../data/models/arguments/chapter_id_args.dart';
import '../states/main_chapters_state.dart';

class LastChapterCard extends StatelessWidget {
  const LastChapterCard({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return FilledButton.tonalIcon(
      onPressed: () {
        Navigator.pushNamed(
          context,
          NameRoutes.chapterContentPage,
          arguments: ChapterIdArgs(chapterId: Provider.of<MainChaptersState>(context, listen: false).getLastChapterId),
        );
      },
      icon: Icon(
        Icons.save,
        color: appColors.primary,
      ),
      label: Text(
        AppStrings.readLastChapter.replaceAll('{}', '${Provider.of<MainChaptersState>(context).getLastChapterId}'),
        style: AppStyles.mainTextStyle17,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
