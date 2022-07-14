import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/search_chapter_delegate.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/presentation/lists/main_chapter_list.dart';

class Chapters extends StatefulWidget {
  const Chapters({Key? key}) : super(key: key);

  @override
  State<Chapters> createState() => _ChaptersState();
}

class _ChaptersState extends State<Chapters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor:
                  Theme.of(context).colorScheme.mainChapterRowColor,
              centerTitle: true,
              elevation: 0,
              floating: true,
              snap: true,
              forceElevated: innerBoxIsScrolled,
              expandedHeight: 75,
              flexibleSpace: const FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'Главы',
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    CupertinoIcons.search,
                  ),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: SearchChapterDelegate(),
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
          child: const MainChapterList(),
        ),
      ),
    );
  }
}
