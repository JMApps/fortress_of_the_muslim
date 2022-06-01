import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/service/database_query.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/presentation/items/favorite_supplication_Item.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/favorite_supplications_app_bar.dart';
import 'package:provider/provider.dart';

class FavoriteSupplications extends StatefulWidget {
  const FavoriteSupplications({Key? key}) : super(key: key);

  @override
  State<FavoriteSupplications> createState() => _FavoriteSupplicationsState();
}

class _FavoriteSupplicationsState extends State<FavoriteSupplications> {
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookmarkButtonState>(
          create: (_) => BookmarkButtonState(),
        ),
      ],
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.maxFinite, 50),
          child: FavoriteSupplicationsAppBar(),
        ),
        body: Builder(
          builder: (context) {
            return FutureBuilder<List>(
              future: context.watch<BookmarkButtonState>().getUpdateList
                  ? _databaseQuery.getFavoriteSupplications()
                  : _databaseQuery.getFavoriteSupplications(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return snapshot.hasData
                    ? CupertinoScrollbar(
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return FavoriteSupplicationItem(
                              item: snapshot.data![index],
                            );
                          },
                        ),
                      )
                    : Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.bookmark,
                              size: 150,
                              color: Colors.grey[300],
                            ),
                            const Text(
                              'Избранных дуа нет',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
              },
            );
          }
        ),
      ),
    );
  }
}
