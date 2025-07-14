import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/name_routes.dart';
import '../../../data/models/arguments/collection_args.dart';
import '../../../domain/entities/collection_entity.dart';
import '../../../l10n/app_localizations.dart';
import '../../states/app_player_state.dart';
import '../../states/collections_state.dart';
import '../../widgets/main_error_text_data.dart';
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
        leading: IconButton(
          onPressed: () {
            Provider.of<AppPlayerState>(context, listen: false).stopTrack();
            Navigator.of(context).pop();
          },
          tooltip: appLocale.back,
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
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
                    Provider.of<AppPlayerState>(context, listen: false).stopTrack();
                    await Navigator.pushNamed(
                      context,
                      NameRoutes.addSupplicationsCollectionPage,
                      arguments: CollectionArgs(
                        collectionModel: futureCollectionModel,
                        supplicationTableName: appLocale.supplicationsTableName,
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                );
              }
              return const CircularProgressIndicator.adaptive();
            }
          ),
          IconButton(
            onPressed: () {
              Provider.of<AppPlayerState>(context, listen: false).stopTrack();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.exit_to_app_rounded),
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
