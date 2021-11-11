import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/provider/main_chapter_state.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';
import 'package:fortress_of_the_muslim/widget/favorite_chapter_item.dart';
import 'package:provider/provider.dart';

class FavoriteChapterList extends StatelessWidget {
  FavoriteChapterList({Key? key}) : super(key: key);

  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: context.watch<MainChapterState>().getUpdateList
          ? _databaseQuery.getFavoriteChapters()
          : _databaseQuery.getFavoriteChapters(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemBuilder: (BuildContext context, int index) {
                  return FavoriteChapterItem(
                      item: snapshot.data![index], index: index);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    indent: 16,
                    endIndent: 16,
                    color: Colors.grey,
                  );
                },
              )
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bookmark,
                        size: 150,
                        color: Colors.orange[100],
                      ),
                      const Text(
                        'Избранных глав нет',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
