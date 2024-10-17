import 'package:flutter/material.dart';

import '../../data/models/arguments/chapter_id_args.dart';
import '../../presentation/chapters/pages/favorite_chapter_page.dart';
import '../../presentation/chapters/pages/main_chapter_page.dart';
import '../../presentation/content/pages/chapter_content_page.dart';
import '../../presentation/counter/pages/app_counter_page.dart';
import '../../presentation/settings/pages/app_settings_page.dart';
import '../../presentation/settings/pages/content_settings_page.dart';
import '../../presentation/supplications/pages/favorite_supplication_page.dart';
import '../../presentation/supplications/pages/main_supplication_page.dart';
import 'name_routes.dart';

class AppRoutes {
  static Route onRouteGenerator(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case NameRoutes.allChaptersPage:
        return MaterialPageRoute(
          builder: (_) => const MainChapterPage(),
        );
      case NameRoutes.favoriteChaptersPage:
        return MaterialPageRoute(
          builder: (_) => const FavoriteChapterPage(),
        );
      case NameRoutes.chapterContentPage:
        final ChapterIdArgs chapterIdArgs = routeSettings.arguments as ChapterIdArgs;
        return MaterialPageRoute(
          builder: (_) => ChapterContentPage(chapterId: chapterIdArgs.chapterId),
        );
      case NameRoutes.settingsContentPage:
        return MaterialPageRoute(
          builder: (_) => ContentSettingsPage(),
        );
      case NameRoutes.allSupplicationsPage:
        return MaterialPageRoute(
          builder: (_) => const MainSupplicationPage(),
        );
      case NameRoutes.favoriteSupplicationsPage:
        return MaterialPageRoute(
          builder: (_) => const FavoriteSupplicationPage(),
        );
      case NameRoutes.appCounterPage:
        return MaterialPageRoute(
          builder: (_) => const AppCounterPage(),
        );
      case NameRoutes.appSettingsPage:
        return MaterialPageRoute(
          builder: (_) => const AppSettingsPage(),
        );
      default:
        throw Exception('Invalid route');
    }
  }
}
