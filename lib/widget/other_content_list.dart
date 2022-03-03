import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/provider/main_state.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';
import 'package:fortress_of_the_muslim/widget/other_content_item.dart';
import 'package:provider/provider.dart';

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
                backgroundColor: context.watch<MainState>().getNightThemeState
                    ? Colors.blueGrey[900]
                    : Colors.brown[50],
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text('Содержимое'),
                  backgroundColor: context.watch<MainState>().getNightThemeState
                      ? Colors.brown[900]
                      : Colors.brown[400],
                  elevation: 0,
                ),
                body: Scrollbar(
                  thickness: 5,
                  isAlwaysShown: true,
                  showTrackOnHover: true,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
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
                    ? const CircularProgressIndicator()
                    : const CupertinoActivityIndicator(),
              );
      },
    );
  }
}
