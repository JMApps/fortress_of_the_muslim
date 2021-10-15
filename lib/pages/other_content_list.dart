import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';
import 'package:fortress_of_the_muslim/widget/other_content_item.dart';

class OtherContent extends StatelessWidget {
  OtherContent({Key? key}) : super(key: key);

  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _databaseQuery.getAboutUs(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? Scaffold(
                backgroundColor: Color(0xFFEFEBE9),
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text('Содержимое'),
                  backgroundColor: Colors.brown,
                  elevation: 0,
                ),
                body: Scrollbar(
                  thickness: 5,
                  isAlwaysShown: true,
                  showTrackOnHover: true,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    padding: EdgeInsets.zero,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        indent: 16,
                        endIndent: 16,
                        color: Colors.grey[500],
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return OtherContentItem(item: snapshot.data![index]);
                    },
                  ),
                ),
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
