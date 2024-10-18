import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/routes/name_routes.dart';
import '../../core/strings/app_strings.dart';
import 'option_item.dart';

class LastMainThree extends StatelessWidget {
  const LastMainThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: OptionItem(
            itemIcon: CupertinoIcons.settings,
            itemTitle: AppStrings.settings,
            itemColor: Colors.teal,
            routeName: NameRoutes.appSettingsPage,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: OptionItem(
            itemIcon: CupertinoIcons.book,
            itemTitle: AppStrings.bookContent,
            itemColor: Colors.orange,
            routeName: NameRoutes.bookContentPage,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: OptionItem(
            itemIcon: CupertinoIcons.app_badge,
            itemTitle: AppStrings.aboutUs,
            itemColor: Colors.red,
            routeName: AppStrings.aboutUs,
          ),
        ),
      ],
    );
  }
}
