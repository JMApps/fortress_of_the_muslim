import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'create_collection_column.dart';

class CreateCollectionButton extends StatelessWidget {
  const CreateCollectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return IconButton.filledTonal(
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
      tooltip: appLocale.createCollection,
      icon: const Icon(Icons.add),
    );
  }
}
