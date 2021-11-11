import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/provider/main_chapter_state.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';
import 'package:fortress_of_the_muslim/widget/main_chapter_item.dart';
import 'package:provider/provider.dart';

class MainChapterList extends StatelessWidget {
  MainChapterList({Key? key}) : super(key: key);

  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: context.watch<MainChapterState>().getTextFieldText.isNotEmpty ||
              context.watch<MainChapterState>().getUpdateList
          ? _databaseQuery.getChapterSearchResult(
              context.watch<MainChapterState>().getTextFieldText)
          : _databaseQuery.getAllChapters(),
      builder: (context, snapshot) {
        return snapshot.hasError
            ? const Center(
                child: Text(
                  'По вашему запросу ничего не найдено',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              )
            : snapshot.hasData
                ? ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemBuilder: (BuildContext context, int index) {
                      return MainChapterItem(
                          item: snapshot.data![index], index: index);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        indent: 16,
                        endIndent: 16,
                        color: Colors.grey,
                      );
                    },
                  )
                : Center(
                    child: Platform.isAndroid
                        ? const CircularProgressIndicator()
                        : const CupertinoActivityIndicator(),
                  );
      },
    );
  }
}
