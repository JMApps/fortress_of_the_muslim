import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/presentation/chapters/main_chapters_page.dart';

class AppRoutes {
  static Route onGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/main_chapters_page':
        return MaterialPageRoute(
          builder: (_) => const MainChaptersPage(),
        );
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
