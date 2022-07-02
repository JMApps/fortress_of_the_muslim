import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/chapter_content_arguments.dart';
import 'package:fortress_of_the_muslim/domain/state/app_player_state.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/presentation/lists/chapter_content_list.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/chapter_content_sub_title.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/content_chapter_settings.dart';
import 'package:provider/provider.dart';

class ChapterContent extends StatefulWidget {
  const ChapterContent({Key? key}) : super(key: key);

  @override
  State<ChapterContent> createState() => _ChapterContentState();
}

class _ChapterContentState extends State<ChapterContent> {

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    final arguments = ModalRoute.of(context)!.settings.arguments as ChapterContentArguments?;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookmarkButtonState>(
          create: (_) => BookmarkButtonState(),
        ),
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
                    'Глава ${arguments!.chapterId}',
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
                  chapterId: arguments.chapterId,
                ),
              ),
            ];
          },
          body: MediaQuery.removePadding(
            removeTop: true,
            removeBottom: true,
            context: context,
            child: ChapterContentList(
              chapterId: arguments!.chapterId,
            ),
          ),
        ),
      ),
    );
  }
}
