import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fortress_of_the_muslim/presentation/states/collection_supplications_state.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/db_values.dart';
import '../../../core/styles/app_styles.dart';
import '../../states/collections_state.dart';
import '../../states/main_collections_state.dart';
import '../../states/main_supplications_state.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/supplication_item.dart';

class AddSupplicationsCollection extends StatelessWidget {
  const AddSupplicationsCollection({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CollectionSupplicationsState([1, 2, 3]))
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocale.selectSupplications),
          actions: [
            Consumer<CollectionSupplicationsState>(
              builder: (context, collectionSupplicationsState, child) {
                return collectionSupplicationsState.collectionSupplicationIds.isNotEmpty ? IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    final Map<String, Object> mapCollection = {
                      DBValues.dbCollectionSupplicationIds: collectionSupplicationsState.collectionSupplicationIds,
                    };
                    Provider.of<CollectionsState>(context, listen: false).updateCollection(mapCollection: mapCollection, collectionId: Provider.of<MainCollectionsState>(context, listen: false).getCurrentCollectionId);
                  },
                  icon: const Icon(Icons.check_circle),
                ) : const SizedBox();
              },
            ),
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<MainSupplicationsState>(context, listen: false).fetchAllSupplications(tableName: appLocale.supplicationsTableName),
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
