import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainRow extends StatelessWidget {
  MainRow({
    Key? key,
    required this.icon,
    required this.title,
    required this.route,
    required this.backgroundColor,
    required this.itemsColor,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String route;
  final Color? backgroundColor;
  final Color? itemsColor;

  final Uri _urlIOS = Uri.parse(
      'https://apps.apple.com/ru/developer/imanil-binyaminov/id1564920953');
  final Uri _urlAndroid = Uri.parse(
      'https://play.google.com/store/apps/dev?id=8649252597553656018');

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: backgroundColor,
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
          } else {
            Navigator.pushNamed(context, route);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              colorFilter:
                  ColorFilter.mode(backgroundColor!.withOpacity(0.2), BlendMode.dstATop),
              fit: BoxFit.fill,
              image: const AssetImage('assets/icons/row_texture.png'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: itemsColor,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: itemsColor,
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
