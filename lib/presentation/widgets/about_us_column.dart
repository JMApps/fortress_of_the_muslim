import 'dart:io';

import 'package:flutter/material.dart';

import '../../core/styles/app_styles.dart';
import '../../l10n/app_localizations.dart';
import 'about_us_list_tile.dart';

class AboutUsColumn extends StatelessWidget {
  const AboutUsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Padding(
      padding: AppStyles.paddingWithoutTopMini,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            appLocale.ourApps,
            style: AppStyles.mainTextStyle17,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 8),
          AboutUsListTile(
            title: Platform.isAndroid ? appLocale.googlePlay : appLocale.appStore,
            subTitle: appLocale.moreOurApps,
            iconName: Platform.isAndroid ? 'google-play' : 'appstore',
            link: Platform.isAndroid ? appLocale.linkGooglePlay : appLocale.linkAppStore,
          ),
          const SizedBox(height: 8),
          Text(
            appLocale.ourSocials,
            style: AppStyles.mainTextStyle17,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 8),
          AboutUsListTile(
            title: appLocale.telegram,
            subTitle: appLocale.jmapps,
            iconName: 'telegram',
            link: appLocale.linkTelegram,
          ),
          const SizedBox(height: 8),
          AboutUsListTile(
            title: appLocale.instagram,
            subTitle: appLocale.devMuslim,
            iconName: 'instagram',
            link: appLocale.linkInstagram,
          ),
          const SizedBox(height: 8),
          AboutUsListTile(
            title: appLocale.ummaLife,
            subTitle: appLocale.jmapps,
            iconName: 'ummalife',
            link: appLocale.linkUmmaLife,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
