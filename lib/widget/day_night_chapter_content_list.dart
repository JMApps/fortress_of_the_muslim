import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/provider/day_night_chapter_state.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';
import 'package:fortress_of_the_muslim/widget/day_night_chapter_content_item.dart';
import 'package:provider/provider.dart';

class DayNightChapterContentList extends StatelessWidget {
  DayNightChapterContentList({Key? key}) : super(key: key);

  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _databaseQuery.getDayNightSupplications(
          context.watch<DayNightChapterState>().getDayNight),
      builder: (context, snapshot) {
        return snapshot.hasError
            ? Center(
                child: Text('${snapshot.error}'),
              )
            : snapshot.hasData
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DayNightChapterContentItem(
                        item: snapshot.data![index],
                        index: index,
                        length: snapshot.data!.length,
                      );
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
