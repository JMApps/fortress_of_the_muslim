import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/domain/state/app_player_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/presentation/lists/chapter_content_list.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/chapter_content_sub_title.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/content_chapter_settings.dart';
import 'package:provider/provider.dart';

class ChapterContent extends StatefulWidget {
  const ChapterContent({
    Key? key,
    required this.chapterId,
  }) : super(key: key);

  final int chapterId;

  @override
  State<ChapterContent> createState() => _ChapterContentState();
}

class _ChapterContentState extends State<ChapterContent> {

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppPlayerState>(
          create: (_) => AppPlayerState(),
        ),
      ],
      child: Scaffold(
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
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    'Глава ${widget.chapterId}',
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(CupertinoIcons.settings),
                    splashRadius: 20,
                    onPressed: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            margin: const EdgeInsets.all(16),
                            child: const ContentChapterSettings(
                              isDayNight: false,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: ChapterContentSubTitle(
                  chapterId: widget.chapterId,
                ),
              ),
            ];
          },
          body: MediaQuery.removePadding(
            removeTop: true,
            removeBottom: true,
            context: context,
            child: ChapterContentList(
              chapterId: widget.chapterId,
            ),
          ),
        ),
      ),
    );
  }
}
