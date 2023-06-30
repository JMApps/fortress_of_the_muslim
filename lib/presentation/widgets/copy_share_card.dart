import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/snack_container.dart';
import 'package:share_plus/share_plus.dart';

class CopyShareCard extends StatelessWidget {
  const CopyShareCard({
    super.key,
    required this.contentForCopyAndShare,
    required this.backgroundColor,
  });

  final String contentForCopyAndShare;
  final Color backgroundColor;

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
              onTap: () {
                Clipboard.getData(contentForCopyAndShare);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: backgroundColor,
                    duration: const Duration(milliseconds: 750),
                    behavior: SnackBarBehavior.floating,
                    margin: AppStyles.symmetricHorizontalPadding,
                    shape: AppStyles.mainShape,
                    content: const SnackContainer(
                      message: AppStrings.copied,
                    ),
                  ),
                );
                Navigator.pop(context);
              },
              title: const Text(AppStrings.copy),
              trailing: const Icon(CupertinoIcons.doc_on_doc),
              visualDensity: const VisualDensity(vertical: -4),
              shape: AppStyles.mainShape,
            ),
            const Divider(),
            ListTile(
              onTap: () {
                Share.share(contentForCopyAndShare);
              },
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
