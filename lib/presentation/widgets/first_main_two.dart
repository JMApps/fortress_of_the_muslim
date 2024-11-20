import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/routes/name_routes.dart';
import 'main_item_container.dart';

class FirstMainTwo extends StatelessWidget {
  const FirstMainTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return Row(
      children: [
        Expanded(
          child: MainItemContainer(
            itemColor: Colors.teal,
            pictureName: 'texture_top_left',
            itemIcon: CupertinoIcons.collections,
            itemTitle: appLocale.chapters,
            routeName: NameRoutes.allChaptersPage,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: MainItemContainer(
            itemColor: Colors.orange,
            pictureName: 'texture_top_right',
            itemIcon: CupertinoIcons.bookmark,
            itemTitle: appLocale.favoriteChapters,
            routeName: NameRoutes.favoriteChaptersPage,
          ),
        ),
      ],
    );
  }
}
