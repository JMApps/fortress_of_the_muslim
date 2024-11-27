import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'create_collection_column.dart';

class FabCreateCollection extends StatelessWidget {
  const FabCreateCollection({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets,
            duration: const Duration(milliseconds: 250),
            curve: Curves.decelerate,
            child: const CreateCollectionColumn(),
          ),
        );
      },
      elevation: 0,
      heroTag: key.hashCode,
      tooltip: appLocale.createCollection,
      child: const Icon(Icons.add),
    );
  }
}
