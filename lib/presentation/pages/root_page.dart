import 'package:flutter/material.dart';

import '../../core/routes/app_routes.dart';
import '../../core/themes/app_themes.dart';
import 'main_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appThemes = AppThemes(Colors.blue);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onRouteGenerator,
      theme: appThemes.lightTheme,
      darkTheme: appThemes.darkTheme,
      home: const MainPage(),
    );
  }
}
