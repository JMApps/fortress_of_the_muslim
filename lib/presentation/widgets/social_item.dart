import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialItem extends StatelessWidget {
  const SocialItem({
    super.key,
    required this.name,
    required this.description,
    required this.iconName,
    required this.link,
  });

  final String name;
  final String description;
  final String iconName;
  final String link;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return ListTile(
      onTap: () {
        _launchUrl();
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontFamily: 'Gilroy',
        ),
      ),
      subtitle: Text(
        description,
        style: const TextStyle(
          fontSize: 15,
          fontFamily: 'Gilroy',
        ),
      ),
      leading: Image.asset(
        'assets/icons/$iconName.png',
        color: appColors.mainDefaultColor,
        width: 35,
        height: 35,
      ),
    );
  }

  Future<void> _launchUrl() async {
    final Uri urlLink = Uri.parse(link);
    await launchUrl(urlLink);
  }
}
