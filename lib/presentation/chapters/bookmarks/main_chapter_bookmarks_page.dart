import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/presentation/chapters/bookmarks/main_chapter_bookmarks_list.dart';

class MainChapterBookmarksPage extends StatelessWidget {
  const MainChapterBookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: themeColors.mainBookmarksBackgroundColor,
      appBar: AppBar(
        title: const Text(AppStrings.chapterBookmarks),
        backgroundColor: themeColors.mainBookmarksColor,
    ),
    body: const MainChapterBookmarksList(),
    );
  }
}
