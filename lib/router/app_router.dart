import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/pages/content_chapter.dart';
import 'package:fortress_of_the_muslim/pages/main.dart';

class AppRouter {
  Route appGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => MainPage(), settings: routeSettings);
        break;
      case '/content_chapter':
        return MaterialPageRoute(
            builder: (_) => ContentChapter(), settings: routeSettings);
        break;
      default:
        throw Exception('Invalid route');
    }
  }
}
