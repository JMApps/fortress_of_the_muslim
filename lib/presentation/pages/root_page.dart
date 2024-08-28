import 'package:flutter/material.dart';

import '../../core/themes/app_theme.dart';
import 'main_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppTheme appTheme = AppTheme(themeColor: Colors.teal);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme.lightTheme,
      darkTheme: appTheme.darkTheme,
      home: const MainPage(),
    );
  }
}
