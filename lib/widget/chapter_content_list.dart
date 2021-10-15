import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';
import 'package:fortress_of_the_muslim/widget/chapter_content_item.dart';

class ChapterContentList extends StatelessWidget {
  ChapterContentList({Key? key, required this.chapterId}) : super(key: key);

  final int chapterId;
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _databaseQuery.getContentChapter(chapterId),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ChapterContentItem(
                      item: snapshot.data![index], index: index, length: snapshot.data!.length);
                },
              )
            : Center(
                child: Platform.isAndroid
                    ? CircularProgressIndicator()
                    : CupertinoActivityIndicator(),
              );
      },
    );
  }
}
