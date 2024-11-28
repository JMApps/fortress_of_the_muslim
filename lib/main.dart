import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'core/strings/app_constraints.dart';
import 'data/repositories/chapter_data_repository.dart';
import 'data/repositories/collection_data_repository.dart';
import 'data/repositories/footnote_data_repository.dart';
import 'data/repositories/supplication_data_repository.dart';
import 'data/services/collections_database_service.dart';
import 'data/services/database_service.dart';
import 'data/services/notification/notification_service.dart';
import 'domain/usecases/chapter_use_case.dart';
import 'domain/usecases/collection_use_case.dart';
import 'domain/usecases/footnote_use_case.dart';
import 'domain/usecases/supplication_use_case.dart';
import 'presentation/pages/root_page.dart';
import 'presentation/states/app_player_state.dart';
import 'presentation/states/app_settings_state.dart';
import 'presentation/states/collections_state.dart';
import 'presentation/states/content_settings_state.dart';
import 'presentation/states/footnotes_state.dart';
import 'presentation/states/main_chapters_state.dart';
import 'presentation/states/main_supplications_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(AppConstraints.keyMainSettingsBox);
  await Hive.openBox(AppConstraints.keyCounterBox);
  await Hive.openBox(AppConstraints.keyContentSettingsBox);

  await NotificationService().setupNotification();

  final DatabaseService databaseService = DatabaseService();
  await databaseService.initializeDatabase();

  final CollectionsDatabaseService collectionsDatabaseService = CollectionsDatabaseService();
  await collectionsDatabaseService.initializeDatabase();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppSettingsState(),
        ),
        ChangeNotifierProvider(
          create: (_) => MainChaptersState(
            ChapterUseCase(
              ChapterDataRepository(databaseService),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => CollectionsState(
            CollectionUseCase(
              CollectionDataRepository(collectionsDatabaseService),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => MainSupplicationsState(
            SupplicationUseCase(
              SupplicationDataRepository(databaseService),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => FootnotesState(
            FootnoteUseCase(
              FootnoteDataRepository(databaseService),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ContentSettingsState(),
        ),
        ChangeNotifierProvider(
          create: (_) => AppPlayerState(),
        ),
      ],
      child: const RootPage(),
    ),
  );
}
