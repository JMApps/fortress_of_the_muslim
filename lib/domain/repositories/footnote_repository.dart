import '../entities/footnote_entity.dart';

abstract class FootnoteRepository {
  Future<List<FootnoteEntity>> getAllFootnotes({required String tableName});

  Future<FootnoteEntity> getFootnoteById({required String tableName, required int footnoteId});

  Future<String> getFootnoteBySupplication({required String tableName, required int supplicationId});
}