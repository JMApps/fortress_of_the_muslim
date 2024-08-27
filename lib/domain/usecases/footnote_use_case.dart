import '../entities/footnote_entity.dart';
import '../repositories/footnote_repository.dart';

class FootnoteUseCase {
  final FootnoteRepository _footnoteRepository;

  FootnoteUseCase(this._footnoteRepository);

  Future<List<FootnoteEntity>> fetchAllFootnotes() async {
    return await _footnoteRepository.getAllFootnotes();
  }

  Future<FootnoteEntity> fetchFootnoteById({required int footnoteId}) async {
    return await _footnoteRepository.getFootnoteById(footnoteId: footnoteId);
  }

  Future<FootnoteEntity> fetchFootnoteBySupplication({required int supplicationId}) async {
    return await _footnoteRepository.getFootnoteBySupplication(supplicationId: supplicationId);
  }
}
