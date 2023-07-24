import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/main_chapters_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/application/theme/app_themes.dart';
import 'package:fortress_of_the_muslim/data/model/main_supplication_model.dart';
import 'package:fortress_of_the_muslim/presentation/supplications/main_supplication_item.dart';
import 'package:fortress_of_the_muslim/presentation/supplications/search_supplication_item.dart';
import 'package:provider/provider.dart';

class SearchSupplicationDelegate extends SearchDelegate {
  List<MainSupplicationModel> _supplications = [];
  List<MainSupplicationModel> _recentSupplications = [];

  SearchSupplicationDelegate({
    required String hintText,
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
        );

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        shape: AppStyles.appBarShape,
        backgroundColor: theme.colorScheme.mainSupplicationsColor,
        titleTextStyle: const TextStyle(
          color: Color(0xFFFFFFFF),
          fontFamily: 'Gilroy',
          fontSize: 20,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(
          fontSize: 17,
          fontFamily: 'Gilroy',
          color: Colors.white70,
        ),
      ),
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
              splashRadius: 20,
              icon: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                color: Colors.red.shade50,
                progress: transitionAnimation,
              ),
            )
          : const SizedBox(),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      splashRadius: 20,
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _searchFuture(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _searchFuture(context);
  }

  Widget _searchFuture(BuildContext context) {
    return FutureBuilder<List>(
      future: context.watch<MainChaptersState>().getDatabaseQuery.getAllSupplications(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          _supplications = snapshot.data as List<MainSupplicationModel>;
          _recentSupplications = query.isEmpty
              ? _supplications
              : _supplications
                  .where((element) =>
                      element.id.toString().contains(query.toString()) ||
                      element.translationText.toLowerCase().contains(query.toLowerCase())).toList();
          return _recentSupplications.isEmpty
              ? Padding(
                  padding: AppStyles.mainPadding,
                  child: Center(
                    child: Text(
                      AppStrings.searchQueryIsEmpty,
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : CupertinoScrollbar(
                  child: ListView.builder(
                    padding: AppStyles.mainPaddingMini,
                    itemCount: _recentSupplications.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SearchSupplicationItem(
                        item: _recentSupplications[index],
                        itemIndex: index,
                        itemsLength: snapshot.data!.length,
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
