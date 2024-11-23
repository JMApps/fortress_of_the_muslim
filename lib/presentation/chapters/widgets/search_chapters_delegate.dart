import 'package:flutter/material.dart';

import 'search_chapter_future.dart';

class SearchChaptersDelegate extends SearchDelegate {
  SearchChaptersDelegate({
    required this.search,
    required this.tableName,
  }) : super(
    searchFieldLabel: search,
    keyboardType: TextInputType.text,
  );

  final String search;
  final String tableName;

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      query.isNotEmpty
          ? IconButton(
              onPressed: () {
                query = '';
              },
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: transitionAnimation,
              ),
            )
          : const SizedBox(),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchChaptersFuture(query: query.toLowerCase(), tableName: tableName);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchChaptersFuture(query: query.toLowerCase(), tableName: tableName);
  }
}
