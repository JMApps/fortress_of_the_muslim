import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/presentation/supplications/bookmarks/main_supplication_bookmarks_list.dart';

class MainSupplicationBookmarksPage extends StatelessWidget {
  const MainSupplicationBookmarksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.mainSupplicationsBookmarkBackgroundColor,
      appBar: AppBar(
        title: const Text(AppStrings.supplicationBookmarks),
        backgroundColor: theme.colorScheme.mainSupplicationsBookmarkColor,
      ),
      body: const MainSupplicationBookmarksList(),
    );
  }
}
