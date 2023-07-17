import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/main_app_settings_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/presentation/main/main_column.dart';
import 'package:fortress_of_the_muslim/presentation/main/option_button_card.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    isChapterRun();
    super.initState();
  }

  isChapterRun() async {
    if (context.read<MainAppSettingsState>().getIsRunMainChapters) {
      await Future.delayed(const Duration(milliseconds: 0))
          .whenComplete(() => Navigator.pushNamed(context, '/main_chapters_page'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
      body: const MainColumn(),
      bottomNavigationBar: Card(
        elevation: 1,
        color: theme.colorScheme.cardColor,
        margin: AppStyles.mainPadding,
        child: Padding(
          padding: AppStyles.symmetricVerticalPaddingMini,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OptionButtonCard(
                icon: CupertinoIcons.settings,
                avatarColor: theme.colorScheme.mainChaptersColor,
                routeName: '/app_settings_page',
              ),
              OptionButtonCard(
                icon: CupertinoIcons.book,
                avatarColor: theme.colorScheme.mainBookmarksColor,
                routeName: '/book_content_list_page',
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
