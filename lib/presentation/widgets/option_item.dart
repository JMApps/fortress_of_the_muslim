import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/strings/app_strings.dart';

class OptionItem extends StatelessWidget {
  const OptionItem({
    super.key,
    required this.itemIcon,
    required this.itemTitle,
    required this.itemBorder,
    required this.itemColor,
    required this.routeName,
  });

  final IconData itemIcon;
  final String itemTitle;
  final BorderRadius itemBorder;
  final Color itemColor;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    final themeIsDark = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: ClipRRect(
        borderRadius: itemBorder,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: () {
            HapticFeedback.lightImpact();
            if (routeName.contains(AppStrings.aboutUs)) {
              // Bottom sheet
            } else {
              // Navigator
            }
          },
          borderRadius: itemBorder,
          child: Opacity(
            opacity: themeIsDark ? 0.65 : 0.85,
            child: Container(
              height: 75,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/pictures/texture_bottom_left.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  colorFilter: ColorFilter.mode(
                    itemColor,
                    BlendMode.multiply,
                  ),
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(itemIcon),
                  Text(
                    itemTitle,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
