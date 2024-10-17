import '../entities/book_content_entity.dart';
import '../repositories/book_content_repository.dart';

class BookContentUseCase {

  final BookContentRepository _bookContentRepository;

  BookContentUseCase(this._bookContentRepository);

  Future<List<BookContentEntity>> fetchAllContentBook() async {
    try {
      return await _bookContentRepository.getAllContentBook();
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<BookContentEntity> fetchContentBookById({required int bookContentId}) async {
    try {
      return await _bookContentRepository.getContentBookById(bookContentId: bookContentId);
    } catch (e) {
      throw Exception('$e');
    }
  }
}