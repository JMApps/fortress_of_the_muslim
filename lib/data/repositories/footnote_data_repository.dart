import 'package:sqflite/sqflite.dart';

import '../../core/strings/db_values.dart';
import '../../domain/entities/footnote_entity.dart';
import '../../domain/repositories/footnote_repository.dart';
import '../models/footnote_model.dart';
import '../services/database_service.dart';

class FootnoteDataRepository implements FootnoteRepository {
  final DatabaseService _databaseService;

  FootnoteDataRepository(this._databaseService);

  @override
  Future<List<FootnoteEntity>> getAllFootnotes() async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValues.dbFootnoteTableName);
    final List<FootnoteEntity> allFootnotes = resources.isNotEmpty ? resources.map((e) => FootnoteEntity.fromModel(FootnoteModel.fromMap(e))).toList() : [];
    return allFootnotes;
  }

  @override
  Future<FootnoteEntity> getFootnoteById({required int footnoteId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValues.dbFootnoteTableName, where: '${DBValues.dbFootnoteId} = ?', whereArgs: [footnoteId]);
    final FootnoteEntity? footnoteById = resources.isNotEmpty ? FootnoteEntity.fromModel(FootnoteModel.fromMap(resources.first)) : null;
    return footnoteById!;
  }

  @override
  Future<FootnoteEntity> getFootnoteBySupplication({required int supplicationId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValues.dbFootnoteTableName, where: '${DBValues.dbSampleBy} = ?', whereArgs: [supplicationId]);
    final FootnoteEntity? footnoteBySupplicationId = resources.isNotEmpty ? FootnoteEntity.fromModel(FootnoteModel.fromMap(resources.first)) : null;
    return footnoteBySupplicationId!;
  }
}
