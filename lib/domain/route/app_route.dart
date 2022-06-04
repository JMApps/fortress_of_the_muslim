import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/presentation/pages/app_settings.dart';
import 'package:fortress_of_the_muslim/presentation/pages/book_contents.dart';
import 'package:fortress_of_the_muslim/presentation/pages/chapter_content.dart';
import 'package:fortress_of_the_muslim/presentation/pages/chapters.dart';
import 'package:fortress_of_the_muslim/presentation/pages/content_book_content.dart';
import 'package:fortress_of_the_muslim/presentation/pages/favorite_chapters.dart';
import 'package:fortress_of_the_muslim/presentation/pages/favorite_supplications.dart';
import 'package:fortress_of_the_muslim/presentation/pages/supplications.dart';

class AppRoute {
  Route onGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case 'main_chapters':
        return MaterialPageRoute(
          builder: (_) => const Chapters(),
          settings: routeSettings,
        );
      case 'favorite_chapters':
        return MaterialPageRoute(
          builder: (_) => const FavoriteChapters(),
          settings: routeSettings,
        );
      case 'chapter_content':
        return MaterialPageRoute(
          builder: (_) => const ChapterContent(),
          settings: routeSettings,
        );
      case 'main_supplications':
        return MaterialPageRoute(
          builder: (_) => const Supplications(),
          settings: routeSettings,
        );
      case 'favorite_supplications':
        return MaterialPageRoute(
          builder: (_) => const FavoriteSupplications(),
          settings: routeSettings,
        );
      case 'app_settings':
        return MaterialPageRoute(
          builder: (_) => const AppSettings(),
          settings: routeSettings,
        );
      case 'book_content':
        return MaterialPageRoute(
          builder: (_) => const BookContents(),
          settings: routeSettings,
        );
      case 'content_book_content':
        return MaterialPageRoute(
          builder: (_) => const ContentBookContent(),
          settings: routeSettings,
        );
    }
    return throw (Exception('Invalid route = ${routeSettings.name}'));
  }
}
