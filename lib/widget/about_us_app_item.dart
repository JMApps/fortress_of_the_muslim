import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsAppItem extends StatelessWidget {
  const AboutUsAppItem({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.appLink,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String appLink;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(
          CupertinoIcons.share,
          color: Colors.red,
        ),
        onPressed: () {
          Share.share(
            appLink,
            sharePositionOrigin: Rect.fromLTWH(0, 0, 10, 10),
          );
        },
      ),
      onTap: () async {
        if (await canLaunch(
          appLink,
        )) {
          await launch(
            appLink,
          );
        } else {
          throw 'Could not launch';
        }
      },
    );
  }
}
