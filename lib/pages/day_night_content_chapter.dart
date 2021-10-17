import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/provider/day_night_chapter_state.dart';
import 'package:fortress_of_the_muslim/widget/app_settings.dart';
import 'package:fortress_of_the_muslim/widget/content_title.dart';
import 'package:fortress_of_the_muslim/widget/day_night_chapter_content_list.dart';
import 'package:fortress_of_the_muslim/widget/main_player.dart';
import 'package:provider/provider.dart';

class DayNightContentChapter extends StatelessWidget {
  DayNightContentChapter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Глава 27',
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
          Consumer<DayNightChapterState>(
            builder: (context, dayNightState, _) => IconButton(
                onPressed: () {
                  dayNightState.updateDayNightState();
                },
                icon: Icon(dayNightState.getDayNight
                    ? CupertinoIcons.sunrise
                    : CupertinoIcons.sunset),
                iconSize: 30,
                color: dayNightState.getDayNight ? Colors.yellow : Colors.orange),
          ),
        ],
      ),
      body: Scrollbar(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: ContentTitle(
                contentTitle:
                'Слова поминания Аллаха, которые желательно произносить ${context.watch<DayNightChapterState>().getDayNight ? 'утром' : 'вечером'}',
              ),
            ),
            DayNightChapterContentList(),
          ],
        ),
      ),
      bottomNavigationBar: Offstage(offstage: false, child: MainPlayer()),
    );
  }
}