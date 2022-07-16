import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/search_supplication_delegate.dart';
import 'package:fortress_of_the_muslim/domain/state/app_player_state.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/presentation/lists/main_supplications_list.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/content_chapter_settings.dart';
import 'package:provider/provider.dart';

class Supplications extends StatelessWidget {
  const Supplications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                backgroundColor:
                    Theme.of(context).colorScheme.supplicationRowColor,
                centerTitle: true,
                elevation: 0,
                floating: true,
                snap: true,
                forceElevated: innerBoxIsScrolled,
                expandedHeight: 75,
                flexibleSpace: const FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    'Все дуа',
                  ),
                ),
                actions: [
                  FutureBuilder<List>(
                    future: context
                        .watch<BookmarkButtonState>()
                        .getDatabaseQuery
                        .getAllSupplications(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return snapshot.hasData
                          ? IconButton(
                              icon: const Icon(
                                CupertinoIcons.search,
                              ),
                              onPressed: () {
                                showSearch(
                                  context: context,
                                  delegate: SearchSupplicationDelegate(snapshot: snapshot),
                                );
                              },
                            )
                          : const CircularProgressIndicator.adaptive();
                    },
                  ),
                  IconButton(
                    icon: const Icon(CupertinoIcons.settings),
                    splashRadius: 20,
                    onPressed: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            margin: const EdgeInsets.all(16),
                            // ignore: prefer_const_constructors
                            child: ContentChapterSettings(isDayNight: false),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ];
          },
          body: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: const MainSupplicationsList(),
          ),
        ),
      ),
    );
  }
}
