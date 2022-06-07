import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';

class BookContentAppBar extends StatelessWidget {
  const BookContentAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.mainContentBookItemColor,
      title: const Text('Содержимое'),
      actions: const [],
    );
  }
}
