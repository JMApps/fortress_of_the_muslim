import 'package:flutter/material.dart';

import '../../domain/entities/footnote_entity.dart';
import '../../domain/usecases/footnote_use_case.dart';

class FootnotesState extends ChangeNotifier {
  final FootnoteUseCase _footnoteUseCase;

  FootnotesState(this._footnoteUseCase);

  Future<List<FootnoteEntity>> getAllFootnotes({required String tableName}) async {
    return await _footnoteUseCase.fetchAllFootnotes(languageCode: tableName);
  }

  Future<FootnoteEntity> getFootnoteById({required String tableName, required int footnoteId}) async {
    return await _footnoteUseCase.fetchFootnoteById(languageCode: tableName, footnoteId: footnoteId);
  }

  Future<String> getFootnoteBySupplication({required String tableName, required int supplicationId}) async {
    return await _footnoteUseCase.fetchFootnoteBySupplication(tableName: tableName, supplicationId: supplicationId);
  }
}
