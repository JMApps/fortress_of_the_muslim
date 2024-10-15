import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/routes/name_routes.dart';
import '../../core/strings/app_strings.dart';
import 'main_item_container.dart';

class FirstMainTwo extends StatelessWidget {
  const FirstMainTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: MainItemContainer(
            itemColor: Colors.teal,
            pictureName: 'texture_top_left',
            itemIcon: CupertinoIcons.collections,
            itemTitle: AppStrings.chapters,
            routeName: NameRoutes.allChaptersPage,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: MainItemContainer(
            itemColor: Colors.orange,
            pictureName: 'texture_top_right',
            itemIcon: CupertinoIcons.bookmark,
            itemTitle: AppStrings.favoriteChapters,
            routeName: NameRoutes.favoriteChaptersPage,
          ),
        ),
      ],
    );
  }
}
