// @dart=2.9
import 'package:flip_box_bar_plus/flip_box_bar_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/pages/favorite_chapters.dart';
import 'package:fortress_of_the_muslim/pages/favorite_supplications.dart';
import 'package:fortress_of_the_muslim/pages/list_supplications.dart';
import 'package:fortress_of_the_muslim/pages/main_chapters.dart';
import 'package:fortress_of_the_muslim/provider/main_state.dart';
import 'package:fortress_of_the_muslim/styles/text_styles.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  MainPage({Key key}) : super(key: key);

  final _textStyles = TextStyles();

  final List<Widget> _changeWidget = [
    MainChapters(),
    FavoriteChapters(),
    ListSupplications(),
    FavoriteSupplications(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _changeWidget[context.watch<MainState>().getSelectedItem],
      bottomNavigationBar: FlipBoxBarPlus(
        navBarWidth: 60,
        selectedIndex: context.watch<MainState>().getSelectedItem,
        animationDuration: Duration(milliseconds: 900),
        items: [
          FlipBarItem(
              icon: Icon(CupertinoIcons.square_list, color: Colors.white),
              text: Text('Главы', style: _textStyles.flipBarItemTextStyle),
              frontColor: Colors.teal,
              backColor: Colors.teal),
          FlipBarItem(
              icon: Icon(CupertinoIcons.bookmark, color: Colors.white),
              text: Text('Избранное', style: _textStyles.flipBarItemTextStyle),
              frontColor: Colors.orange,
              backColor: Colors.orange),
          FlipBarItem(
              icon: Icon(CupertinoIcons.square_list_fill, color: Colors.white),
              text: Text('Дуа', style: _textStyles.flipBarItemTextStyle),
              frontColor: Colors.red,
              backColor: Colors.red),
          FlipBarItem(
              icon: Icon(CupertinoIcons.bookmark_fill, color: Colors.white),
              text: Text('Избранное', style: _textStyles.flipBarItemTextStyle),
              frontColor: Colors.blue,
              backColor: Colors.blue)
        ],
        onIndexChanged: (newIndex) {
          context.read<MainState>().selectedItem(newIndex);
        },
      ),
    );
  }
}