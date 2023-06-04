import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/presentation/main/supplication_card.dart';

class MainColumn extends StatelessWidget {
  const MainColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      padding: AppStyles.mainPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: SupplicationCard(
                  title: 'Главы',
                  icon: CupertinoIcons.square_list,
                  cardColor: themeColors.mainChaptersColor,
                  routeName: '',
                  borderRadiusIndex: 0,
                ),
              ),
              Expanded(
                child: SupplicationCard(
                  title: 'Избранное',
                  icon: CupertinoIcons.bookmark,
                  cardColor: themeColors.mainBookmarksColor,
                  routeName: '',
                  borderRadiusIndex: 1,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: SupplicationCard(
                  title: 'Дуа',
                  icon: CupertinoIcons.square_grid_2x2,
                  cardColor: themeColors.mainSupplicationsColor,
                  routeName: '',
                  borderRadiusIndex: 2,
                ),
              ),
              Expanded(
                child: SupplicationCard(
                  title: 'Избранные дуа',
                  icon: CupertinoIcons.book,
                  cardColor: themeColors.mainFavoritesColor,
                  routeName: '',
                  borderRadiusIndex: 3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
