import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/styles/app_styles.dart';

class MainItemContainer extends StatelessWidget {
  const MainItemContainer({
    super.key,
    required this.itemColor,
    required this.pictureName,
    required this.itemIcon,
    required this.itemTitle,
    required this.routeName,
  });

  final Color itemColor;
  final String pictureName;
  final IconData itemIcon;
  final String itemTitle;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    final themeIsDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: () {
        HapticFeedback.lightImpact();
        Navigator.pushNamed(context, routeName);
      },
      splashColor: Colors.grey,
      borderRadius: AppStyles.borderMini,
      child: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: AppStyles.borderMini,
        child: Opacity(
          opacity: themeIsDark ? 0.65 : 0.95,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/pictures/$pictureName.jpg'),
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
    );
  }
}
