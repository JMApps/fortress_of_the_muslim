import 'package:flutter/material.dart';

import '../../presentation/chapters/pages/favorite_chapter_page.dart';
import '../../presentation/chapters/pages/main_chapter_page.dart';
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
      default:
        throw Exception('Invalid route');
    }
  }
}
