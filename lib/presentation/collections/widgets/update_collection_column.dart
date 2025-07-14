import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/db_values.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/collection_entity.dart';
import '../../../l10n/app_localizations.dart';
import '../../states/collections_state.dart';

class UpdateCollectionColumn extends StatefulWidget {
  const UpdateCollectionColumn({
    super.key,
    required this.collectionModel,
  });

  final CollectionEntity collectionModel;

  @override
  State<UpdateCollectionColumn> createState() => _UpdateCollectionColumnState();
}

class _UpdateCollectionColumnState extends State<UpdateCollectionColumn> {
  late final TextEditingController _collectionTitleController;
  late final TextEditingController _collectionDescriptionController;

  @override
  void initState() {
    super.initState();
    _collectionTitleController = TextEditingController(text: widget.collectionModel.collectionTitle);
    _collectionDescriptionController = TextEditingController(text: widget.collectionModel.collectionDescription);
  }

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
            onPressed: () async {
              if (_collectionTitleController.text.trim().isNotEmpty) {
                if (widget.collectionModel.collectionTitle != _collectionTitleController.text.trim() ||
                    widget.collectionModel.collectionDescription != _collectionDescriptionController.text.trim()) {
                  Navigator.pop(context);
                  final Map<String, Object?> mapCollection = {
                    DBValues.dbCollectionTitle: _collectionTitleController.text.trim(),
                    DBValues.dbCollectionDescription: _collectionDescriptionController.text.trim(),
                  };
                  await Provider.of<CollectionsState>(context, listen: false).updateCollection(
                      mapCollection: mapCollection,
                      collectionId: widget.collectionModel.collectionId,
                  );
                } else {
                  Navigator.pop(context);
                }
              }
            },
            child: Text(
              appLocale.change,
              style: AppStyles.mainTextStyle17,
            ),
          ),
        ],
      ),
    );
  }
}
