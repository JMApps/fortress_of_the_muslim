import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';

class BookContentAppBar extends StatelessWidget {
  const BookContentAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Содержимое'),
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.mainContentBookColor,
      actions: const [
      ],
    );
  }
}
