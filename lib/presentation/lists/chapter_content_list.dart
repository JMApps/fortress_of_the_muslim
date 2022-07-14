import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/domain/state/chapter_content_settings_state.dart';
import 'package:fortress_of_the_muslim/presentation/items/chapter_content_Item.dart';
import 'package:provider/provider.dart';

class ChapterContentList extends StatelessWidget {
  const ChapterContentList({
    Key? key,
    required this.chapterId,
  }) : super(key: key);

  final int chapterId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: chapterId != 27
          ? context
              .watch<BookmarkButtonState>()
              .getDatabaseQuery
              .getContentChapter(chapterId)
          : context
              .watch<BookmarkButtonState>()
              .getDatabaseQuery
              .getDayNightContentChapter(
                  context.watch<ChapterContentSettingsState>().getIsDay),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: SelectableText('${snapshot.error}'),
          );
        }
        return snapshot.hasData
            ? CupertinoScrollbar(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChapterContentItem(
                      index: index + 1,
                      supplicationsLength: snapshot.data!.length,
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
