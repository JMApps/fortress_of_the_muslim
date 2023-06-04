import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/main/main_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainPage(),
    );
  }
}
