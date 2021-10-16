import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/pages/about_us.dart';
import 'package:fortress_of_the_muslim/pages/content_chapter.dart';
import 'package:fortress_of_the_muslim/pages/day_night_content_chapter.dart';
import 'package:fortress_of_the_muslim/pages/main_page.dart';
import 'package:fortress_of_the_muslim/pages/other_book_content.dart';
import 'package:fortress_of_the_muslim/widget/other_content_list.dart';

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
      case '/day_night_supplications':
        return MaterialPageRoute(
            builder: (_) => DayNightContentChapter(), settings: routeSettings);
      case '/about_us':
        return MaterialPageRoute(
            builder: (_) => AboutUs(), settings: routeSettings);
      default:
        throw Exception('Invalid route');
    }
  }
}
