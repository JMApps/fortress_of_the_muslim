import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/presentation/chapters/main_chapters_list.dart';
import 'package:fortress_of_the_muslim/presentation/chapters/search_chapter_delegate.dart';

class MainChaptersPage extends StatelessWidget  {
  const MainChaptersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: theme.colorScheme.mainChaptersBackgroundColor,
        appBar: AppBar(
          title: const Text(AppStrings.chapters),
          backgroundColor: theme.colorScheme.mainChaptersColor,
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchChapterDelegate(
                    hintText: AppStrings.searchChapters,
                  ),
                );
              },
              splashRadius: 20,
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: const MainChaptersList(),
      ),
    );
  }
}
