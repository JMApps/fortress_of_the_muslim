import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';

class OptionButtonCard extends StatelessWidget {
  const OptionButtonCard({
    super.key,
    required this.icon,
    required this.avatarColor,
    required this.routeName,
  });

  final IconData icon;
  final Color avatarColor;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: avatarColor,
      child: InkWell(
        onTap: () {},
        borderRadius: AppStyles.mainBorder,
        splashColor: avatarColor,
        radius: 35,
        child: Icon(
          icon,
        ),
      ),
    );
  }
}
