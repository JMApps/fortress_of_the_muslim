import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainFloatingButton extends StatelessWidget {
  const MainFloatingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(
        CupertinoIcons.bookmark_fill,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      tooltip: 'Избранное',
      backgroundColor: Colors.blue[900],
      onPressed: () {},
    );
  }
}
