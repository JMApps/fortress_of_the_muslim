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
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: AppStyles.borderMini,
        side: BorderSide(
          color: appColors.inversePrimary,
          width: 2.5,
        ),
      ),
      elevation: 0,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            NameRoutes.chapterContentPage,
            arguments: ChapterIdArgs(chapterId: Provider.of<MainChaptersState>(context, listen: false).getLastChapterId),
          );
        },
        splashColor: appColors.inversePrimary.withOpacity(0.5),
        borderRadius: AppStyles.borderMini,
        child: Padding(
          padding: AppStyles.paddingMini,
          child: Row(
            children: [
              const SizedBox(width: 8),
              Icon(Icons.save),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  AppStrings.readLastChapter.replaceAll('{}', '${Provider.of<MainChaptersState>(context).getLastChapterId}'),
                  style: AppStyles.mainTextStyle17,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward_ios_rounded),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}
