import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MainItem extends StatelessWidget {
  MainItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.route,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String route;

  final Uri _urlIOS = Uri.parse(
      'https://apps.apple.com/ru/developer/imanil-binyaminov/id1564920953');
  final Uri _urlAndroid = Uri.parse(
      'https://play.google.com/store/apps/dev?id=8649252597553656018');

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () async {
          if (route == 'app_ios_account') {
            await launchUrl(
              Platform.isIOS ? _urlIOS : _urlAndroid,
            );
          } else if (route == 'share_link') {
            Share.share(
              'Версия андроид: https://play.google.com/store/apps/details?id=jmapps.fortressofthemuslim\n\n'
              'Версия iOS: https://apps.apple.com/ru/app/крепость-верующего/id1564920951',
              sharePositionOrigin:
                  Rect.fromLTWH(0, 0, size.width, size.height / 2),
            );
          } else {
            Navigator.pushNamed(context, route);
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.25),
                BlendMode.dstATop,
              ),
              fit: BoxFit.cover,
              image: const AssetImage('assets/icons/row_texture.jpg'),
            ),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
