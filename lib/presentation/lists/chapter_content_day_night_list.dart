import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/service/database_query.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/domain/state/chapter_content_settings_state.dart';
import 'package:fortress_of_the_muslim/presentation/items/chapter_content_day_night_item.dart';
import 'package:provider/provider.dart';

class ChapterContentDayNightList extends StatelessWidget {
  ChapterContentDayNightList({Key? key}) : super(key: key);

  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: context.watch<BookmarkButtonState>().getUpdateList
          ? _databaseQuery.getDayNightContentChapter(
              context.watch<ChapterContentSettingsState>().getIsDay)
          : _databaseQuery.getDayNightContentChapter(
              context.watch<ChapterContentSettingsState>().getIsDay),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData
            ? CupertinoScrollbar(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChapterContentDayNightItem(
                      item: snapshot.data![index],
                    );
                  },
                ),
              )
            : const Center(
                child: CircularProgressIndicator.adaptive(),
              );
      },
    );
  }
}
