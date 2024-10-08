import 'package:flutter/material.dart';

import '../../../core/strings/app_strings.dart';
import '../lists/main_chapters_list.dart';
import '../widgets/search_chapters_delegate.dart';

class MainChapterPage extends StatelessWidget {
  const MainChapterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.chapters),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchChaptersDelegate());
            },
            tooltip: AppStrings.search,
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const MainChaptersList(),
    );
  }
}
