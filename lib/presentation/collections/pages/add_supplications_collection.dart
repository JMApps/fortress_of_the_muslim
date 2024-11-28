import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/db_values.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/collection_entity.dart';
import '../../states/collection_supplications_state.dart';
import '../../states/collections_state.dart';
import '../../states/main_supplications_state.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/supplication_item.dart';

class AddSupplicationsCollection extends StatelessWidget {
  const AddSupplicationsCollection({
    super.key,
    required this.collectionModel,
  });

  final CollectionEntity collectionModel;

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return ChangeNotifierProvider(
      create: (_) => CollectionSupplicationsState(
        collectionModel.collectionSupplicationIds ?? <int>[],
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocale.selectSupplications),
          actions: [
            Consumer<CollectionSupplicationsState>(
              builder: (context, collectionSupplicationsState, child) {
                if (!listEquals(collectionSupplicationsState.collectionSupplicationIds, collectionModel.collectionSupplicationIds)) {
                  return IconButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                      final Map<String, Object> mapCollection = {
                        DBValues.dbCollectionSupplicationIds: jsonEncode(collectionSupplicationsState.collectionSupplicationIds),
                      };
                      await Provider.of<CollectionsState>(context, listen: false).updateCollection(
                        mapCollection: mapCollection,
                        collectionId: collectionModel.collectionId,
                      );
                    },
                    icon: const Icon(Icons.check_circle),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<MainSupplicationsState>(context, listen: false).fetchAllSupplications(
            tableName: appLocale.supplicationsTableName,
          ),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return MainErrorTextData(errorText: snapshot.error.toString());
            }
            if (snapshot.hasData) {
              return Scrollbar(
                child: ListView.builder(
                  padding: AppStyles.paddingWithoutBottomMini,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final supplicationModel = snapshot.data![index];
                    return SupplicationItem(
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
        ),
      ),
    );
  }
}
