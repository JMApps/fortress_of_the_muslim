import 'package:flip_box_bar_plus/flip_box_bar_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortress_of_the_muslim/theme/theme_cubit.dart';
import 'package:fortress_of_the_muslim/pages/favorite_chapters.dart';
import 'package:fortress_of_the_muslim/pages/favorite_supplications.dart';
import 'package:fortress_of_the_muslim/pages/list_supplications.dart';
import 'package:fortress_of_the_muslim/pages/main_chapters.dart';
import 'package:fortress_of_the_muslim/router/app_router.dart';
import 'package:fortress_of_the_muslim/styles/text_styles.dart';
import 'package:fortress_of_the_muslim/styles/themes.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
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
  var themes = Themes();

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
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (BuildContext context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            onGenerateRoute: _appRouter.appGeneratorRoute,
            title: 'Крепость мусульманина',
            theme: theme,
            // theme: themes.themeData(
            //     _themeChangeProvider.darkTheme, _selectedIndex),
            home: Scaffold(
              appBar: AppBar(
                title: Text('Крепость мусульманина'),
                backgroundColor: _changeColor[_selectedIndex],
                elevation: 0,
                actions: [
                  // IconButton(
                  //   icon: Icon(Icons.night_shelter),
                  //   onPressed: () {
                  //     context.read<ThemeCubit>().toggleTheme();
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
                      image:
                          AssetImage('assets/images/background_ornament.png'),
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
                      frontColor: Colors.teal[500],
                      backColor: Colors.teal[500]),
                  FlipBarItem(
                      icon: Icon(CupertinoIcons.bookmark, color: Colors.white),
                      text: Text('Избранное',
                          style: _textStyles.flipBarItemTextStyle),
                      frontColor: Colors.orange[500],
                      backColor: Colors.orange[500]),
                  FlipBarItem(
                      icon: Icon(CupertinoIcons.square_list_fill,
                          color: Colors.white),
                      text:
                          Text('Дуа', style: _textStyles.flipBarItemTextStyle),
                      frontColor: Colors.red[500],
                      backColor: Colors.red[500]),
                  FlipBarItem(
                      icon: Icon(CupertinoIcons.bookmark_fill,
                          color: Colors.white),
                      text: Text('Избранное',
                          style: _textStyles.flipBarItemTextStyle),
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
        },
      ),
    );
  }
}
