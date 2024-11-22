import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/book_content_data_repository.dart';
import '../../../data/services/database_service.dart';
import '../../../domain/usecases/book_content_use_case.dart';
import '../../states/book_content_state.dart';
import '../lists/book_content_list.dart';

class BookContentPage extends StatelessWidget {
  const BookContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BookContentState(
            BookContentUseCase(
              BookContentDataRepository(
                DatabaseService(),
              ),
            ),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocale.bookContent),
        ),
        body: const BookContentList(),
      ),
    );
  }
}
