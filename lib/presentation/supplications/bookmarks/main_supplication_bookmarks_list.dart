import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/main_chapters_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/presentation/supplications/bookmarks/main_supplication_bookmark_item.dart';
import 'package:provider/provider.dart';

class MainSupplicationBookmarksList extends StatelessWidget {
  const MainSupplicationBookmarksList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: context.watch<MainChaptersState>().getDatabaseQuery.getBookmarkSupplications(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return snapshot.hasData
            ? CupertinoScrollbar(
                child: ListView.builder(
                  padding: AppStyles.mainPaddingMini,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MainSupplicationBookmarkItem(
                      item: snapshot.data?[index],
                      itemIndex: index,
                    );
                  },
                ),
              )
            : Center(
                child: Padding(
                  padding: AppStyles.mainPadding,
                  child: Text(
                    AppStrings.bookmarksSupplicationIsEmpty,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              );
      },
    );
  }
}
