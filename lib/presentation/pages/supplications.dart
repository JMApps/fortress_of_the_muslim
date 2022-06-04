import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/service/database_query.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/domain/state/main_supplication_search_state.dart';
import 'package:fortress_of_the_muslim/presentation/items/main_supplication_Item.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/main_supplication_search.dart';
import 'package:provider/provider.dart';

class Supplications extends StatefulWidget {
  const Supplications({Key? key}) : super(key: key);

  @override
  State<Supplications> createState() => _SupplicationsState();
}

class _SupplicationsState extends State<Supplications> {
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainSupplicationSearchState>(
            create: (_) => MainSupplicationSearchState()),
        ChangeNotifierProvider<BookmarkButtonState>(
            create: (_) => BookmarkButtonState()),
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
                      centerTitle: true,
                      backgroundColor: const Color(0xffbf615b),
                      elevation: 0,
                      floating: true,
                      snap: true,
                      forceElevated: innerBoxIsScrolled,
                      expandedHeight: 75,
                      flexibleSpace: const FlexibleSpaceBar(
                        title: Text('Все дуа'),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: MainSupplicationSearch(),
                    ),
                  ];
                },
                body: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: FutureBuilder<List>(
                    future: _databaseQuery.getSupplicationSearchResult(
                        context.watch<BookmarkButtonState>().getUpdateList
                            ? context.watch<MainSupplicationSearchState>().getKeyWord
                            : context.watch<MainSupplicationSearchState>().getKeyWord),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return snapshot.hasError
                          ? const Center(
                              child: Text(
                                'По вашему запросу ничего не найдено',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            )
                          : snapshot.hasData
                              ? CupertinoScrollbar(
                                  child: ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return MainSupplicationItem(
                                        item: snapshot.data![index],
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
