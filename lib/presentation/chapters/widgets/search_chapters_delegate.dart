import 'package:flutter/material.dart';

import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import 'search_future.dart';

class SearchChaptersDelegate extends SearchDelegate {

  SearchChaptersDelegate() : super(
    searchFieldLabel: AppStrings.search,
    keyboardType: TextInputType.text,
  );

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(
        titleSpacing: 0,      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      query.isNotEmpty ? IconButton(
        onPressed: () {
          query = '';
          },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: transitionAnimation,
        ),
      ) : const SizedBox(),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Padding(
      padding: AppStyles.paddingLeft,
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
    return SearchFuture(query: query.toLowerCase());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchFuture(query: query.toLowerCase());
  }
}
