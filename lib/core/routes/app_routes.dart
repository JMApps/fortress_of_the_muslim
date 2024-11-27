import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/presentation/collections/pages/add_supplications_collection.dart';
import 'package:fortress_of_the_muslim/presentation/collections/pages/collections_page.dart';

import '../../data/models/arguments/book_content_args.dart';
import '../../data/models/arguments/chapter_id_args.dart';
import '../../data/models/arguments/collection_args.dart';
import '../../data/models/arguments/supplication_args.dart';
import '../../presentation/book/pages/book_content_detail_page.dart';
import '../../presentation/book/pages/book_content_page.dart';
import '../../presentation/chapters/pages/favorite_chapter_page.dart';
import '../../presentation/chapters/pages/main_chapter_page.dart';
import '../../presentation/collections/pages/collection_detail_page.dart';
import '../../presentation/content/pages/chapter_content_page.dart';
import '../../presentation/counter/pages/app_counter_page.dart';
import '../../presentation/edit_supplication_item.dart';
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
    NameRoutes.favoriteChaptersPage: (context, args) =>     const FavoriteChapterPage(),
    NameRoutes.collectionsPage: (context, args) => const CollectionsPage(),
    NameRoutes.collectionDetailPage: (context, args) {
      final CollectionArgs collectionArgs = args;
      return CollectionDetailPage(
        collectionTitle: collectionArgs.collectionTitle,
      );
    },
    NameRoutes.addSupplicationsCollectionPage: (context, args) => const AddSupplicationsCollection(),
    NameRoutes.chapterContentPage: (context, args) {
      final ChapterIdArgs chapterIdArgs = args;
      return ChapterContentPage(
        chapterId: chapterIdArgs.chapterId,
        chaptersTableName: chapterIdArgs.chaptersTableName,
        supplicationsTableName: chapterIdArgs.supplicationsTableName,
      );
    },
    NameRoutes.settingsContentPage: (context, args) => const ContentSettingsPage(),
    NameRoutes.allSupplicationsPage: (context, args) => const MainSupplicationPage(),
    NameRoutes.favoriteSupplicationsPage: (context, args) => const FavoriteSupplicationPage(),
    NameRoutes.appCounterPage: (context, args) => const AppCounterPage(),
    NameRoutes.appSettingsPage: (context, args) => const AppSettingsPage(),
    NameRoutes.bookContentPage: (context, args) => const BookContentPage(),
    NameRoutes.bookContentDetailPage: (context, args) {
      final BookContentArgs bookContentArgs = args;
      return BookContentDetailPage(bookModel: bookContentArgs.bookModel);
    },
    NameRoutes.editSupplicationItem: (context, args) {
      final SupplicationArgs supplicationArgs = args;
      return EditSupplicationItem(supplicationModel: supplicationArgs.supplicationModel);
    },
  };
}
