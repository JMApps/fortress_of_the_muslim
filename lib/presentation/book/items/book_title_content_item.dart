import 'package:flutter/material.dart';

import '../../../core/routes/name_routes.dart';
import '../../../core/styles/app_styles.dart';
import '../../../data/models/arguments/book_content_args.dart';
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
    final itemOddColor = appColors.inversePrimary.withAlpha(15);
    final itemEvenColor = appColors.inversePrimary.withAlpha(35);
    return Padding(
      padding: AppStyles.paddingBottomMini,
      child: ListTile(
        onTap: () async {
          await Navigator.pushNamed(
            context,
            NameRoutes.bookContentDetailPage,
            arguments: BookContentArgs(bookModel: bookModel),
          );
        },
        splashColor: appColors.inversePrimary.withAlpha(75),
        tileColor: index.isOdd ? itemOddColor : itemEvenColor,
        shape: AppStyles.shape,
        title: Text(bookModel.bookContentTitle),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: appColors.secondary,
        ),
      ),
    );
  }
}
