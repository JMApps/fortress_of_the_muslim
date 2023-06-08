import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/presentation/supplications/main_supplications_list.dart';
import 'package:fortress_of_the_muslim/presentation/supplications/search_supplication_delegate.dart';

class MainSupplicationsPage extends StatelessWidget {
  const MainSupplicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.mainSupplicationsBackgroundColor,
      appBar: AppBar(
        title: const Text(AppStrings.supplications),
        backgroundColor: theme.colorScheme.mainSupplicationsColor,
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
            splashRadius: 20,
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const MainSupplicationsList(),
    );
  }
}
