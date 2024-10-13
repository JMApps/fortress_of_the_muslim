import 'package:flutter/material.dart';

import '../../core/strings/app_strings.dart';
import '../../core/styles/app_styles.dart';
import '../../domain/entities/supplication_entity.dart';
import '../supplications/widgets/favorite_supplication_button.dart';
import '../supplications/widgets/share_supplication_button.dart';

class SupplicationMediaCard extends StatefulWidget {
  const SupplicationMediaCard({
    super.key,
    required this.supplicationModel,
  });

  final SupplicationEntity supplicationModel;

  @override
  State<SupplicationMediaCard> createState() => _SupplicationMediaCardState();
}

class _SupplicationMediaCardState extends State<SupplicationMediaCard> {
  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: AppStyles.shape,
      color: appColors.onSecondary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              // Play audio
            },
            icon: const Icon(Icons.play_circle_outline_rounded),
          ),
          IconButton(
            onPressed: () {
              // Save repeat state
            },
            icon: const Icon(Icons.repeat),
          ),
          IconButton(
            onPressed: () {
              // Save speed index
            },
            icon: const Icon(Icons.speed_rounded),
          ),
          FavoriteSupplicationButton(supplicationId: widget.supplicationModel.supplicationId),
          ShareSupplicationButton(dataSupplication: 'Test supplication text'),
          Container(
            padding: AppStyles.paddingHorVerMicro,
            decoration: BoxDecoration(
              color: appColors.secondaryContainer,
              borderRadius: AppStyles.borderMini,
            ),
            child: Text(
              widget.supplicationModel.supplicationId.toString(),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: AppStrings.fontMontserrat,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
