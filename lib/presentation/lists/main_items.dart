import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/presentation/items/main_item.dart';
import 'package:fortress_of_the_muslim/presentation/items/main_row.dart';

class MainItems extends StatelessWidget {
  const MainItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      child: ListView(
        children: [
          GridView.count(
            shrinkWrap: true,
            padding: const EdgeInsets.all(32),
            primary: false,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            crossAxisCount: 2,
            children: [
              MainRow(
                icon: CupertinoIcons.square_list,
                title: 'Главы',
                route: 'main_chapters',
                color: const Color(0xa63f968c),
              ),
              MainRow(
                icon: CupertinoIcons.bookmark,
                title: 'Избранное',
                route: 'favorite_chapters',
                color: const Color(0xa6d19834),
              ),
              MainRow(
                icon: CupertinoIcons.book,
                title: 'Все дуа',
                route: 'main_supplications',
                color: const Color(0xa6bf615b),
              ),
              MainRow(
                icon: CupertinoIcons.bookmark,
                title: 'Избранные дуа',
                route: 'favorite_supplications',
                color: const Color(0x99454c5b),
              ),
            ],
          ),
          Visibility(
            visible: false,
            maintainAnimation: false,
            maintainSize: false,
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                height: 50,
              ),
            ),
          ),
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 4,
            ),
            primary: false,
            children: [
              MainItem(
                icon: CupertinoIcons.settings,
                title: 'Настройки',
                route: 'app_settings',
                color: const Color(0xFFFFFFFF),
              ),
              MainItem(
                icon: CupertinoIcons.doc_append,
                title: 'Содержимое',
                route: 'book_content',
                color: const Color(0xFFFFFFFF),
              ),
              MainItem(
                icon: CupertinoIcons.square_grid_2x2,
                title: 'Приложения',
                route: 'app_ios_account',
                color: const Color(0xFFFFFFFF),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
