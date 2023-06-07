import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/presentation/chapters/bookmarks/main_chapter_bookmarks_page.dart';
import 'package:fortress_of_the_muslim/presentation/chapters/main_chapters_page.dart';
import 'package:fortress_of_the_muslim/presentation/counter/counter_page.dart';
import 'package:fortress_of_the_muslim/presentation/supplications/main_supplications_page.dart';

class AppRoutes {
  static Route onGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/main_chapters_page':
        return MaterialPageRoute(
          builder: (_) => const MainChaptersPage(),
        );
      case '/bookmark_chapters_page':
        return MaterialPageRoute(
          builder: (_) => const MainChapterBookmarksPage(),
        );
      case '/main_supplications_page':
        return MaterialPageRoute(
          builder: (_) => const MainSupplicationsPage(),
        );
      // case '/bookmark_supplications_page':
      //   return MaterialPageRoute(
      //     builder: (_) => const MainSupplicationBookmarksPage(),
      //   );
      case '/counter_page':
        return MaterialPageRoute(
          builder: (_) => const CounterPage(),
        );
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
