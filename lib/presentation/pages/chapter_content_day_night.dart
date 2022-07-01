import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fortress_of_the_muslim/domain/state/app_player_state.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/domain/state/chapter_content_settings_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/presentation/lists/chapter_content_day_night_list.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/content_chapter_settings.dart';
import 'package:provider/provider.dart';

class ChapterContentDayNight extends StatefulWidget {
  const ChapterContentDayNight({Key? key}) : super(key: key);

  @override
  State<ChapterContentDayNight> createState() => _ChapterContentDayNightState();
}

class _ChapterContentDayNightState extends State<ChapterContentDayNight> {
  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookmarkButtonState>(
          create: (_) => BookmarkButtonState(),
        ),
        ChangeNotifierProvider<AppPlayerState>(
          create: (_) => AppPlayerState(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
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
                                  isDayNight: true,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
                      padding: const EdgeInsets.all(8),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: myColor.chapterContentColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Html(
                        data:
                            'Слова поминания Аллаха, которые желательно произносить ${context.watch<ChapterContentSettingsState>().getIsDay ? '<b>утром</b>' : '<b>вечером</b>'}',
                        style: {
                          '#': Style(
                            fontSize: const FontSize(17),
                            textAlign: TextAlign.center,
                            color: Colors.white,
                          ),
                        },
                      ),
                    ),
                  ),
                ];
              },
              body: MediaQuery.removePadding(
                removeTop: true,
                removeBottom: true,
                context: context,
                child: ChapterContentDayNightList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
