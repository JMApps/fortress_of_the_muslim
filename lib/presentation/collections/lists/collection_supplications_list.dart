import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/collection_entity.dart';
import '../../../domain/entities/supplication_entity.dart';
import '../../../l10n/app_localizations.dart';
import '../../states/collections_state.dart';
import '../../states/main_supplications_state.dart';
import '../../supplications/items/main_supplication_item.dart';
import '../../widgets/main_error_text_data.dart';
import '../widgets/collection_is_empty.dart';

class CollectionSupplicationsList extends StatelessWidget {
  const CollectionSupplicationsList({
    super.key,
    required this.tableName,
    required this.collectionId,
  });

  final String tableName;
  final int collectionId;

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return FutureBuilder<CollectionEntity>(
      future: Provider.of<CollectionsState>(context, listen: false).fetchCollectionById(collectionId: collectionId),
      builder: (context, collectionSnapshot) {
        if (collectionSnapshot.hasError) {
          return MainErrorTextData(errorText: collectionSnapshot.error.toString());
        }
        if (collectionSnapshot.hasData) {
          final List<int>? collectionSupplicationIds = collectionSnapshot.data!.collectionSupplicationIds;
          return FutureBuilder<List<SupplicationEntity>>(
            future: Provider.of<MainSupplicationsState>(context, listen: false).getFavoriteSupplications(
              tableName: tableName,
              ids: collectionSupplicationIds ?? <int>[],
            ),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return MainErrorTextData(errorText: snapshot.error.toString());
              }
              if (snapshot.hasData && snapshot.data!.isEmpty) {
                return CollectionIsEmpty(
                  text: appLocale.collectionSupplicationsIsEmpty,
                  color: Theme.of(context).colorScheme.primary,
                );
              }
              if (snapshot.hasData) {
                return Scrollbar(
                  child: ListView.builder(
                    padding: AppStyles.paddingWithoutBottomMini,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final supplicationModel = snapshot.data![index];
                      return MainSupplicationItem(
                        supplicationModel: supplicationModel,
                        supplicationIndex: index + 1,
                        supplicationLength: snapshot.data!.length,
                      );
                    },
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            },
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }
}