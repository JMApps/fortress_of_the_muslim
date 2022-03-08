import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/provider/app_settings_state.dart';
import 'package:fortress_of_the_muslim/provider/day_night_chapter_state.dart';
import 'package:fortress_of_the_muslim/provider/favorite_supplication_state.dart';
import 'package:fortress_of_the_muslim/provider/floating_counter_state.dart';
import 'package:fortress_of_the_muslim/provider/main_state.dart';
import 'package:fortress_of_the_muslim/provider/take_screenshot_state.dart';
import 'package:fortress_of_the_muslim/router/app_router.dart';
import 'package:fortress_of_the_muslim/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  Main({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

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
      child: ChangeNotifierProvider(
        create: (_) => MainState(),
        child: Consumer<MainState>(
          builder: (BuildContext context, MainState mainState, child) {
            mainState.initTheme();
            return MaterialApp(
                theme: mainState.getNightThemeState ? AppTheme().darkTheme : AppTheme().lightTheme,
                debugShowCheckedModeBanner: false,
                initialRoute: '/',
                onGenerateRoute: _appRouter.appGeneratorRoute,
                title: 'Крепость мусульманина');
          },
        ),
      ),
    );
  }
}
