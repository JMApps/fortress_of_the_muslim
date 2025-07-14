import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../l10n/app_localizations.dart';
import '../../states/main_supplications_state.dart';

class FavoriteSupplicationButton extends StatelessWidget {
  const FavoriteSupplicationButton({
    super.key,
    required this.supplicationId,
  });

  final int supplicationId;

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Consumer<MainSupplicationsState>(
      builder: (context, mainSupplicationsState, _) {
        final bool supplicationIsFavorite = mainSupplicationsState.supplicationIsFavorite(supplicationId: supplicationId);
        return IconButton(
          onPressed: () {
            mainSupplicationsState.toggleSupplicationFavorite(supplicationId: supplicationId);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: appColors.secondaryContainer,
                duration: const Duration(milliseconds: 500),
                shape: AppStyles.shape,
                elevation: 0,
                content: Text(
                  supplicationIsFavorite ? appLocale.removed : appLocale.added,
                  style: TextStyle(
                    fontSize: 17.0,
                    color: appColors.onSurface,
                  ),
                ),
              ),
            );
          },
          icon: Icon(
            supplicationIsFavorite ? CupertinoIcons.bookmark_fill : CupertinoIcons.bookmark,
            color: appColors.tertiary,
          ),
        );
      },
    );
  }
}
