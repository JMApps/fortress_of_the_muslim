import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/strings/app_strings.dart';
import '../../core/styles/app_styles.dart';
import 'about_us_column.dart';

class OptionItem extends StatelessWidget {
  const OptionItem({
    super.key,
    required this.itemIcon,
    required this.itemTitle,
    required this.itemColor,
    required this.routeName,
  });

  final IconData itemIcon;
  final String itemTitle;
  final Color itemColor;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final themeIsDark = appTheme.brightness == Brightness.dark;
    final fixColor = appTheme.colorScheme.onSecondaryContainer.withOpacity(themeIsDark ? 0.85 : 0.95);
    return InkWell(
      onTap: () {
        HapticFeedback.lightImpact();
        if (routeName.contains(AppStrings.aboutUs)) {
          showModalBottomSheet(
            context: context,
            builder: (_) => SingleChildScrollView(
              padding: AppStyles.paddingWithoutTopMini,
              child: AboutUsColumn(),
            ),
          );
        } else {
          Navigator.pushNamed(context, routeName);
        }
      },
      borderRadius: AppStyles.borderMini,
      splashColor: Colors.grey.withOpacity(themeIsDark ? 0.25 : 0.95),
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
                    image: AssetImage('assets/pictures/texture_bottom_left.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      itemColor.withOpacity(0.85),
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
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: fixColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
