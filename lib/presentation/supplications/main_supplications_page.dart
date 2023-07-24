import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/app_player_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/presentation/supplications/main_supplications_list.dart';
import 'package:fortress_of_the_muslim/presentation/supplications/search_supplication_delegate.dart';
import 'package:provider/provider.dart';

class MainSupplicationsPage extends StatelessWidget {
  const MainSupplicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppPlayerState(),
        ),
      ],
      child: Scaffold(
        backgroundColor: themeColors.mainSupplicationsBackgroundColor,
        appBar: AppBar(
          title: const Text(AppStrings.supplications),
          backgroundColor: themeColors.mainSupplicationsColor,
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchSupplicationDelegate(
                    hintText: AppStrings.searchSupplications,
                  ),
                );
              },
              tooltip: AppStrings.searchSupplications,
              splashRadius: 20,
              icon: const Icon(CupertinoIcons.search),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/content_settings_page');
              },
              splashRadius: 20,
              icon: const Icon(
                CupertinoIcons.settings,
              ),
            ),
          ],
        ),
        body: const MainSupplicationsList(),
      ),
    );
  }
}
