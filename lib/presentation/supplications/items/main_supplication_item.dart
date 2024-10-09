import 'package:flutter/material.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/supplication_entity.dart';
import '../../widgets/main_html_data.dart';
import '../../widgets/supplication_media_card.dart';

class MainSupplicationItem extends StatelessWidget {
  const MainSupplicationItem({
    super.key,
    required this.supplicationModel,
    required this.supplicationIndex,
  });

  final SupplicationEntity supplicationModel;
  final int supplicationIndex;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final arabicShowState = supplicationModel.arabicText != null;
    final transcriptionShowState = supplicationModel.transcriptionText != null;
    return Card(
      elevation: 0,
      shape: AppStyles.shape,
      margin: AppStyles.paddingBottom,
      child: Padding(
        padding: AppStyles.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            arabicShowState ? Text(
              supplicationModel.arabicText!,
              style: const TextStyle(
                fontSize: 25,
                fontFamily: AppStrings.fontHafs,
                height: 1.75,
              ),
              textDirection: TextDirection.rtl,
            ) : const SizedBox(),
            SizedBox(height: arabicShowState ? 16 : 0),
            transcriptionShowState ? Text(
              supplicationModel.transcriptionText!,
              style: TextStyle(
                fontSize: 18.0,
                color: appColors.secondary,
              ),
            ) : const SizedBox(),
            SizedBox(height: transcriptionShowState ? 16 : 0),
            MainHtmlData(
              htmlData: supplicationModel.translationText,
              footnoteColor: Colors.red,
              fontSize: 18.0,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 16),
            SupplicationMediaCard(supplicationModel: supplicationModel),
          ],
        ),
      ),
    );
  }
}
