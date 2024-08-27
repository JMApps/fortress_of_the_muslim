import '../entities/book_content_entity.dart';
import '../repositories/book_content_repository.dart';

class BookContentUseCase {

  final BookContentRepository _bookContentRepository;

  BookContentUseCase(this._bookContentRepository);

  Future<List<BookContentEntity>> fetchAllContentBook() async {
    return await _bookContentRepository.getAllContentBook();
  }

  Future<BookContentEntity> fetchContentBookById({required int bookContentId}) async {
    return await _bookContentRepository.getContentBookById(bookContentId: bookContentId);
  }
}