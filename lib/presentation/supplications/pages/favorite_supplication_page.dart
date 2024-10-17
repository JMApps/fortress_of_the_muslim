import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/strings/app_strings.dart';
import '../../widgets/fab_to_start.dart';
import '../../states/scroll_page_state.dart';
import '../lists/favorite_supplications_list.dart';

class FavoriteSupplicationPage extends StatefulWidget {
  const FavoriteSupplicationPage({super.key});

  @override
  State<FavoriteSupplicationPage> createState() => _FavoriteSupplicationPageState();
}

class _FavoriteSupplicationPageState extends State<FavoriteSupplicationPage> {
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
          title: const Text(AppStrings.favoriteSupplications),
        ),
        body: const FavoriteSupplicationsList(),
        floatingActionButton: FabTopStart(
          fabColor: Colors.blue.withOpacity(0.35),
        ),
      ),
    );
  }
}
