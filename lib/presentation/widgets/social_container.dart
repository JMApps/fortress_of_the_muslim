import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/social_item.dart';

class SocialContainer extends StatelessWidget {
  const SocialContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppStyles.mainMargin,
      shape: AppStyles.mainShape,
      child: SingleChildScrollView(
        padding: AppStyles.mainPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Наши приложения',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: appColors.primary,
              ),
              textAlign: TextAlign.start,
            ),
            // const SocialItem(
            //   name: 'Google Play',
            //   description: 'Наши приложения в Google Play',
            //   iconName: 'google-play',
            //   link:
            //       'https://play.google.com/store/apps/dev?id=8649252597553656018',
            // ),
            const SocialItem(
              name: 'App Store',
              description: 'Наши приложения в App Store',
              iconName: 'app-store',
              link:
                  'https://apps.apple.com/ru/developer/imanil-binyaminov/id1564920953',
            ),
            Text(
              'Мы в социальных сетях',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu',
                color: appColors.primary,
              ),
              textAlign: TextAlign.start,
            ),
            const SocialItem(
              name: 'Instagram',
              description: '@dev_muslim',
              iconName: 'instagram',
              link: 'https://www.instagram.com/dev_muslim',
            ),
            const SocialItem(
              name: 'Telegram',
              description: '@jmapps',
              iconName: 'telegram',
              link: 'https://t.me/jmapps',
            ),
            const SocialItem(
              name: 'Facebook',
              description: '@jmappps',
              iconName: 'facebook',
              link: 'https://www.facebook.com/jmappps',
            ),
            // const SocialItem(
            //   name: 'GMail',
            //   description: 'jmappsmuslim@gmail.com',
            //   iconName: 'gmail',
            //   link: 'https://www.gmail.com',
            // ),
            Text(
              'Политика конфиденциальности',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu',
                color: appColors.primary,
              ),
              textAlign: TextAlign.start,
            ),
            const SocialItem(
              name: 'Privacy',
              description: 'Privacy Policy',
              iconName: 'privacy',
              link:
                  'https://www.freeprivacypolicy.com/privacy/view/4b8ad22c71a1256a000cc68a3a94c761',
            ),
          ],
        ),
      ),
    );
  }
}
