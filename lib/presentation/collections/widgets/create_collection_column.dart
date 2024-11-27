import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/db_values.dart';
import '../../../core/styles/app_styles.dart';
import '../../states/collections_state.dart';

class CreateCollectionColumn extends StatefulWidget {
  const CreateCollectionColumn({super.key});

  @override
  State<CreateCollectionColumn> createState() => _CreateCollectionColumnState();
}

class _CreateCollectionColumnState extends State<CreateCollectionColumn> {
  final TextEditingController _collectionTitleController = TextEditingController();
  final TextEditingController _collectionDescriptionController = TextEditingController();

  @override
  void dispose() {
    _collectionTitleController.dispose();
    _collectionDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      padding: AppStyles.paddingWithoutTop,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _collectionTitleController,
            autofocus: true,
            textCapitalization: TextCapitalization.sentences,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: appLocale.enterTitle,
              helperText: appLocale.title,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _collectionDescriptionController,
            textCapitalization: TextCapitalization.sentences,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: appLocale.enterDescription,
              helperText: appLocale.description,
            ),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () {
              if (_collectionTitleController.text.isNotEmpty) {
                Navigator.pop(context);
                final Map<String, Object?> mapCollection = {
                  DBValues.dbCollectionTitle: _collectionTitleController.text.trim(),
                  DBValues.dbCollectionDescription: _collectionDescriptionController.text.trim(),
                  DBValues.dbCollectionSupplicationIds: null,
                };
                Provider.of<CollectionsState>(context, listen: false).createCollection(mapCollection: mapCollection);
              }
            },
            child: Text(
              appLocale.add,
              style: AppStyles.mainTextStyle17,
            ),
          ),
        ],
      ),
    );
  }
}
