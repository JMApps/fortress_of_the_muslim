import 'package:flutter/material.dart';

import '../../data/models/arguments/chapter_model_args.dart';
import '../../presentation/chapters/pages/favorite_chapter_page.dart';
import '../../presentation/chapters/pages/main_chapter_page.dart';
import '../../presentation/content/pages/chapter_content_page.dart';
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
      case NameRoutes.allSupplicationsPage:
        return MaterialPageRoute(
          builder: (_) => const MainSupplicationPage(),
        );
      case NameRoutes.favoriteSupplicationsPage:
        return MaterialPageRoute(
          builder: (_) => const FavoriteSupplicationPage(),
        );
      case NameRoutes.chapterContentPage:
        final ChapterModelArgs chapterModelArgs = routeSettings.arguments as ChapterModelArgs;
        return MaterialPageRoute(
          builder: (_) => ChapterContentPage(chapterModel: chapterModelArgs.chapterModel),
        );
      default:
        throw Exception('Invalid route');
    }
  }
}
