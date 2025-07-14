import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../lists/collections_list.dart';
import '../widgets/create_collection_button.dart';

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({super.key});

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocale.collections),
        actions: const [
          CreateCollectionButton(),
        ],
      ),
      body: const CollectionsList(),
    );
  }
}
