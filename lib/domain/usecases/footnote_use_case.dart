import '../entities/footnote_entity.dart';
import '../repositories/footnote_repository.dart';

class FootnoteUseCase {
  final FootnoteRepository _footnoteRepository;

  FootnoteUseCase(this._footnoteRepository);

  Future<List<FootnoteEntity>> fetchAllFootnotes({required String languageCode}) async {
    try {
      return await _footnoteRepository.getAllFootnotes(tableName: languageCode);
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<FootnoteEntity> fetchFootnoteById({required String languageCode, required int footnoteId}) async {
    try {
      return await _footnoteRepository.getFootnoteById(tableName: languageCode, footnoteId: footnoteId);
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<String> fetchFootnoteBySupplication({required String tableName, required int supplicationId}) async {
    try {
      return await _footnoteRepository.getFootnoteBySupplication(tableName: tableName, supplicationId: supplicationId);
    } catch (e) {
      throw Exception('$e');
    }
  }
}
