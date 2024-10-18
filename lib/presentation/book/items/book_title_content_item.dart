import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/data/models/arguments/book_content_args.dart';

import '../../../core/routes/name_routes.dart';
import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/book_content_entity.dart';

class BookTitleContentItem extends StatelessWidget {
  const BookTitleContentItem({
    super.key,
    required this.bookModel,
    required this.index,
  });

  final BookContentEntity bookModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final itemOddColor = appColors.inversePrimary.withOpacity(0.075);
    final itemEvenColor = appColors.inversePrimary.withOpacity(0.150);
    return Padding(
      padding: AppStyles.paddingBottomMini,
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            NameRoutes.bookContentDetailPage,
            arguments: BookContentArgs(bookModel: bookModel),
          );
        },
        splashColor: appColors.inversePrimary.withOpacity(0.5),
        tileColor: index.isOdd ? itemOddColor : itemEvenColor,
        shape: AppStyles.shape,
        title: Text(bookModel.bookContentTitle),
        trailing: Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
