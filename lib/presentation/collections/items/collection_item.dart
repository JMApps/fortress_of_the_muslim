import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/name_routes.dart';
import '../../../core/styles/app_styles.dart';
import '../../../data/models/arguments/collection_args.dart';
import '../../../domain/entities/collection_entity.dart';
import '../../states/collections_state.dart';
import '../widgets/update_collection_column.dart';

class CollectionItem extends StatelessWidget {
  const CollectionItem({
    super.key,
    required this.model,
    required this.index,
  });

  final CollectionEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    final itemOddColor = appColors.inversePrimary.withOpacity(0.075);
    final itemEvenColor = appColors.inversePrimary.withOpacity(0.150);
    return Padding(
      padding: AppStyles.paddingBottomMini,
      child: ListTile(
        onTap: () async {
          HapticFeedback.lightImpact();
          await Navigator.pushNamed(
            context,
            NameRoutes.collectionDetailPage,
            arguments: CollectionArgs(collectionModel: model),
          );
        },
        onLongPress: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              padding: AppStyles.paddingWithoutTop,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FilledButton.tonal(
                    onPressed: () async {
                      Navigator.pop(context);
                      await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) => AnimatedPadding(
                          padding: MediaQuery.of(context).viewInsets,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.decelerate,
                          child: UpdateCollectionColumn(
                            collectionModel: model,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      appLocale.change,
                      style: AppStyles.mainTextStyle17,
                    ),
                  ),
                  FilledButton.tonal(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => SingleChildScrollView(
                          padding: AppStyles.paddingWithoutTop,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              FilledButton.tonal(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Provider.of<CollectionsState>(context, listen: false).deleteCollection(collectionId: model.collectionId);
                                },
                                child: Text(
                                  appLocale.delete,
                                  style: AppStyles.mainTextStyle17,
                                ),
                              ),
                              FilledButton.tonal(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  appLocale.cancel,
                                  style: AppStyles.mainTextStyle17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Text(
                      appLocale.delete,
                      style: AppStyles.mainTextStyle17,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        splashColor: appColors.inversePrimary.withOpacity(0.5),
        tileColor: index.isOdd ? itemOddColor : itemEvenColor,
        shape: AppStyles.shape,
        title: Text(
          model.collectionTitle,
          style: TextStyle(
            color: appColors.primary,
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: model.collectionDescription!.isNotEmpty ? Text(
          model.collectionDescription!,
          style: AppStyles.mainTextStyle17,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ) : null,
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: appColors.secondary,
        ),
      ),
    );
  }
}
