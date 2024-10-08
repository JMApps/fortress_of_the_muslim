import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'core/strings/app_constraints.dart';
import 'data/repositories/chapter_data_repository.dart';
import 'data/repositories/footnote_data_repository.dart';
import 'data/services/database_service.dart';
import 'domain/usecases/chapter_use_case.dart';
import 'domain/usecases/footnote_use_case.dart';
import 'presentation/pages/root_page.dart';
import 'presentation/states/footnotes_state.dart';
import 'presentation/states/main_chapters_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(AppConstraints.keyMainSettingsBox);

  final DatabaseService databaseService = DatabaseService();
  await databaseService.initializeDatabase();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainChaptersState(
            ChapterUseCase(
              ChapterDataRepository(databaseService),
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
      ],
      child: const RootPage(),
    ),
  );
}
