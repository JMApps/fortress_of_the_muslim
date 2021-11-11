import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/model/other_book_content_arguments.dart';
import 'package:fortress_of_the_muslim/model/other_model_item.dart';

class OtherContentItem extends StatelessWidget {
  const OtherContentItem({Key? key, required this.item}) : super(key: key);

  final OtherModelItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        item.title,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
      onTap: () {
        Navigator.of(context, rootNavigator: true).pushNamed(
          '/other_book_content',
          arguments:
              OtherBookContentArguments(item.id, item.title, item.content),
        );
      },
    );
  }
}
