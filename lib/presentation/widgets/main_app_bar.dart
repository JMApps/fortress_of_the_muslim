import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text(
        'Крепость мусульманина',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.mainColor,
      actions: const [],
    );
  }
}
