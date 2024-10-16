import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../states/scroll_page_state.dart';
import '../lists/favorite_chapters_list.dart';
import '../widgets/fab_to_start.dart';

class FavoriteChapterPage extends StatefulWidget {
  const FavoriteChapterPage({super.key});

  @override
  State<FavoriteChapterPage> createState() => _FavoriteChapterPageState();
}

class _FavoriteChapterPageState extends State<FavoriteChapterPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ScrollPageState>(
          create: (_) => ScrollPageState(_scrollController),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.favoriteChapters),
        ),
        body: const FavoriteChaptersList(),
        floatingActionButton: FabTopStart(
          fabColor: Colors.orange.withOpacity(0.35),
        ),
      ),
    );
  }
}
