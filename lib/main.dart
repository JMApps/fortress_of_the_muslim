// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/pages/favorite_chapters.dart';
import 'package:fortress_of_the_muslim/pages/favorite_supplications.dart';
import 'package:fortress_of_the_muslim/pages/list_supplications.dart';
import 'package:fortress_of_the_muslim/pages/main_chapters.dart';
import 'package:fortress_of_the_muslim/provider/main_state.dart';
import 'package:fortress_of_the_muslim/router/app_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  Main({Key key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainState>(create: (_) => MainState()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          onGenerateRoute: _appRouter.appGeneratorRoute,
          theme: ThemeData(
            fontFamily: 'Gilroy',
            primarySwatch: Colors.teal,
          ),
          title: 'Крепость мусульманина'),
    );
  }
}
