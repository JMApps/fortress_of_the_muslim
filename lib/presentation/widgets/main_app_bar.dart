import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Крепость мусульманина'),
      elevation: 0,
      backgroundColor: const Color(0xff3f968c),
      actions: const [
      ],
    );
  }
}