import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';

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
      onTap: () {
        switch (routeName) {

        }
      },
      borderRadius: AppStyles.mainBorder,
      splashColor: avatarColor,
      radius: 35,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: avatarColor.withOpacity(0.75),
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.mainDefaultColor,
        ),
      ),
    );
  }
}
