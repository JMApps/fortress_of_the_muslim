import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';

class FavoriteChaptersAppBar extends StatelessWidget {
  const FavoriteChaptersAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.favoriteChapterRowColor,
      title: const Text('Избранное'),
      actions: const [],
    );
  }
}
