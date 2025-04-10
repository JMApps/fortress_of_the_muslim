import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../core/routes/name_routes.dart';
import '../../core/styles/app_styles.dart';
import '../states/app_settings_state.dart';
import 'main_item_container.dart';

class MainFour extends StatelessWidget {
  const MainFour({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final themeIsDark = Theme.of(context).brightness == Brightness.dark;
    final appColors = Theme.of(context).colorScheme;
    final fixColor = appColors.onSecondaryContainer.withAlpha(themeIsDark ? 215 : 235);
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MainItemContainer(
                      itemColor: Colors.teal,
                      pictureName: 'texture_top_left',
                      itemIcon: CupertinoIcons.app,
                      itemTitle: appLocale.chapters,
                      routeName: NameRoutes.allChaptersPage,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: MainItemContainer(
                      itemColor: Colors.orange,
                      pictureName: 'texture_top_right',
                      itemIcon: CupertinoIcons.bookmark,
                      itemTitle: appLocale.favoriteChapters,
                      routeName: NameRoutes.favoriteChaptersPage,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: MainItemContainer(
                      itemColor: Colors.red,
                      pictureName: 'texture_bottom_left',
                      itemIcon: CupertinoIcons.square_grid_2x2,
                      itemTitle: appLocale.allSupplications,
                      routeName: NameRoutes.allSupplicationsPage,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: MainItemContainer(
                      itemColor: Colors.blue,
                      pictureName: 'texture_bottom_right',
                      itemIcon: CupertinoIcons.book,
                      itemTitle: appLocale.favoriteSupplications,
                      routeName: NameRoutes.favoriteSupplicationsPage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Visibility(
          visible: Provider.of<AppSettingsState>(context).getShowCollections,
          child: InkWell(
            onTap: () async {
              HapticFeedback.lightImpact();
              await Navigator.pushNamed(
                context,
                NameRoutes.collectionsPage,
              );
            },
            splashColor: appColors.onSurface,
            borderRadius: AppStyles.borderBig,
            child: Container(
              height: isPortrait ? screenWidth * 0.35 : screenHeight * 0.35,
              width: isPortrait ? screenWidth * 0.35 : screenHeight * 0.35,
              padding: AppStyles.padding,
              decoration: BoxDecoration(
                color: appColors.surface,
                borderRadius: AppStyles.borderBig,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.collections,
                    color: fixColor,
                  ),
                  Text(
                    appLocale.collections,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: fixColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
