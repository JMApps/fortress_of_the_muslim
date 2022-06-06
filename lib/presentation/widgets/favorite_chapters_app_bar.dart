import 'package:flutter/material.dart';

class FavoriteChaptersAppBar extends StatelessWidget {
  const FavoriteChaptersAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Избранное'),
      actions: const [],
    );
  }
}
