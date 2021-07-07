import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/model/about_item.dart';
import 'package:fortress_of_the_muslim/model/other_book_content_arguments.dart';
import 'package:fortress_of_the_muslim/services/database_query.dart';

class OtherContent extends StatefulWidget {
  const OtherContent({Key? key}) : super(key: key);

  @override
  _OtherContentState createState() => _OtherContentState();
}

class _OtherContentState extends State<OtherContent> {
  var _databaseQuery = DatabaseQuery();

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
                  title: Text('Содержимое'),
                  backgroundColor: Colors.brown[500],
                  elevation: 0,
                  actions: [],
                ),
                body: Scrollbar(
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        indent: 16,
                        endIndent: 16,
                        color: Colors.grey[500],
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return _buildItem(snapshot.data![index]);
                    },
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget _buildItem(AboutItem item) {
    return ListTile(
      title: Text(
        '${item.title}',
        style: TextStyle(fontSize: 20, fontFamily: 'Gilroy'),
      ),
      onTap: () {
        Navigator.of(context, rootNavigator: true).pushNamed(
          '/other_book_content',
          arguments: OtherBookContentArguments(item.id, item.title, item.content),
        );
      },
    );
  }
}
