import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';

class SelectButtonCard extends StatelessWidget {
  const SelectButtonCard({
    super.key,
    required this.title,
    required this.icon,
    required this.chapterIndex,
  });

  final String title;
  final IconData icon;
  final int chapterIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: title == AppStrings.counter
              ? theme.colorScheme.counterBorderSideColor
              : Colors.transparent,
        ),
        borderRadius: AppStyles.mainBorder,
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: AppStyles.mainBorder,
        child: Container(
          padding: AppStyles.mainPadding,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
              ),
              const SizedBox(height: 4),
              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.labelMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
