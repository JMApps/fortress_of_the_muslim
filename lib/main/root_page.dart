import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/other/default_scroll_behavior.dart';
import 'package:fortress_of_the_muslim/application/route/app_routes.dart';
import 'package:fortress_of_the_muslim/application/state/main_chapters_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/main/main_page.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainChaptersState(),
        ),
      ],
      child: MaterialApp(
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: DefaultScrollBehavior(),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        onGenerateRoute: AppRoutes.onGeneratorRoute,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        home: const MainPage(),
      ),
    );
  }
}
