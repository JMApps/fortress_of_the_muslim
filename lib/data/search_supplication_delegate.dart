import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/main_supplication_item_model.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/presentation/items/search_supplication_Item.dart';

class SearchSupplicationDelegate extends SearchDelegate {
  List<MainSupplicationItemModel> supplications = [];
  List<MainSupplicationItemModel> recentSupplications = [];
  final AsyncSnapshot snapshot;

  SearchSupplicationDelegate({
    required this.snapshot,
    String hintText = 'Поиск дуа...',
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
                color: Theme.of(context).colorScheme.mainSupplicationTitleColor,
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
        color: Theme.of(context).colorScheme.mainSupplicationTitleColor,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (snapshot.hasData) {
      supplications = snapshot.data;
      recentSupplications = query.isEmpty
          ? supplications
          : supplications
              .where((element) => element.contentTranslation
                  .toLowerCase()
                  .contains(query.toLowerCase()))
              .toList();
      return recentSupplications.isEmpty
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
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (snapshot.hasData) {
      supplications = snapshot.data;
      recentSupplications = query.isEmpty
          ? supplications
          : supplications
              .where((element) => element.contentTranslation
                  .toLowerCase()
                  .contains(query.toLowerCase()))
              .toList();
      return recentSupplications.isEmpty
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
  }
}
