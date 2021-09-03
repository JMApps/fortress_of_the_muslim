import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/main.dart';
import 'package:fortress_of_the_muslim/pages/content_chapter.dart';
import 'package:fortress_of_the_muslim/pages/other_book_content.dart';
import 'package:fortress_of_the_muslim/pages/other_content.dart';

class AppRouter {
  Route appGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => MainPage(), settings: routeSettings);
      case '/content_chapter':
        return MaterialPageRoute(
            builder: (_) => ContentChapter(), settings: routeSettings);
      case '/other_content':
        return MaterialPageRoute(
            builder: (_) => OtherContent(), settings: routeSettings);
      case '/other_book_content':
        return MaterialPageRoute(
            builder: (_) => OtherBookContent(), settings: routeSettings);
      default:
        throw Exception('Invalid route');
    }
  }
}