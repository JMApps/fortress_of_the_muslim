import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/chapter_content_arguments.dart';
import 'package:fortress_of_the_muslim/data/local/database/service/database_query.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/presentation/items/chapter_content_Item.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/chapter_content_sub_title.dart';
import 'package:provider/provider.dart';

class ChapterContent extends StatefulWidget {
  const ChapterContent({Key? key}) : super(key: key);

  @override
  State<ChapterContent> createState() => _ChapterContentState();
}

class _ChapterContentState extends State<ChapterContent> {
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ChapterContentArguments?;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookmarkButtonState>(
          create: (_) => BookmarkButtonState(),
        ),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: const Color(0xFF455A64),
                  elevation: 0,
                  floating: true,
                  snap: true,
                  centerTitle: true,
                  forceElevated: innerBoxIsScrolled,
                  expandedHeight: 75,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text('Глава ${arguments!.chapterId}'),
                  ),
                ),
                SliverToBoxAdapter(
                  child: ChapterContentSubTitle(
                    chapterSubTitle: arguments.chapterSubTitle,
                  ),
                ),
              ];
            },
            body: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: FutureBuilder<List>(
                future: context.watch<BookmarkButtonState>().getUpdateList
                    ? _databaseQuery.getContentChapter(arguments!.chapterId)
                    : _databaseQuery.getContentChapter(arguments!.chapterId),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return snapshot.hasData
                      ? CupertinoScrollbar(
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ChapterContentItem(
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
      }),
    );
  }
}
