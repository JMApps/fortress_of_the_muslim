import 'package:flutter/material.dart';

import '../../../core/strings/app_strings.dart';
import '../lists/favorite_chapters_list.dart';

class FavoriteChapterPage extends StatelessWidget {
  const FavoriteChapterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.favoriteChapters),
      ),
      body: const FavoriteChaptersList(),
    );
  }
}
