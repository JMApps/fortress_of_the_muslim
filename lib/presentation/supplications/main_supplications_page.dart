import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/presentation/supplications/main_supplications_list.dart';
import 'package:fortress_of_the_muslim/presentation/supplications/search_supplication_delegate.dart';

class MainSupplicationsPage extends StatelessWidget {
  const MainSupplicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;
    return Scaffold(
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
        ],
      ),
      body: const MainSupplicationsList(),
    );
  }
}
