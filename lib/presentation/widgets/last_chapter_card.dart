import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/core/strings/app_strings.dart';
import 'package:fortress_of_the_muslim/presentation/states/main_chapters_state.dart';
import 'package:provider/provider.dart';

import '../../core/routes/name_routes.dart';
import '../../core/styles/app_styles.dart';
import '../../data/models/arguments/chapter_id_args.dart';

class LastChapterCard extends StatelessWidget {
  const LastChapterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: AppStyles.borderMini,
        side: BorderSide(
          color: Theme.of(context).colorScheme.inversePrimary,
          width: 2.5,
        ),
      ),
      elevation: 0,
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            NameRoutes.chapterContentPage,
            arguments: ChapterIdArgs(chapterId: Provider.of<MainChaptersState>(context, listen: false).getLastChapterId),
          );
        },
        shape: AppStyles.shapeMini,
        title: Text(
          AppStrings.readLastChapter.replaceAll('{}', '${Provider.of<MainChaptersState>(context).getLastChapterId}'),
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        leading: Icon(Icons.save),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
