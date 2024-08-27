import '../entities/book_content_entity.dart';

abstract class BookContentRepository {
  Future<List<BookContentEntity>> getAllContentBook();

  Future<BookContentEntity> getContentBookById({required int bookContentId});
}
