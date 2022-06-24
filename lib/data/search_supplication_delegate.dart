import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/main_supplication_item_model.dart';
import 'package:fortress_of_the_muslim/data/local/database/service/database_query.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/presentation/items/main_supplication_Item.dart';
import 'package:fortress_of_the_muslim/presentation/items/search_supplication_Item.dart';

class SearchSupplicationDelegate extends SearchDelegate {
  final _databaseQuery = DatabaseQuery();

  SearchSupplicationDelegate({
    String hintText = 'Поиск дуа...',
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
    return FutureBuilder<List>(
      future: _databaseQuery.getAllSupplications(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<MainSupplicationItemModel> supplications = snapshot.data!;
          List<MainSupplicationItemModel> recentSupplications = query.isEmpty
              ? supplications
              : supplications
                  .where((element) =>
                      element.contentTranslation
                          .toLowerCase()
                          .contains(query.toLowerCase()) ||
                      element.id.toString().contains(query))
                  .toList();
          return recentSupplications.isEmpty
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
                    itemCount: recentSupplications.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SearchSupplicationItem(
                        item: recentSupplications[index],
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
      future: _databaseQuery.getAllSupplications(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<MainSupplicationItemModel> supplications = snapshot.data!;
          List<MainSupplicationItemModel> recentSupplications = query.isEmpty
              ? supplications
              : supplications
                  .where((element) =>
                      element.contentTranslation
                          .toLowerCase()
                          .contains(query.toLowerCase()) ||
                      element.id.toString().contains(query))
                  .toList();
          return recentSupplications.isEmpty
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
                    itemCount: recentSupplications.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MainSupplicationItem(
                        item: recentSupplications[index],
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
