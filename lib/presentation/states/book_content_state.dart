import 'package:flutter/material.dart';

import '../../domain/entities/book_content_entity.dart';
import '../../domain/usecases/book_content_use_case.dart';

class BookContentState extends ChangeNotifier {
  final BookContentUseCase _bookContentUseCase;

  BookContentState(this._bookContentUseCase);

  Future<List<BookContentEntity>> getAllContentBook() async {
    return await _bookContentUseCase.fetchAllContentBook();
  }

  Future<BookContentEntity> getContentBookById({required int bookContentId}) async {
    return await _bookContentUseCase.fetchContentBookById(bookContentId: bookContentId);
  }
}
