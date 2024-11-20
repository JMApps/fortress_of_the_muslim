import 'package:flutter/material.dart';

import '../../domain/entities/footnote_entity.dart';
import '../../domain/usecases/footnote_use_case.dart';

class FootnotesState extends ChangeNotifier {
  final FootnoteUseCase _footnoteUseCase;

  FootnotesState(this._footnoteUseCase);

  Future<List<FootnoteEntity>> getAllFootnotes({required String languageCode}) async {
    return await _footnoteUseCase.fetchAllFootnotes(languageCode: languageCode);
  }

  Future<FootnoteEntity> getFootnoteById({required String languageCode, required int footnoteId}) async {
    return await _footnoteUseCase.fetchFootnoteById(languageCode: languageCode, footnoteId: footnoteId);
  }

  Future<String> getFootnoteBySupplication({required String languageCode, required int supplicationId}) async {
    return await _footnoteUseCase.fetchFootnoteBySupplication(languageCode: languageCode, supplicationId: supplicationId);
  }
}
