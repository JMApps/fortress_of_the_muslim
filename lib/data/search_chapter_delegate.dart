import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/main_chapter_item_model.dart';
import 'package:fortress_of_the_muslim/data/local/database/service/database_query.dart';
import 'package:fortress_of_the_muslim/presentation/items/main_chapter_Item.dart';

class SearchChapterDelegate extends SearchDelegate {
  final _databaseQuery = DatabaseQuery();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(CupertinoIcons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List>(
      future: _databaseQuery.getAllChapters(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<MainChapterItemModel> chapters = snapshot.data!;
          List<MainChapterItemModel> recentChapters = query.isEmpty
              ? chapters
              : chapters
                  .where((element) =>
                      element.chapterTitle
                          .toLowerCase()
                          .contains(query.toLowerCase()) ||
                      element.chapterNumber
                          .toLowerCase()
                          .contains(query.toLowerCase()))
                  .toList();
          return recentChapters.isEmpty
              ? const Center(
                  child: Text(
                    'По вашему запросу ничего не найдено',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                )
              : CupertinoScrollbar(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: recentChapters.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MainChapterItem(
                        item: recentChapters[index],
                        isSearch: false,
                      );
                    },
                  ),
                );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
