import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fortress_of_the_muslim/model/chapter_arguments.dart';
import 'package:fortress_of_the_muslim/provider/favorite_supplication_state.dart';
import 'package:fortress_of_the_muslim/provider/floating_counter_state.dart';
import 'package:fortress_of_the_muslim/widget/app_settings.dart';
import 'package:fortress_of_the_muslim/widget/chapter_content_list.dart';
import 'package:fortress_of_the_muslim/widget/content_title.dart';
import 'package:fortress_of_the_muslim/widget/floating_counter_button.dart';
import 'package:fortress_of_the_muslim/widget/main_player.dart';
import 'package:provider/provider.dart';

class ContentChapter extends StatelessWidget {
  const ContentChapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ChapterArguments?;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoriteSupplicationState>(
            create: (_) => FavoriteSupplicationState()),
      ],
      child: Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Глава ${arguments!.chapterId}',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blueGrey,
          actions: [
            IconButton(
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return AppSettings();
                  },
                );
              },
              icon: const Icon(
                CupertinoIcons.settings,
                color: Colors.white,
              ),
            ),
            Switch(
              activeColor: Colors.orange[700],
              value: context.watch<FloatingCounterState>().getIsCountButtonShow,
              onChanged: (value) {
                context
                    .read<FloatingCounterState>()
                    .updateButtonCountShow(value);
              },
            ),
          ],
        ),
        floatingActionButton:
            context.watch<FloatingCounterState>().getIsCountButtonShow
                ? FloatingCounterButton()
                : SizedBox(),
        body: Scrollbar(
          thickness: 3,
          isAlwaysShown: true,
          showTrackOnHover: true,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ContentTitle(contentTitle: arguments.chapterTitle),
                ),
                ChapterContentList(chapterId: arguments.chapterId),
              ],
            ),
          ),
        ),
        bottomNavigationBar: MainPlayer(),
      ),
    );
  }
}
