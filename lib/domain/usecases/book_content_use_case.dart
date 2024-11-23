import '../entities/book_content_entity.dart';
import '../repositories/book_content_repository.dart';

class BookContentUseCase {

  final BookContentRepository _bookContentRepository;

  BookContentUseCase(this._bookContentRepository);

  Future<List<BookContentEntity>> fetchAllContentBook({required String languageCode}) async {
    try {
      return await _bookContentRepository.getAllContentBook(tableName: languageCode);
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<BookContentEntity> fetchContentBookById({required String languageCode, required int bookContentId}) async {
    try {
      return await _bookContentRepository.getContentBookById(tableName: languageCode, bookContentId: bookContentId);
    } catch (e) {
      throw Exception('$e');
    }
  }
}