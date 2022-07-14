import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/main_chapter_item_model.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/presentation/items/main_chapter_Item.dart';
import 'package:provider/provider.dart';

class SearchChapterDelegate extends SearchDelegate {

  List<MainChapterItemModel> chapters = [];
  List<MainChapterItemModel> recentChapters = [];

  SearchChapterDelegate({
    String hintText = 'Поиск глав...',
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
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
      future: context.watch<BookmarkButtonState>().getDatabaseQuery.getAllChapters(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          chapters = snapshot.data;
          recentChapters = query.isEmpty
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
              ? Center(
                  child: Text(
                    'По запросу $query ничего не найдено',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
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
      future: context.watch<BookmarkButtonState>().getDatabaseQuery.getAllChapters(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          chapters = snapshot.data;
          recentChapters = query.isEmpty
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
              ? Padding(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      'По запросу $query ничего не найдено',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
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
