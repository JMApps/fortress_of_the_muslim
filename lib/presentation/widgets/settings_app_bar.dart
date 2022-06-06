import 'package:flutter/material.dart';

class SettingsAppBar extends StatelessWidget {
  const SettingsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Настройки'),
      actions: const [],
    );
  }
}
