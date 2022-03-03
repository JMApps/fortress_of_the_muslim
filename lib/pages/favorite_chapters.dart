import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/provider/main_chapter_state.dart';
import 'package:fortress_of_the_muslim/provider/main_state.dart';
import 'package:fortress_of_the_muslim/widget/favorite_chapter_list.dart';
import 'package:provider/provider.dart';

class FavoriteChapters extends StatelessWidget {
  const FavoriteChapters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainChapterState>(create: (_) => MainChapterState()),
      ],
      child: Scaffold(
        backgroundColor: context.watch<MainState>().getNightThemeState
            ? Colors.blueGrey[900]
            : Colors.orange[50],
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Избранные главы',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: context.watch<MainState>().getNightThemeState
              ? Colors.orange[900]
              : Colors.orange[400],
          elevation: 0,
          leading: IconButton(
            color: context.watch<MainState>().getNightThemeState
                ? Colors.orange[50]
                : Colors.white,
            icon: const Icon(CupertinoIcons.square_list),
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed('/other_content');
            },
          ),
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.info_outline),
          //     onPressed: () {
          //       Navigator.of(context, rootNavigator: true)
          //           .pushNamed('/about_us');
          //     },
          //   ),
          // ],
        ),
        body: Scrollbar(
          child: FavoriteChapterList(),
        ),
      ),
    );
  }
}
