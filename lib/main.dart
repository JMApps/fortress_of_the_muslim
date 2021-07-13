// @dart=2.9
import 'package:flip_box_bar_plus/flip_box_bar_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/pages/favorite_chapters.dart';
import 'package:fortress_of_the_muslim/pages/favorite_supplications.dart';
import 'package:fortress_of_the_muslim/pages/list_supplications.dart';
import 'package:fortress_of_the_muslim/pages/main_chapters.dart';
import 'package:fortress_of_the_muslim/router/app_router.dart';
import 'package:fortress_of_the_muslim/styles/text_styles.dart';
import 'package:provider/provider.dart';

import 'logic/counter.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  var _appRouter = AppRouter();
  var _textStyles = TextStyles();

  final List<Widget> _changeWidget = [
    MainChapters(),
    FavoriteChapters(),
    ListSupplications(),
    FavoriteSupplications(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: _appRouter.appGeneratorRoute,
      theme: ThemeData(
        fontFamily: 'Gilroy'
      ),
      title: 'Крепость мусульманина',
      home: Scaffold(
        body: _changeWidget[_selectedIndex],
        bottomNavigationBar: FlipBoxBarPlus(
          navBarWidth: 60,
          selectedIndex: _selectedIndex,
          animationDuration: Duration(milliseconds: 900),
          items: [
            FlipBarItem(
                icon: Icon(CupertinoIcons.square_list, color: Colors.white),
                text: Text('Главы', style: _textStyles.flipBarItemTextStyle),
                frontColor: Colors.teal[500],
                backColor: Colors.teal[500]),
            FlipBarItem(
                icon: Icon(CupertinoIcons.bookmark, color: Colors.white),
                text:
                Text('Избранное', style: _textStyles.flipBarItemTextStyle),
                frontColor: Colors.orange[500],
                backColor: Colors.orange[500]),
            FlipBarItem(
                icon:
                Icon(CupertinoIcons.square_list_fill, color: Colors.white),
                text: Text('Дуа', style: _textStyles.flipBarItemTextStyle),
                frontColor: Colors.red[500],
                backColor: Colors.red[500]),
            FlipBarItem(
                icon: Icon(CupertinoIcons.bookmark_fill, color: Colors.white),
                text:
                Text('Избранное', style: _textStyles.flipBarItemTextStyle),
                frontColor: Colors.blue[500],
                backColor: Colors.blue[500])
          ],
          onIndexChanged: (newIndex) {
            setState(() {
              _selectedIndex = newIndex;
            });
          },
        ),
      ),
    );
  }
}
