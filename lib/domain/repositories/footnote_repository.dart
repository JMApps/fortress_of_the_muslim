import '../entities/footnote_entity.dart';

abstract class FootnoteRepository {
  Future<List<FootnoteEntity>> getAllFootnotes();

  Future<FootnoteEntity> getFootnoteById({required int footnoteId});

  Future<FootnoteEntity> getFootnoteBySupplication({required int supplicationId});
}