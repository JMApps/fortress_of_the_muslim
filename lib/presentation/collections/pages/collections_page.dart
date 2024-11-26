import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/collection_data_repository.dart';
import '../../../data/services/collections_database_service.dart';
import '../../../domain/usecases/collection_use_case.dart';
import '../../states/collections_state.dart';
import '../lists/collections_list.dart';
import '../widgets/fab_create_collection.dart';

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({super.key});

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  final CollectionsDatabaseService collectionsDatabaseService = CollectionsDatabaseService();

  @override
  void initState() {
    super.initState();
    initDB();
  }

  void initDB() async {
    await collectionsDatabaseService.initializeDatabase();
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CollectionsState(
            CollectionUseCase(
              CollectionDataRepository(collectionsDatabaseService),
            ),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocale.collections),
        ),
        body: const CollectionsList(),
        floatingActionButton: const FabCreateCollection(),
      ),
    );
  }
}
