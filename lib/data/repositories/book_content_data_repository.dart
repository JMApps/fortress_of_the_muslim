import '../../domain/entities/book_content_entity.dart';
import '../../domain/repositories/book_content_repository.dart';
import '../services/database_service.dart';

class BookContentDataRepository implements BookContentRepository {
  final DatabaseService _databaseService;

  BookContentDataRepository(this._databaseService);

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