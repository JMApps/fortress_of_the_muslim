import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/presentation/lists/favorite_chapter_list.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/favorite_chapters_app_bar.dart';
import 'package:provider/provider.dart';

class FavoriteChapters extends StatefulWidget {
  const FavoriteChapters({Key? key}) : super(key: key);

  @override
  State<FavoriteChapters> createState() => _FavoriteChaptersState();
}

class _FavoriteChaptersState extends State<FavoriteChapters> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookmarkButtonState>(
            create: (_) => BookmarkButtonState()),
      ],
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size(double.maxFinite, 50),
          child: FavoriteChaptersAppBar(),
        ),
        body: FavoriteChapterList(),
      ),
    );
  }
}
