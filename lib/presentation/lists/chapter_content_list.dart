import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/service/database_query.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/presentation/items/chapter_content_Item.dart';
import 'package:provider/provider.dart';

class ChapterContentList extends StatelessWidget {
  ChapterContentList({
    Key? key,
    required this.chapterId,
  }) : super(key: key);

  final _databaseQuery = DatabaseQuery();
  final int chapterId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: context.watch<BookmarkButtonState>().getUpdateList
          ? _databaseQuery.getContentChapter(chapterId)
          : _databaseQuery.getContentChapter(chapterId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? CupertinoScrollbar(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChapterContentItem(
                      item: snapshot.data![index],
                    );
                  },
                ),
              )
            : const Center(
                child: CircularProgressIndicator.adaptive(),
              );
      },
    );
  }
}
