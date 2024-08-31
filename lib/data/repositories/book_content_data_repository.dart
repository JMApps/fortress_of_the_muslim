import '../../domain/entities/book_content_entity.dart';
import '../../domain/repositories/book_content_repository.dart';

class BookContentDataRepository implements BookContentRepository {
  @override
  Future<List<BookContentEntity>> getAllContentBook() {
    // TODO: implement getAllContentBook
    throw UnimplementedError();
  }

  @override
  Future<BookContentEntity> getContentBookById({required int bookContentId}) {
    // TODO: implement getContentBookById
    throw UnimplementedError();
  }
}