import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/strings/app_strings.dart';
import '../../core/styles/app_styles.dart';
import '../../domain/entities/supplication_entity.dart';
import '../states/main_supplications_state.dart';

class SupplicationMediaCard extends StatelessWidget {
  const SupplicationMediaCard({
    super.key,
    required this.supplicationModel,
  });

  final SupplicationEntity supplicationModel;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final bool supplicationIsFavorite = Provider.of<MainSupplicationsState>(context).supplicationIsFavorite(supplicationModel.supplicationId);
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: AppStyles.shape,
      color: appColors.onSecondary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: AppStyles.paddingHorVerMicro,
            decoration: BoxDecoration(
              color: appColors.secondaryContainer,
              borderRadius: AppStyles.borderMini,
            ),
            child: Text(
              supplicationModel.supplicationId.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: AppStrings.fontMontserrat,
              ),
            ),
          ),
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
          IconButton(
            onPressed: () {
              Provider.of<MainSupplicationsState>(context, listen: false).toggleSupplicationFavorite(supplicationId: supplicationModel.supplicationId);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: appColors.secondaryContainer,
                  duration: const Duration(milliseconds: 750),
                  behavior: SnackBarBehavior.floating,
                  margin: AppStyles.paddingMini,
                  shape: AppStyles.shape,
                  elevation: 0,
                  content: Text(
                    supplicationIsFavorite ? AppStrings.removed : AppStrings.added,
                    style: TextStyle(
                      fontSize: 17.0,
                      color: appColors.onSurface,
                    ),
                  ),
                ),
              );
            },
            icon: Icon(
              supplicationIsFavorite ? Icons.bookmark : Icons.bookmark_outline_outlined,
              color: appColors.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.ios_share_outlined),
          ),
        ],
      ),
    );
  }
}
