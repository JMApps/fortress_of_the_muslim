import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/styles/app_styles.dart';

class MainItemChapter extends StatelessWidget {
  const MainItemChapter({
    super.key,
    required this.iconName,
    required this.chapterNumber,
    required this.itemIcon,
    required this.itemTitle,
  });

  final String iconName;
  final int chapterNumber;
  final IconData itemIcon;
  final String itemTitle;

  @override
  Widget build(BuildContext context) {
    final themeIsDark = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: ClipRRect(
        borderRadius: AppStyles.borderMini,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: () {
            HapticFeedback.lightImpact();
            if (chapterNumber == 1000) {
              // Counter
            } else {
              // Navigator
            }
          },
          borderRadius: AppStyles.borderMini,
          child: Container(
            padding: AppStyles.padding,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/pictures/$iconName.jpg'),
                fit: BoxFit.cover,
                opacity: themeIsDark ? 0.35 : 0.65,
              ),
            ),
            child: Opacity(
              opacity: themeIsDark ? 0.65 : 0.95,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(itemIcon),
                  Text(
                    itemTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
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
