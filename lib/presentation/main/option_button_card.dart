import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/social_container.dart';
import 'package:share_plus/share_plus.dart';

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
    const String appLinks = '${AppStrings.appName}\n\n${AppStrings.version} iOS:\nhttps://apps.apple.com/ru/app/крепость-верующего/id1564920951\n\n${AppStrings.version} Android:\nhttps://play.google.com/store/apps/details?id=jmapps.fortressofthemuslim';
    return GestureDetector(
      onTap: () {
        switch (routeName) {
          case '/app_settings_page':
            Navigator.pushNamed(context, routeName);
            break;
          case '/book_content_list_page':
            Navigator.pushNamed(context, routeName);
            break;
          case 'social':
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => const SocialContainer(),
            );
            break;
          case 'links':
            Share.share(appLinks);
            break;
        }
      },
      child: CircleAvatar(
        radius: 25,
        backgroundColor: avatarColor,
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.mainDefaultColor,
        ),
      ),
    );
  }
}
