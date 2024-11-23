import '../entities/book_content_entity.dart';

abstract class BookContentRepository {
  Future<List<BookContentEntity>> getAllContentBook({required String tableName});

  Future<BookContentEntity> getContentBookById({required String tableName, required int bookContentId});
}
