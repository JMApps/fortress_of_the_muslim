import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/collection_entity.dart';
import '../../../l10n/app_localizations.dart';
import '../../states/collections_state.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/collection_item.dart';
import '../widgets/collection_is_empty.dart';

class CollectionsList extends StatelessWidget {
  const CollectionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Consumer<CollectionsState>(
      builder: (context, collectionsState, _) {
        return FutureBuilder<List<CollectionEntity>>(
          future: collectionsState.fetchAllCollections(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return MainErrorTextData(errorText: snapshot.error.toString());
            }
            if (snapshot.hasData && snapshot.data!.isEmpty) {
              return CollectionIsEmpty(
                text: appLocale.collectionIsEmpty,
                color: appColors.primary,
              );
            }
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return Scrollbar(
                child: ListView.builder(
                  padding: AppStyles.paddingWithoutBottomMini,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final CollectionEntity collectionModel = snapshot.data![index];
                    return CollectionItem(
                      model: collectionModel,
                      index: index,
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
      },
    );
  }
}
