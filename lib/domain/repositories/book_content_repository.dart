import '../entities/book_content_entity.dart';

abstract class BookContentRepository {
  Future<List<BookContentEntity>> getAllContentBook({required String languageCode});

  Future<BookContentEntity> getContentBookById({required String languageCode, required int bookContentId});
}
