import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../states/main_supplications_state.dart';

class FavoriteSupplicationButton extends StatelessWidget {
  const FavoriteSupplicationButton({
    super.key,
    required this.supplicationId,
  });

  final int supplicationId;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final bool supplicationIsFavorite = Provider.of<MainSupplicationsState>(context).supplicationIsFavorite(supplicationId);
    return IconButton(
      onPressed: () {
        Provider.of<MainSupplicationsState>(context, listen: false).toggleSupplicationFavorite(supplicationId: supplicationId);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: appColors.secondaryContainer,
            duration: const Duration(milliseconds: 750),
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
    );
  }
}
