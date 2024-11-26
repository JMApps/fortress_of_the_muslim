import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/collection_entity.dart';

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
    final appColors = Theme.of(context).colorScheme;
    final itemOddColor = appColors.inversePrimary.withOpacity(0.075);
    final itemEvenColor = appColors.inversePrimary.withOpacity(0.150);
    return Padding(
      padding: AppStyles.paddingBottomMini,
      child: ListTile(
        onTap: () async {
          HapticFeedback.lightImpact();
          // To collection detail page
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
