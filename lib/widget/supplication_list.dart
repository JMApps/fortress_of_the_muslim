import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/provider/main_supplication_state.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';
import 'package:fortress_of_the_muslim/widget/supplication_item.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SupplicationList extends StatelessWidget {
  SupplicationList({Key? key}) : super(key: key);

  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future:
          context.watch<MainSupplicationState>().getTextFieldText.isNotEmpty ||
                  context.watch<MainSupplicationState>().getUpdateList
              ? _databaseQuery.getSupplicationSearchResult(
                  context.watch<MainSupplicationState>().getTextFieldText)
              : _databaseQuery.getAllSupplications(),
      builder: (context, snapshot) {
        return snapshot.hasError
            ? const Center(
                child: const Text(
                  'По вашему запросу ничего не найдено',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              )
            : snapshot.hasData
                ? ScrollablePositionedList.builder(
                    physics: const BouncingScrollPhysics(),
                    itemScrollController: context.watch<MainSupplicationState>().getItemScrollController,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SupplicationItem(
                          item: snapshot.data![index], index: index);
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
