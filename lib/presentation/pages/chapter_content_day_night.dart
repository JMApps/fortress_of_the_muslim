import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/service/database_query.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/presentation/items/chapter_content_day_night_item.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/chapter_content_sub_title.dart';
import 'package:provider/provider.dart';

class ChapterContentDayNight extends StatefulWidget {
  const ChapterContentDayNight({Key? key}) : super(key: key);

  @override
  State<ChapterContentDayNight> createState() => _ChapterContentDayNightState();
}

class _ChapterContentDayNightState extends State<ChapterContentDayNight> {
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookmarkButtonState>(
          create: (_) => BookmarkButtonState(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    centerTitle: true,
                    backgroundColor: myColor.chapterContentColor,
                    elevation: 0,
                    floating: true,
                    snap: false,
                    forceElevated: innerBoxIsScrolled,
                    expandedHeight: 75,
                    flexibleSpace: const FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text('Глава 27'),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: FutureBuilder<List>(
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return ChapterContentSubTitle(
                          databaseQuery: _databaseQuery,
                          chapterId: 27,
                        );
                      },
                    ),
                  ),
                ];
              },
              body: MediaQuery.removePadding(
                removeTop: true,
                removeBottom: true,
                context: context,
                child: FutureBuilder<List>(
                  future: context.watch<BookmarkButtonState>().getUpdateList
                      ? _databaseQuery.getContentChapter(27)
                      : _databaseQuery.getContentChapter(27),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return snapshot.hasData
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
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
