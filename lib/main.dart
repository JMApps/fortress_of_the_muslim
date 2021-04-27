import 'package:flip_box_bar_plus/flip_box_bar_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/pages/favorite_chapters.dart';
import 'package:fortress_of_the_muslim/pages/favorite_supplications.dart';
import 'package:fortress_of_the_muslim/pages/list_supplications.dart';
import 'package:fortress_of_the_muslim/pages/main_chapters.dart';
import 'package:fortress_of_the_muslim/router/app_router.dart';
import 'package:fortress_of_the_muslim/styles/text_styles.dart';
import 'package:fortress_of_the_muslim/styles/themes.dart';
import 'package:fortress_of_the_muslim/theme/dark_theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _themeChangeProvider = DarkThemeProvider();
  int _selectedIndex = 0;
  var _appRouter = AppRouter();
  var _textStyles = TextStyles();
  var themes = Themes();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    _themeChangeProvider.darkTheme =
        await _themeChangeProvider.darkThemePreference.getTheme();
  }

  List<Color> _changeColor = [
    Colors.teal[500],
    Colors.orange[500],
    Colors.red[500],
    Colors.blue[500],
  ];

  final List<Widget> _changeWidget = [
    MainChapters(),
    FavoriteChapters(),
    ListSupplications(),
    FavoriteSupplications(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return _themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            onGenerateRoute: _appRouter.appGeneratorRoute,
            title: 'Крепость мусульманина',
            theme: ThemeData(
              fontFamily: 'Gilroy'
            ),
            // theme: themes.themeData(
            //     _themeChangeProvider.darkTheme, _selectedIndex),
            home: Scaffold(
              appBar: AppBar(
                title: Text('Крепость мусульманина'),
                backgroundColor: _changeColor[_selectedIndex],
                elevation: 0,
                actions: [
                  // Checkbox(
                  //   value: _themeChangeProvider.darkTheme,
                  //   onChanged: (bool value) {
                  //     _themeChangeProvider.darkTheme = value;
                  //   },
                  // ),
                ],
              ),
              body: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          _changeColor[_selectedIndex].withOpacity(1),
                          BlendMode.color),
                      image: AssetImage(
                          'assets/images/${_themeChangeProvider.darkTheme ? 'background_ornament_dark.png' : 'background_ornament.png'}'),
                      fit: BoxFit.cover),
                ),
                child: _changeWidget[_selectedIndex],
              ),
              bottomNavigationBar: FlipBoxBarPlus(
                navBarWidth: 60,
                selectedIndex: _selectedIndex,
                animationDuration: Duration(milliseconds: 900),
                items: [
                  FlipBarItem(
                      icon:
                          Icon(CupertinoIcons.square_list, color: Colors.white),
                      text: Text('Главы',
                          style: _textStyles.flipBarItemTextStyle),
                      frontColor: _themeChangeProvider.darkTheme
                          ? Colors.teal[900]
                          : Colors.teal[500],
                      backColor: _themeChangeProvider.darkTheme
                          ? Colors.teal[900]
                          : Colors.teal[500]),
                  FlipBarItem(
                      icon: Icon(CupertinoIcons.bookmark, color: Colors.white),
                      text: Text('Избранное',
                          style: _textStyles.flipBarItemTextStyle),
                      frontColor: _themeChangeProvider.darkTheme
                          ? Colors.orange[900]
                          : Colors.orange[500],
                      backColor: _themeChangeProvider.darkTheme
                          ? Colors.orange[900]
                          : Colors.orange[500]),
                  FlipBarItem(
                      icon: Icon(CupertinoIcons.square_list_fill,
                          color: Colors.white),
                      text:
                          Text('Дуа', style: _textStyles.flipBarItemTextStyle),
                      frontColor: _themeChangeProvider.darkTheme
                          ? Colors.red[900]
                          : Colors.red[500],
                      backColor: _themeChangeProvider.darkTheme
                          ? Colors.red[900]
                          : Colors.red[500]),
                  FlipBarItem(
                      icon: Icon(CupertinoIcons.bookmark_fill,
                          color: Colors.white),
                      text: Text('Избранное',
                          style: _textStyles.flipBarItemTextStyle),
                      frontColor: _themeChangeProvider.darkTheme
                          ? Colors.blue[900]
                          : Colors.blue[500],
                      backColor: _themeChangeProvider.darkTheme
                          ? Colors.blue[900]
                          : Colors.blue[500])
                ],
                onIndexChanged: (newIndex) {
                  setState(() {
                    _selectedIndex = newIndex;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
