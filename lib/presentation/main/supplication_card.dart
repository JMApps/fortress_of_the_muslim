import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';

class SupplicationCard extends StatelessWidget {
  const SupplicationCard({
    super.key,
    required this.title,
    required this.icon,
    required this.cardColor,
    required this.routeName,
    required this.borderRadiusIndex,
  });

  final String title;
  final IconData icon;
  final Color cardColor;
  final String routeName;
  final int borderRadiusIndex;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: AppStyles.onlyBorderList[borderRadiusIndex],
      ),
      color: cardColor,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 125,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
              ),
              const SizedBox(height: 4),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
