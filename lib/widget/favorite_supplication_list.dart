import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/provider/favorite_supplication_state.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';
import 'package:fortress_of_the_muslim/widget/favorite_supplication_item.dart';
import 'package:provider/provider.dart';

class FavoriteSupplicationList extends StatelessWidget {
  FavoriteSupplicationList({Key? key}) : super(key: key);

  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: context.watch<FavoriteSupplicationState>().getUpdateList
          ? _databaseQuery.getFavoriteSupplications()
          : _databaseQuery.getFavoriteSupplications(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return FavoriteSupplicationItem(
                      item: snapshot.data![index],
                      index: index,
                      length: snapshot.data!.length);
                },
              )
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bookmark,
                        size: 150,
                        color: Colors.blue[100],
                      ),
                      const Text(
                        'Избранных дуа нет',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
