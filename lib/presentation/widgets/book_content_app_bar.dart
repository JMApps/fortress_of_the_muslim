import 'package:flutter/material.dart';

class BookContentAppBar extends StatelessWidget {
  const BookContentAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Содержимое'),
      actions: const [],
    );
  }
}
