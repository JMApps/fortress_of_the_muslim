import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/service/database_query.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/presentation/items/favorite_chapter_Item.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/favorite_chapters_app_bar.dart';
import 'package:provider/provider.dart';

class FavoriteChapters extends StatefulWidget {
  const FavoriteChapters({Key? key}) : super(key: key);

  @override
  State<FavoriteChapters> createState() => _FavoriteChaptersState();
}

class _FavoriteChaptersState extends State<FavoriteChapters> {
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookmarkButtonState>(
            create: (_) => BookmarkButtonState()),
      ],
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.maxFinite, 50),
          child: FavoriteChaptersAppBar(),
        ),
        body: Builder(
          builder: (context) {
            return FutureBuilder<List>(
              future: context.watch<BookmarkButtonState>().getUpdateList
                  ? _databaseQuery.getFavoriteChapters()
                  : _databaseQuery.getFavoriteChapters(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return snapshot.hasData
                    ? CupertinoScrollbar(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return FavoriteChapterItem(
                              item: snapshot.data![index],
                            );
                          },
                        ),
                      )
                    : Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.bookmark,
                              size: 150,
                              color: Colors.grey,
                            ),
                            Text(
                              'Избранных глав нет',
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
          },
        ),
      ),
    );
  }
}
