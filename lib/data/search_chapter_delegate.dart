import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/main_chapter_item_model.dart';
import 'package:fortress_of_the_muslim/data/local/database/service/database_query.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/presentation/items/main_chapter_Item.dart';

class SearchChapterDelegate extends SearchDelegate {
  final _databaseQuery = DatabaseQuery();

  SearchChapterDelegate({
    String hintText = 'Поиск глав...',
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      query.isNotEmpty
          ? IconButton(
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                color: Theme.of(context).colorScheme.mainChapterRowColor,
                progress: transitionAnimation,
              ),
              onPressed: () {
                query = '';
              },
            )
          : const SizedBox(),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Theme.of(context).colorScheme.mainChapterRowColor,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
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
                      );
                    },
                  ),
                );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
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
                      );
                    },
                  ),
                );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
