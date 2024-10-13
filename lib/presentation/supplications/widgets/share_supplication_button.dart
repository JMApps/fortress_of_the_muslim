import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';

class ShareSupplicationButton extends StatelessWidget {
  const ShareSupplicationButton({
    super.key,
    required this.dataSupplication,
  });

  final String dataSupplication;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (_) => Padding(
            padding: AppStyles.paddingWithoutTop,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OutlinedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    await Share.share(dataSupplication);
                  },
                  child: Text(AppStrings.share),
                ),
                OutlinedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    await Clipboard.getData(dataSupplication);
                  },
                  child: Text(AppStrings.copy),
                ),
              ],
            ),
          ),
        );
      },
      icon: const Icon(Icons.ios_share_outlined),
    );
  }
}
