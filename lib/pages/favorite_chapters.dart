import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/provider/main_chapter_state.dart';
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
        backgroundColor: Color(0xFFFFF3E0),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Избранные главы',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.orange,
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
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                // About us page
              },
            ),
          ],
        ),
        body: Scrollbar(
          thickness: 5,
          isAlwaysShown: true,
          showTrackOnHover: true,
          child: FavoriteChapterList(),
        ),
      ),
    );
  }
}
