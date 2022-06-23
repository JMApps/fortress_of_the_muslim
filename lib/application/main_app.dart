import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/domain/route/app_route.dart';
import 'package:fortress_of_the_muslim/domain/state/app_settings_state.dart';
import 'package:fortress_of_the_muslim/domain/state/chapter_content_settings_state.dart';
import 'package:fortress_of_the_muslim/domain/state/main_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/presentation/pages/main.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppSettingsState>(
          create: (_) => AppSettingsState(),
        ),
        ChangeNotifierProvider<MainState>(
          create: (_) => MainState(),
        ),
        ChangeNotifierProvider<ChapterContentSettingsState>(
          create: (_) => ChapterContentSettingsState(),
        ),
      ],
      child: Builder(builder: (context) {
        context.read<AppSettingsState>().loadLastPreferencesState();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Крепость мусульманина',
          themeMode: context.watch<AppSettingsState>().themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          onGenerateRoute: AppRoute().onGeneratorRoute,
          home: const MainPage(),
        );
      }),
    );
  }
}
