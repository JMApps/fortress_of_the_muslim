import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/db_values.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/collection_entity.dart';
import '../../../domain/entities/supplication_entity.dart';
import '../../../l10n/app_localizations.dart';
import '../../states/collection_supplications_state.dart';
import '../../states/collections_state.dart';
import '../../states/main_supplications_state.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/supplication_item.dart';

class AddSupplicationsCollection extends StatefulWidget {
  const AddSupplicationsCollection({
    super.key,
    required this.collectionModel,
    required this.supplicationTableName,
  });

  final CollectionEntity collectionModel;
  final String supplicationTableName;

  @override
  State<AddSupplicationsCollection> createState() => _AddSupplicationsCollectionState();
}

class _AddSupplicationsCollectionState extends State<AddSupplicationsCollection> {
  late final Future<List<SupplicationEntity>> _futureSupplications;

  @override
  void initState() {
    super.initState();
    _futureSupplications = Provider.of<MainSupplicationsState>(context, listen: false).fetchAllSupplications(tableName: widget.supplicationTableName);
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return ChangeNotifierProvider(
      create: (_) => CollectionSupplicationsState(
        widget.collectionModel.collectionSupplicationIds ?? <int>[],
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocale.selectSupplications),
          actions: [
            Consumer<CollectionSupplicationsState>(
              builder: (context, collectionSupplicationsState, child) {
                if (!listEquals(collectionSupplicationsState.collectionSupplicationIds, widget.collectionModel.collectionSupplicationIds)) {
                  return IconButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                      final Map<String, Object> mapCollection = {
                        DBValues.dbCollectionSupplicationIds: jsonEncode(collectionSupplicationsState.collectionSupplicationIds),
                      };
                      await Provider.of<CollectionsState>(context, listen: false).updateCollection(
                        mapCollection: mapCollection,
                        collectionId: widget.collectionModel.collectionId,
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
          future: _futureSupplications,
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
