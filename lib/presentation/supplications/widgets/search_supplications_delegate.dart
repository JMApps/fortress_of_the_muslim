import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/app_player_state.dart';
import 'search_supplications_future.dart';

class SearchSupplicationsDelegate extends SearchDelegate {
  final String search;

  SearchSupplicationsDelegate({required this.search}) : super(
    searchFieldLabel: search,
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
      padding: const EdgeInsets.only(left: 12),
      child: IconButton(
        onPressed: () {
          Provider.of<AppPlayerState>(context, listen: false).stopTrack();
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
