import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fortress_of_the_muslim/presentation/states/collections_state.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/main_error_text_data.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/name_routes.dart';
import '../../../data/models/arguments/collection_args.dart';
import '../../../domain/entities/collection_entity.dart';
import '../lists/collection_supplications_list.dart';

class CollectionDetailPage extends StatelessWidget {
  const CollectionDetailPage({
    super.key,
    required this.collectionModel,
  });

  final CollectionEntity collectionModel;

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(collectionModel.collectionTitle),
        actions: [
          FutureBuilder<CollectionEntity>(
            future: Provider.of<CollectionsState>(context).fetchCollectionById(collectionId: collectionModel.collectionId),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return MainErrorTextData(errorText: snapshot.error.toString());
              }
              if (snapshot.hasData) {
                final CollectionEntity futureCollectionModel = snapshot.data!;
                return IconButton.filledTonal(
                  tooltip: appLocale.add,
                  onPressed: () async {
                    await Navigator.pushNamed(
                      context,
                      NameRoutes.addSupplicationsCollectionPage,
                      arguments: CollectionArgs(collectionModel: futureCollectionModel),
                    );
                  },
                  icon: const Icon(Icons.add),
                );
              }
              return const CircularProgressIndicator.adaptive();
            }
          ),
        ],
      ),
      body: CollectionSupplicationsList(
        tableName: appLocale.supplicationsTableName,
        collectionId: collectionModel.collectionId,
      ),
    );
  }
}
