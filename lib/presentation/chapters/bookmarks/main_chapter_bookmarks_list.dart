import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/state/main_chapters_state.dart';
import 'package:fortress_of_the_muslim/application/string/app_strings.dart';
import 'package:fortress_of_the_muslim/application/style/app_styles.dart';
import 'package:fortress_of_the_muslim/presentation/chapters/bookmarks/main_chapter_bookmarks_item.dart';
import 'package:provider/provider.dart';

class MainChapterBookmarksList extends StatelessWidget {
  const MainChapterBookmarksList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: context.watch<MainChaptersState>().getDatabaseQuery.getBookmarkChapters(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? CupertinoScrollbar(
                child: ListView.builder(
                  padding: AppStyles.mainPaddingMini,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MainChapterBookmarksItem(
                      item: snapshot.data![index],
                      itemIndex: index,
                    );
                  },
                ),
              )
            : Center(
                child: Padding(
                  padding: AppStyles.mainPadding,
                  child: Text(
                    AppStrings.bookmarksChapterIsEmpty,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              );
      },
    );
  }
}
