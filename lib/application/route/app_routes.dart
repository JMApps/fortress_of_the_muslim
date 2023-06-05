import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/presentation/chapters/bookmarks/main_chapter_bookmarks_page.dart';
import 'package:fortress_of_the_muslim/presentation/chapters/main_chapters_page.dart';

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
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
