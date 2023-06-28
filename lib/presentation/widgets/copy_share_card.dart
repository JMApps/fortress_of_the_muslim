import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';

class CopyShareCard extends StatelessWidget {
  const CopyShareCard({super.key, required this.contentForCopyAndShare});

  final String contentForCopyAndShare;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: AppStyles.mainMargin,
      child: Padding(
        padding: AppStyles.symmetricHorizontalPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(),
            ListTile(
              onTap: () {},
              title: const Text(AppStrings.copy),
              trailing: const Icon(CupertinoIcons.doc_on_doc),
              visualDensity: const VisualDensity(vertical: -4),
              shape: AppStyles.mainShape,
            ),
            const Divider(),
            ListTile(
              onTap: () {},
              title: const Text(AppStrings.share),
              trailing: const Icon(CupertinoIcons.share),
              visualDensity: const VisualDensity(vertical: -4),
              shape: AppStyles.mainShape,
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

