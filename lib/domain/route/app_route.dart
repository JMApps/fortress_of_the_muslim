import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/book_content_arguments.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/chapter_content_arguments.dart';
import 'package:fortress_of_the_muslim/presentation/pages/app_settings.dart';
import 'package:fortress_of_the_muslim/presentation/pages/book_contents.dart';
import 'package:fortress_of_the_muslim/presentation/pages/chapter_content.dart';
import 'package:fortress_of_the_muslim/presentation/pages/chapter_content_day_night.dart';
import 'package:fortress_of_the_muslim/presentation/pages/chapters.dart';
import 'package:fortress_of_the_muslim/presentation/pages/content_book_content.dart';
import 'package:fortress_of_the_muslim/presentation/pages/favorite_chapters.dart';
import 'package:fortress_of_the_muslim/presentation/pages/favorite_supplications.dart';
import 'package:fortress_of_the_muslim/presentation/pages/supplications.dart';

class AppRoute {
  Route onGeneratorRoute(settings) {
    switch (settings.name) {
      case 'main_chapters':
        return MaterialPageRoute(
          builder: (_) => const Chapters(),
          settings: settings,
        );
      case 'favorite_chapters':
        return MaterialPageRoute(
          builder: (_) => const FavoriteChapters(),
          settings: settings,
        );
      case 'chapter_content':
        final ChapterContentArguments chapterContentArguments = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => ChapterContent(chapterId: chapterContentArguments.chapterId),
          settings: settings,
        );
      case 'chapter_content_day_night':
        return MaterialPageRoute(
          builder: (_) => const ChapterContentDayNight(),
          settings: settings,
        );
      case 'main_supplications':
        return MaterialPageRoute(
          builder: (_) => const Supplications(),
          settings: settings,
        );
      case 'favorite_supplications':
        return MaterialPageRoute(
          builder: (_) => const FavoriteSupplications(),
          settings: settings,
        );
      case 'app_settings':
        return MaterialPageRoute(
          builder: (_) => const AppSettings(),
          settings: settings,
        );
      case 'book_content':
        return MaterialPageRoute(
          builder: (_) => const BookContents(),
          settings: settings,
        );
      case 'content_book_content':
        final BookContentArguments bookContentArguments = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => ContentBookContent(
            title: bookContentArguments.title,
            content: bookContentArguments.content,
          ),
          settings: settings,
        );
    }
    return throw (Exception('Invalid route = ${settings.name}'));
  }
}
