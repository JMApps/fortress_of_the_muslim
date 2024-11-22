import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/routes/name_routes.dart';
import '../../core/styles/app_styles.dart';
import 'option_item.dart';

class LastMainThree extends StatelessWidget {
  const LastMainThree({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Row(
      children: [
        Flexible(
          child: OptionItem(
            itemIcon: Icons.settings_outlined,
            itemTitle: appLocale.settings,
            itemColor: Colors.teal,
            routeName: NameRoutes.appSettingsPage,
            itemBorder: AppStyles.borderBottomLeft,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: OptionItem(
            itemIcon: CupertinoIcons.book,
            itemTitle: appLocale.bookContent,
            itemColor: Colors.orange,
            routeName: NameRoutes.bookContentPage,
            itemBorder: AppStyles.borderMini,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: OptionItem(
            itemIcon: CupertinoIcons.app_badge,
            itemTitle: appLocale.aboutUs,
            itemColor: Colors.red,
            routeName: appLocale.aboutUs,
            itemBorder: AppStyles.borderBottomRight,
          ),
        ),
      ],
    );
  }
}
