import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/main_supplication_item_model.dart';
import 'package:fortress_of_the_muslim/data/local/database/service/database_query.dart';
import 'package:fortress_of_the_muslim/presentation/items/main_supplication_Item.dart';

class SearchSupplicationDelegate extends SearchDelegate {
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
        future: _databaseQuery.getAllSupplications(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          List<MainSupplicationItemModel> supplications = snapshot.data;
          List<MainSupplicationItemModel> recentSupplications = query.isEmpty
              ? supplications
              : supplications
                  .where((element) => element.contentTranslation
                      .toLowerCase()
                      .contains(query.toLowerCase()))
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
                        isSearch: false,
                      );
                    },
                  ),
                );
        });
  }
}
