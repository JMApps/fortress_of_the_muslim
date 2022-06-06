import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';

class SettingsAppBar extends StatelessWidget {
  const SettingsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Настройки'),
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.mainSettingsColor,
      actions: const [],
    );
  }
}
