import 'package:flutter/material.dart';

import '../../../core/strings/app_strings.dart';
import 'search_supplications_future.dart';

class SearchSupplicationsDelegate extends SearchDelegate {

  SearchSupplicationsDelegate() : super(
    searchFieldLabel: AppStrings.search,
    keyboardType: TextInputType.text,
  );

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
      padding: EdgeInsets.only(left: 12),
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
    return SearchSupplicationsFuture(query: query.toLowerCase());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchSupplicationsFuture(query: query.toLowerCase());
  }
}
