import '../entities/footnote_entity.dart';

abstract class FootnoteRepository {
  Future<List<FootnoteEntity>> getAllFootnotes({required String languageCode});

  Future<FootnoteEntity> getFootnoteById({required String languageCode, required int footnoteId});

  Future<String> getFootnoteBySupplication({required String languageCode, required int supplicationId});
}