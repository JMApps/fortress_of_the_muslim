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
  static Route<dynamic> onRouteGenerator(RouteSettings routeSettings) {
    final builder = routes[routeSettings.name];

    if (builder != null) {
      return MaterialPageRoute(
        builder: (context) {
          return builder(context, routeSettings.arguments);
        },
      );
    }

    throw Exception('Invalid route');
  }

  static Map<String, Widget Function(BuildContext, dynamic)> routes = {
    NameRoutes.allChaptersPage: (context, args) => const MainChapterPage(),
    NameRoutes.favoriteChaptersPage: (context, args) => const FavoriteChapterPage(),
    NameRoutes.chapterContentPage: (context, args) {
      final ChapterIdArgs chapterIdArgs = args as ChapterIdArgs;
      return ChapterContentPage(chapterId: chapterIdArgs.chapterId);
    },
    NameRoutes.settingsContentPage: (context, args) => const ContentSettingsPage(),
    NameRoutes.allSupplicationsPage: (context, args) => const MainSupplicationPage(),
    NameRoutes.favoriteSupplicationsPage: (context, args) => const FavoriteSupplicationPage(),
    NameRoutes.appCounterPage: (context, args) => const AppCounterPage(),
    NameRoutes.appSettingsPage: (context, args) => const AppSettingsPage(),
  };
}
