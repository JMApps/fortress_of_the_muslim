import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/styles/app_styles.dart';
import 'about_us_column.dart';

class OptionItem extends StatelessWidget {
  const OptionItem({
    super.key,
    required this.itemIcon,
    required this.itemTitle,
    required this.itemColor,
    required this.routeName,
    required this.itemBorder,
  });

  final IconData itemIcon;
  final String itemTitle;
  final Color itemColor;
  final String routeName;
  final BorderRadius itemBorder;

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appTheme = Theme.of(context);
    final themeIsDark = appTheme.brightness == Brightness.dark;
    final fixColor = appTheme.colorScheme.onSecondaryContainer.withAlpha(themeIsDark ? 215 : 235);
    return InkWell(
      onTap: () {
        HapticFeedback.lightImpact();
        if (routeName.contains(appLocale.aboutUs)) {
          showModalBottomSheet(
            context: context,
            builder: (_) => const SingleChildScrollView(
              padding: AppStyles.paddingWithoutTopMini,
              child: AboutUsColumn(),
            ),
          );
        } else {
          Navigator.pushNamed(context, routeName);
        }
      },
      borderRadius: itemBorder,
      splashColor: Colors.grey.withAlpha(themeIsDark ? 75 : 235),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Opacity(
              opacity: themeIsDark ? 0.5 : 0.95,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: AppStyles.borderMini,
                  image: DecorationImage(
                    image: const AssetImage('assets/pictures/texture_bottom_left.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      itemColor.withAlpha(225),
                      BlendMode.multiply,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  itemIcon,
                  color: fixColor,
                ),
                Text(
                  itemTitle,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: fixColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
