import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/strings/app_strings.dart';
import '../lists/main_chapters_list.dart';

class MainChapterPage extends StatelessWidget {
  const MainChapterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.chapters),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: AppStrings.search,
            icon: const Icon(CupertinoIcons.search),
          ),
        ],
      ),
      body: const MainChaptersList(),
    );
  }
}
