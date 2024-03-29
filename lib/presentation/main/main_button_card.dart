import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';

class MainButtonCard extends StatelessWidget {
  const MainButtonCard({
    super.key,
    required this.icon,
    required this.title,
    required this.cardColor,
    required this.routeName,
    required this.borderRadiusIndex,
  });

  final IconData icon;
  final String title;
  final Color cardColor;
  final String routeName;
  final int borderRadiusIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: AppStyles.onlyBorderList[borderRadiusIndex],
      ),
      color: cardColor,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Container(
          height: 150,
          padding: AppStyles.mainPadding,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: AppStyles.onlyBorderList[borderRadiusIndex],
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              colorFilter: ColorFilter.mode(cardColor, BlendMode.multiply),
              image: const AssetImage('assets/pictures/row_texture.jpg'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: theme.colorScheme.mainDefaultColor,
              ),
              const SizedBox(height: 4),
              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
