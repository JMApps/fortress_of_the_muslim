import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/main_supplication_item_model.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/presentation/items/search_supplication_Item.dart';

class SearchSupplicationDelegate extends SearchDelegate {
  SearchSupplicationDelegate(
      {required this.snapshot, String hintText = 'Поиск дуа...'})
      : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
        );

  final AsyncSnapshot snapshot;
  List<MainSupplicationItemModel> recentSupplications = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      query.isNotEmpty
          ? IconButton(
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                color: Theme.of(context).colorScheme.supplicationRowColor,
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
        color: Theme.of(context).colorScheme.supplicationRowColor,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    recentSupplications = query.isEmpty
        ? snapshot.data
        : snapshot.data
            .where((element) =>
                element.contentTranslation
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                element.id.toString().contains(query))
            .toList();
    return recentSupplications.isEmpty
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
              itemCount: recentSupplications.length,
              itemBuilder: (BuildContext context, int index) {
                return SearchSupplicationItem(
                  item: recentSupplications[index],
                );
              },
            ),
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    recentSupplications = query.isEmpty
        ? snapshot.data
        : snapshot.data
            .where((element) =>
                element.contentTranslation
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                element.id.toString().contains(query))
            .toList();
    return recentSupplications.isEmpty
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
              itemCount: recentSupplications.length,
              itemBuilder: (BuildContext context, int index) {
                return SearchSupplicationItem(
                  item: recentSupplications[index],
                );
              },
            ),
          );
  }
}
