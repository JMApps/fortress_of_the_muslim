import 'package:flutter/material.dart';

import '../../domain/entities/footnote_entity.dart';
import '../../domain/usecases/footnote_use_case.dart';
import '../repositories/footnote_data_repository.dart';

class FootnotesState extends ChangeNotifier {
  final FootnoteUseCase _footnoteUseCase = FootnoteUseCase(FootnoteDataRepository());

  Future<List<FootnoteEntity>> getAllFootnotes() async {
    return await _footnoteUseCase.fetchAllFootnotes();
  }

  Future<FootnoteEntity> getFootnoteById({required int footnoteId}) async {
    return await _footnoteUseCase.fetchFootnoteById(footnoteId: footnoteId);
  }

  Future<FootnoteEntity> getFootnoteBySupplication({required int supplicationId}) async {
    return await _footnoteUseCase.fetchFootnoteBySupplication(supplicationId: supplicationId);
  }
}
