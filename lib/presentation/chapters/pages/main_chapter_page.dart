import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../states/scroll_page_state.dart';
import '../../widgets/fab_to_start.dart';
import '../lists/main_chapters_list.dart';
import '../widgets/search_chapters_delegate.dart';

class MainChapterPage extends StatefulWidget {
  const MainChapterPage({super.key});

  @override
  State<MainChapterPage> createState() => _MainChapterPageState();
}

class _MainChapterPageState extends State<MainChapterPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ScrollPageState>(
          create: (_) => ScrollPageState(_scrollController),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocale.chapters),
          actions: [
            IconButton.filledTonal(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchChaptersDelegate(search: appLocale.search),
                );
              },
              tooltip: appLocale.search,
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: const MainChaptersList(),
        floatingActionButton: FabTopStart(
          fabColor: Colors.teal.withOpacity(0.35),
        ),
      ),
    );
  }
}
