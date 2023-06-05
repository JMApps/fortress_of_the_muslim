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
    return InkWell(
      onTap: () {},
      borderRadius: AppStyles.mainBorder,
      splashColor: avatarColor,
      radius: 25,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: avatarColor,
        child: Icon(
          icon,
        ),
      ),
    );
  }
}
