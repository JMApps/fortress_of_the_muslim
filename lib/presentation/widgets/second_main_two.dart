import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/routes/name_routes.dart';
import '../../core/strings/app_strings.dart';
import 'main_item_container.dart';

class SecondMainTwo extends StatelessWidget {
  const SecondMainTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: MainItemContainer(
            itemColor: Colors.red,
            pictureName: 'texture_bottom_left',
            itemIcon: CupertinoIcons.square_grid_2x2,
            itemTitle: AppStrings.allSupplications,
            routeName: NameRoutes.allSupplicationsPage,
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: MainItemContainer(
            itemColor: Colors.blue,
            pictureName: 'texture_bottom_right',
            itemIcon: CupertinoIcons.book,
            itemTitle: AppStrings.favoriteSupplications,
            routeName: NameRoutes.favoriteSupplicationsPage,
          ),
        ),
      ],
    );
  }
}
