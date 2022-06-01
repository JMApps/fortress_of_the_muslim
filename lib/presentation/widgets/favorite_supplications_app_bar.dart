import 'package:flutter/material.dart';

class FavoriteSupplicationsAppBar extends StatelessWidget {
  const FavoriteSupplicationsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Избранные дуа'),
      elevation: 0,
      backgroundColor: Colors.blue,
      actions: const [],
    );
  }
}
