import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/domain/state/bookmark_button_state.dart';
import 'package:fortress_of_the_muslim/presentation/items/main_chapter_Item.dart';
import 'package:provider/provider.dart';

class MainChapterList extends StatelessWidget {
  const MainChapterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: context.watch<BookmarkButtonState>().getDatabaseQuery.getAllChapters(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? CupertinoScrollbar(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MainChapterItem(
                      item: snapshot.data![index],
                    );
                  },
                ),
              )
            : const Center(
                child: CircularProgressIndicator.adaptive(),
              );
      },
    );
  }
}
