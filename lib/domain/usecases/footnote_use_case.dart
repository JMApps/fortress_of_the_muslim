import '../entities/footnote_entity.dart';
import '../repositories/footnote_repository.dart';

class FootnoteUseCase {
  final FootnoteRepository _footnoteRepository;

  FootnoteUseCase(this._footnoteRepository);

  Future<List<FootnoteEntity>> fetchAllFootnotes() async {
    try {
      return await _footnoteRepository.getAllFootnotes();
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<FootnoteEntity> fetchFootnoteById({required int footnoteId}) async {
    try {
      return await _footnoteRepository.getFootnoteById(footnoteId: footnoteId);
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<String> fetchFootnoteBySupplication({required int supplicationId}) async {
    try {
      return await _footnoteRepository.getFootnoteBySupplication(supplicationId: supplicationId);
    } catch (e) {
      throw Exception('$e');
    }
  }
}
