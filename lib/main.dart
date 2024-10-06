import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/repositories/chapter_data_repository.dart';
import 'data/repositories/footnote_data_repository.dart';
import 'data/services/database_service.dart';
import 'data/states/footnotes_state.dart';
import 'data/states/main_chapters_state.dart';
import 'domain/usecases/chapter_use_case.dart';
import 'domain/usecases/footnote_use_case.dart';
import 'presentation/pages/root_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
