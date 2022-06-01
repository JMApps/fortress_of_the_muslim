import 'package:flutter/material.dart';

class BookContentAppBar extends StatelessWidget {
  const BookContentAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Содержимое'),
      elevation: 0,
      backgroundColor: Colors.brown,
      actions: const [
      ],
    );
  }
}
