import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/routes/name_routes.dart';
import '../lists/collection_supplications_list.dart';

class CollectionDetailPage extends StatelessWidget {
  const CollectionDetailPage({
    super.key,
    required this.collectionTitle,
  });

  final String collectionTitle;

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(collectionTitle),
      ),
      body: CollectionSupplicationsList(
        tableName: appLocale.supplicationsTableName,
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: collectionTitle,
        elevation: 0,
        tooltip: appLocale.add,
        onPressed: () async {
          await Navigator.pushNamed(
            context,
            NameRoutes.addSupplicationsCollectionPage,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
