import 'package:flutter/cupertino.dart';
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
    final appColors = Theme.of(context).colorScheme;
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
                FilledButton.tonalIcon(
                  onPressed: () async {
                    Navigator.pop(context);
                    await Share.share(dataSupplication);
                  },
                  icon: Icon(
                    CupertinoIcons.share,
                    color: appColors.primary,
                  ),
                  label: Text(
                    AppStrings.share,
                    style: AppStyles.mainTextStyle17,
                  ),
                ),
                FilledButton.tonalIcon(
                  onPressed: () async {
                    Navigator.pop(context);
                    await Clipboard.setData(ClipboardData(text: dataSupplication)).then(
                      (_) {
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: appColors.secondaryContainer,
                            duration: const Duration(milliseconds: 750),
                            behavior: SnackBarBehavior.floating,
                            margin: AppStyles.paddingMini,
                            shape: AppStyles.shape,
                            elevation: 0,
                            content: Text(
                              AppStrings.copied,
                              style: AppStyles.mainTextStyle17,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(
                    CupertinoIcons.doc_on_doc,
                    color: appColors.primary,
                  ),
                  label: Text(
                    AppStrings.copy,
                    style: AppStyles.mainTextStyle17,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      icon: const Icon(CupertinoIcons.share),
    );
  }
}
