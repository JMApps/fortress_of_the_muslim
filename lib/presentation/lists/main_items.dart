import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/chapter_content_arguments.dart';
import 'package:fortress_of_the_muslim/domain/state/app_settings_state.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';
import 'package:fortress_of_the_muslim/presentation/items/main_item.dart';
import 'package:fortress_of_the_muslim/presentation/items/main_row.dart';
import 'package:provider/provider.dart';

class MainItems extends StatelessWidget {
  const MainItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      child: ListView(
        children: [
          GridView.count(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(
              left: 32,
              top: 16,
              right: 32,
              bottom: 16,
            ),
            primary: false,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            crossAxisCount: 2,
            children: [
              MainRow(
                icon: CupertinoIcons.square_list,
                title: 'Главы',
                route: 'main_chapters',
                backgroundColor:
                    Theme.of(context).colorScheme.mainChapterRowColor,
                itemsColor: Theme.of(context).colorScheme.mainChapterItemColor,
              ),
              MainRow(
                icon: CupertinoIcons.bookmark,
                title: 'Избранное',
                route: 'favorite_chapters',
                backgroundColor:
                    Theme.of(context).colorScheme.favoriteChapterRowColor,
                itemsColor:
                    Theme.of(context).colorScheme.favoriteChapterItemColor,
              ),
              MainRow(
                icon: CupertinoIcons.book,
                title: 'Все дуа',
                route: 'main_supplications',
                backgroundColor:
                    Theme.of(context).colorScheme.supplicationRowColor,
                itemsColor: Theme.of(context).colorScheme.supplicationItemColor,
              ),
              MainRow(
                icon: CupertinoIcons.bookmark,
                title: 'Избранные дуа',
                route: 'favorite_supplications',
                backgroundColor:
                    Theme.of(context).colorScheme.favoriteSupplicationRowColor,
                itemsColor:
                    Theme.of(context).colorScheme.favoriteSupplicationItemColor,
              ),
            ],
          ),
          Visibility(
            visible: context.watch<AppSettingsState>().isLastChapter,
            maintainAnimation: false,
            maintainSize: false,
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(
                    width: 1,
                    color: Color(0xffbf615b),
                  )),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Продолжить чтение ${context.watch<AppSettingsState>().getLastChapterNumber}-й главы',
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    'chapter_content',
                    arguments: ChapterContentArguments(
                        context.read<AppSettingsState>().getLastChapterNumber),
                  );
                },
              ),
            ),
          ),
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16,
            ),
            primary: false,
            children: [
              MainItem(
                icon: CupertinoIcons.settings,
                title: 'Настройки',
                route: 'app_settings',
              ),
              MainItem(
                icon: CupertinoIcons.doc_append,
                title: 'Содержимое',
                route: 'book_content',
              ),
              MainItem(
                icon: CupertinoIcons.square_grid_2x2,
                title: 'Приложения',
                route: 'app_ios_account',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
