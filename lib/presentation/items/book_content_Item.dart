import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/book_content_arguments.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/book_content_item_model.dart';
import 'package:fortress_of_the_muslim/domain/theme/app_theme.dart';

class BookContentItem extends StatelessWidget {
  const BookContentItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final BookContentItemModel item;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Material(
      color: item.id.isOdd ? myColor.secondIs0dd : myColor.firstIs0dd,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Глава ${item.id}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            subtitle: Text(
              item.title,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(
            'content_book_content',
            arguments: BookContentArguments(
              item.title,
              item.content,
            ),
          );
        },
      ),
    );
  }
}
