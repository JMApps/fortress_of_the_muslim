import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/presentation/items/favorite_chapter_Item.dart';
import 'package:provider/provider.dart';

class FavoriteChapterList extends StatelessWidget {
  const FavoriteChapterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: context
          .watch<BookmarkButtonState>()
          .getDatabaseQuery
          .getFavoriteChapters(),
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
  }
}