import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';

class FavoriteSupplicationsAppBar extends StatelessWidget {
  const FavoriteSupplicationsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.favoriteSupplicationRowColor,
      title: const Text('Избранные дуа'),
      actions: const [],
    );
  }
}
