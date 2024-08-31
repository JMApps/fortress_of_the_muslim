import '../../domain/entities/footnote_entity.dart';
import '../../domain/repositories/footnote_repository.dart';

class FootnoteDataRepository implements FootnoteRepository {
  @override
  Future<List<FootnoteEntity>> getAllFootnotes() {
    // TODO: implement getAllFootnotes
    throw UnimplementedError();
  }

  @override
  Future<FootnoteEntity> getFootnoteById({required int footnoteId}) {
    // TODO: implement getFootnoteById
    throw UnimplementedError();
  }

  @override
  Future<FootnoteEntity> getFootnoteBySupplication(
      {required int supplicationId}) {
    // TODO: implement getFootnoteBySupplication
    throw UnimplementedError();
  }
}
