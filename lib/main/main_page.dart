import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/presentation/main/main_column.dart';
import 'package:fortress_of_the_muslim/presentation/main/option_button_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
      body: const MainColumn(),
      bottomNavigationBar: Card(
        child: Padding(
          padding: AppStyles.symmetricVerticalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OptionButtonCard(
                icon: CupertinoIcons.settings,
                avatarColor: theme.colorScheme.mainChaptersColor,
                routeName: '/app_settings',
              ),
              OptionButtonCard(
                icon: CupertinoIcons.book,
                avatarColor: theme.colorScheme.mainBookmarksColor,
                routeName: '/other_content',
              ),
              OptionButtonCard(
                icon: CupertinoIcons.app_badge,
                avatarColor: theme.colorScheme.mainSupplicationsColor,
                routeName: 'for_share',
              ),
              OptionButtonCard(
                icon: CupertinoIcons.share,
                avatarColor: theme.colorScheme.mainSupplicationsBookmarkColor,
                routeName: 'links',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
