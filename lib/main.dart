import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/provider/app_settings_state.dart';
import 'package:fortress_of_the_muslim/provider/day_night_chapter_state.dart';
import 'package:fortress_of_the_muslim/provider/favorite_supplication_state.dart';
import 'package:fortress_of_the_muslim/provider/floating_counter_state.dart';
import 'package:fortress_of_the_muslim/provider/main_state.dart';
import 'package:fortress_of_the_muslim/provider/take_screenshot_state.dart';
import 'package:fortress_of_the_muslim/router/app_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  Main({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  // Test ok

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainState>(create: (_) => MainState()),
        ChangeNotifierProvider<FloatingCounterState>(create: (_) => FloatingCounterState()),
        ChangeNotifierProvider<AppSettingsState>(create: (_) => AppSettingsState()),
        ChangeNotifierProvider<TakeScreenshotState>(create: (_) => TakeScreenshotState()),
        ChangeNotifierProvider<DayNightChapterState>(create: (_) => DayNightChapterState()),
        ChangeNotifierProvider<FavoriteSupplicationState>(create: (_) => FavoriteSupplicationState()),
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