import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return InkWell(
      onTap: () {
        switch (routeName) {
          case '/app_settings_page':
            Navigator.pushNamed(context, routeName);
            break;
          case '/book_content_list_page':
            Navigator.pushNamed(context, routeName);
            break;
          case 'for_share':
            _launchUrl();
            break;
          case 'links':
            Share.share(appLinks);
            break;
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

  Future<void> _launchUrl() async {
    final Uri urlAppStore = Uri.parse('https://apps.apple.com/tr/developer/imanil-binyaminov/id1564920953');
    final Uri urlPlayGoogle = Uri.parse('https://play.google.com/store/apps/dev?id=8649252597553656018');
    await launchUrl(
      Platform.isIOS ? urlAppStore : urlPlayGoogle,
    );
  }
}
