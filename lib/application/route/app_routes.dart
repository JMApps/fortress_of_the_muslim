import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/arguments/book_content_arguments.dart';
import 'package:fortress_of_the_muslim/data/arguments/main_chapter_arguments.dart';
import 'package:fortress_of_the_muslim/presentation/book/book_content_list_page.dart';
import 'package:fortress_of_the_muslim/presentation/book/book_content_page.dart';
import 'package:fortress_of_the_muslim/presentation/book/footnote_page.dart';
import 'package:fortress_of_the_muslim/presentation/chapters/bookmarks/main_chapter_bookmarks_page.dart';
import 'package:fortress_of_the_muslim/presentation/chapters/main_chapters_page.dart';
import 'package:fortress_of_the_muslim/presentation/content/chapter_content_page.dart';
import 'package:fortress_of_the_muslim/presentation/counter/counter_page.dart';
import 'package:fortress_of_the_muslim/presentation/settings/app_settings_page.dart';
import 'package:fortress_of_the_muslim/presentation/supplications/bookmarks/main_supplication_bookmarks_page.dart';
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
      case '/bookmark_supplications_page':
        return MaterialPageRoute(
          builder: (_) => const MainSupplicationBookmarksPage(),
        );
      case '/counter_page':
        return MaterialPageRoute(
          builder: (_) => const CounterPage(),
        );
      case '/chapter_content_page':
        final MainChapterArguments mainChapterArguments =
            routeSettings.arguments as MainChapterArguments;
        return MaterialPageRoute(
          builder: (_) => ChapterContentPage(
            chapterId: mainChapterArguments.chapterId,
          ),
        );
      case '/app_settings_page':
        return MaterialPageRoute(
          builder: (_) => const AppSettingsPage(),
        );
      case '/book_content_list_page':
        return MaterialPageRoute(
          builder: (_) => const BookContentListPage(),
        );
      case '/book_content_page':
        final BookContentArguments bookContentArguments =
            routeSettings.arguments as BookContentArguments;
        return MaterialPageRoute(
          builder: (_) => BookContentPage(
            index: bookContentArguments.index,
            title: bookContentArguments.title,
          ),
        );
      case '/footnote_page':
        return MaterialPageRoute(
          builder: (_) => const FootnotePage(),
        );
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
