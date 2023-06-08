import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/presentation/chapters/bookmarks/main_chapter_bookmarks_list.dart';

class MainChapterBookmarksPage extends StatelessWidget {
  const MainChapterBookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.mainBookmarksBackgroundColor,
      appBar: AppBar(
        title: const Text(AppStrings.chapterBookmarks),
        backgroundColor: theme.colorScheme.mainBookmarksColor,
    ),
    body: const MainChapterBookmarksList(),
    );
  }
}
