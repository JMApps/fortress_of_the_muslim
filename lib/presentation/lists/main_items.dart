import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/presentation/items/main_item.dart';

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
              MainItem(
                icon: CupertinoIcons.square_list,
                title: 'Главы',
                route: 'main_chapters',
                color: Colors.teal[100],
              ),
              MainItem(
                icon: CupertinoIcons.bookmark,
                title: 'Избранное',
                route: 'favorite_chapters',
                color: Colors.amber[100],
              ),
              MainItem(
                icon: CupertinoIcons.book,
                title: 'Все дуа',
                route: 'main_supplications',
                color: Colors.red[100],
              ),
              MainItem(
                icon: CupertinoIcons.bookmark,
                title: 'Избранные дуа',
                route: 'favorite_supplications',
                color: Colors.blue[100],
              ),
            ],
          ),
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 4,
            ),
            primary: false,
            children: const [
              MainItem(
                icon: CupertinoIcons.settings,
                title: 'Настройки',
                route: 'app_settings',
                color: Color(0xFFFFFFFF),
              ),
              MainItem(
                icon: CupertinoIcons.doc_append,
                title: 'Содержимое',
                route: 'book_content',
                color: Color(0xFFFFFFFF),
              ),
              MainItem(
                icon: CupertinoIcons.square_grid_2x2,
                title: 'Приложения',
                route: 'app_ios_account',
                color: Color(0xFFFFFFFF),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
