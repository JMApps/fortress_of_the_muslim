import 'package:flutter/material.dart';

import '../../../core/strings/app_strings.dart';
import '../lists/main_supplications_list.dart';
import '../widgets/search_supplications_delegate.dart';

class MainSupplicationPage extends StatelessWidget {
  const MainSupplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.allSupplications),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchSupplicationsDelegate());
            },
            tooltip: AppStrings.search,
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const MainSupplicationsList(),
    );
  }
}
