import 'package:flutter/material.dart';

class BookmarkSnackBar extends StatelessWidget {
  const BookmarkSnackBar({
    Key? key,
    required this.color,
    required this.favoriteState,
  }) : super(key: key);

  final Color color;
  final int favoriteState;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      backgroundColor: color,
      content: favoriteState == 1
          ? const Text(
              'Добавлено',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            )
          : const Text(
              'Удалено',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
      duration: const Duration(milliseconds: 500),
    );
  }
}
