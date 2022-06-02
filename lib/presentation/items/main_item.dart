import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainItem extends StatelessWidget {
  MainItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.route,
    required this.color,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String route;
  final Color? color;

  final Uri _urlIOS = Uri.parse(
      'https://apps.apple.com/ru/developer/imanil-binyaminov/id1564920953');
  final Uri _urlAndroid = Uri.parse(
      'https://play.google.com/store/apps/dev?id=8649252597553656018');

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: color,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.black,
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
