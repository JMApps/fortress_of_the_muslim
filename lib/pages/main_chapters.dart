import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/provider/day_night_chapter_state.dart';
import 'package:fortress_of_the_muslim/provider/main_chapter_state.dart';
import 'package:fortress_of_the_muslim/widget/main_chapter_list.dart';
import 'package:fortress_of_the_muslim/widget/main_searcher.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MainChapters extends StatelessWidget {
  const MainChapters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusScopeNode _currentFocus = FocusScope.of(context);
    context.read<DayNightChapterState>().initDayNightState();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainChapterState>(create: (_) => MainChapterState()),
      ],
      child: GestureDetector(
        child: Scaffold(
          backgroundColor: const Color(0xFFE0F2F1),
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Крепость мусульманина',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.teal,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(CupertinoIcons.square_list),
              onPressed: () {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed('/other_content');
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.apps,
                  color: Colors.white,
                ),
                onPressed: () async {
                  await launch(
                    Platform.isIOS
                        ? 'https://apps.apple.com/ru/developer/imanil-binyaminov/id1564920953'
                        : 'https://play.google.com/store/apps/dev?id=8649252597553656018',
                  );
                },
              ),
              // IconButton(
              //   icon: const Icon(Icons.info_outline),
              //   onPressed: () {
              //     Navigator.of(context, rootNavigator: true)
              //         .pushNamed('/about_us');
              //   },
              // ),
            ],
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: const MainSearcher(),
              ),
              Expanded(
                child: Scrollbar(
                  child: MainChapterList(),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          if (!_currentFocus.hasPrimaryFocus) {
            _currentFocus.unfocus();
          }
        },
      ),
    );
  }
}
