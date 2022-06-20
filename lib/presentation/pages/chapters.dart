import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/service/database_query.dart';
import 'package:fortress_of_the_muslim/data/search_chapter_delegate.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/domain/state/main_chapter_search_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/presentation/items/main_chapter_Item.dart';
import 'package:provider/provider.dart';

class Chapters extends StatefulWidget {
  const Chapters({Key? key}) : super(key: key);

  @override
  State<Chapters> createState() => _ChaptersState();
}

class _ChaptersState extends State<Chapters> {
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainChapterSearchState>(
          create: (_) => MainChapterSearchState(),
        ),
        ChangeNotifierProvider<BookmarkButtonState>(
          create: (_) => BookmarkButtonState(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return GestureDetector(
            child: Scaffold(
              body: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      backgroundColor:
                          Theme.of(context).colorScheme.mainChapterRowColor,
                      centerTitle: true,
                      elevation: 0,
                      floating: true,
                      snap: true,
                      forceElevated: innerBoxIsScrolled,
                      expandedHeight: 75,
                      flexibleSpace: const FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text(
                          'Главы',
                        ),
                      ),
                      actions: [
                        IconButton(
                          icon: const Icon(
                            CupertinoIcons.search,
                          ),
                          onPressed: () {
                            showSearch(
                              context: context,
                              delegate: SearchChapterDelegate(),
                            );
                          },
                        ),
                      ],
                    ),
                    // const SliverToBoxAdapter(
                    //   child: MainChapterSearch(),
                    // ),
                  ];
                },
                body: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: FutureBuilder<List>(
                    future: _databaseQuery.getChapterSearchResult(context
                            .watch<BookmarkButtonState>()
                            .getUpdateList
                        ? context.watch<MainChapterSearchState>().getKeyWord
                        : context.watch<MainChapterSearchState>().getKeyWord),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return snapshot.hasError
                          ? const Center(
                              child: Text(
                                'По вашему запросу ничего не найдено',
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                          : snapshot.hasData
                              ? CupertinoScrollbar(
                                  child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: snapshot.data!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return MainChapterItem(
                                        item: snapshot.data![index],
                                        isSearch: true,
                                      );
                                    },
                                  ),
                                )
                              : const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                );
                    },
                  ),
                ),
              ),
            ),
            onTap: () {
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
          );
        },
      ),
    );
  }
}
