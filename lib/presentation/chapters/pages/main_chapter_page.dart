import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../states/scroll_page_state.dart';
import '../../widgets/fab_to_start.dart';
import '../lists/main_chapters_list.dart';
import '../widgets/search_chapters_delegate.dart';

class MainChapterPage extends StatelessWidget {
  const MainChapterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ScrollPageState>(
          create: (_) => ScrollPageState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocale.chapters),
          actions: [
            IconButton(
              onPressed: () async {
                await showSearch(
                  context: context,
                  delegate: SearchChaptersDelegate(
                    search: appLocale.search,
                    tableName: appLocale.chapterTableName,
                  ),
                );
              },
              tooltip: appLocale.search,
              icon: const Icon(CupertinoIcons.search),
            ),
          ],
        ),
        body: MainChaptersList(tableName: appLocale.chapterTableName),
        floatingActionButton: FabTopStart(
          fabColor: appColors.inversePrimary,
        ),
      ),
    );
  }
}
