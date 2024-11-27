import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/supplication_entity.dart';
import '../../states/collection_supplications_state.dart';

class SupplicationItem extends StatelessWidget {
  const SupplicationItem({
    super.key,
    required this.supplicationModel,
    required this.supplicationIndex,
    required this.supplicationLength,
  });

  final SupplicationEntity supplicationModel;
  final int supplicationIndex;
  final int supplicationLength;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final itemOddColor = appColors.inversePrimary.withOpacity(0.075);
    final itemEvenColor = appColors.inversePrimary.withOpacity(0.150);
    return Padding(
      padding: AppStyles.paddingBottomMini,
      child: Consumer<CollectionSupplicationsState>(
        builder: (context, collectionSupplicationsState, _) {
          return ListTile(
            tileColor: supplicationIndex.isOdd ? itemOddColor : itemEvenColor,
            shape: AppStyles.shape,
            leading: Checkbox(
              value: collectionSupplicationsState.supplicationIsCollection(supplicationId: supplicationModel.supplicationId),
              onChanged: (bool? onChanged) {
                if (onChanged == true) {
                  collectionSupplicationsState.addAllToCollection([supplicationModel.supplicationId]);
                } else {
                  collectionSupplicationsState.removeFromCollection(supplicationId: supplicationModel.supplicationId);
                }
              },
            ),
            title: supplicationModel.arabicText != null ? Text(
              supplicationModel.arabicText!.trim(),
              style: const TextStyle(
                fontSize: 18.0,
                fontFamily: 'Hafs',
              ),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ) : null,
            subtitle: Html(
              data: supplicationModel.translationText.trim(),
              style: {
                '#': Style(
                  fontSize: FontSize(16.0),
                  textAlign: TextAlign.center,
                ),
              },
            ),
          );
        },
      ),
    );
  }
}
