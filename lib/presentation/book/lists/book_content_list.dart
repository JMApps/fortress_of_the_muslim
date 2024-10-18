import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/styles/app_styles.dart';
import '../../../domain/entities/book_content_entity.dart';
import '../../states/book_content_state.dart';
import '../../widgets/main_error_text_data.dart';
import '../items/book_title_content_item.dart';

class BookContentList extends StatefulWidget {
  const BookContentList({super.key});

  @override
  State<BookContentList> createState() => _BookContentListState();
}

class _BookContentListState extends State<BookContentList> {
  late final Future<List<BookContentEntity>> _futureBookContent;

  @override
  void initState() {
    super.initState();
    _futureBookContent = Provider.of<BookContentState>(context, listen: false).getAllContentBook();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BookContentEntity>>(
      future: _futureBookContent,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (snapshot.hasError) {
          return MainErrorTextData(errorText: snapshot.error.toString());
        }
        return Scrollbar(
          child: ListView.builder(
            padding: AppStyles.paddingMini,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final BookContentEntity bookModel = snapshot.data![index];
              return BookTitleContentItem(
                bookModel: bookModel,
                index: index,
              );
            },
          ),
        );
      },
    );
  }
}
