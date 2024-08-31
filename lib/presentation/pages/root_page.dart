import 'package:flutter/material.dart';

import '../../core/routes/app_routes.dart';
import '../../core/themes/app_theme.dart';
import 'main_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onRouteGenerator,
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      home: const MainPage(),
    );
  }
}
