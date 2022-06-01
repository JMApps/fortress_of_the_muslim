import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/service/database_query.dart';
import 'package:fortress_of_the_muslim/presentation/items/book_content_Item.dart';
import 'package:fortress_of_the_muslim/presentation/widgets/book_content_app_bar.dart';

class BookContents extends StatefulWidget {
  const BookContents({Key? key}) : super(key: key);

  @override
  State<BookContents> createState() => _BookContentsState();
}

class _BookContentsState extends State<BookContents> {
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.maxFinite, 50),
        child: BookContentAppBar(),
      ),
      body: FutureBuilder<List>(
        future: _databaseQuery.getBookContent(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? CupertinoScrollbar(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return BookContentItem(
                        item: snapshot.data![index],
                      );
                    },
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
        },
      ),
    );
  }
}
