import 'package:sqflite/sqflite.dart';

import '../../core/strings/db_values.dart';
import '../../domain/entities/supplication_entity.dart';
import '../../domain/repositories/supplication_repository.dart';
import '../models/supplication_model.dart';
import '../services/database_service.dart';

class SupplicationDataRepository implements SupplicationRepository {
  final DatabaseService _databaseService;

  SupplicationDataRepository(this._databaseService);

  @override
  Future<List<SupplicationEntity>> getAllSupplications({required String tableName}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName);
    final List<SupplicationEntity> allSupplications = resources.isNotEmpty ? resources.map((e) => SupplicationEntity.fromModel(SupplicationModel.fromMap(e))).toList() : [];
    return allSupplications;
  }

  @override
  Future<List<SupplicationEntity>> getSupplicationsByChapterId({required String tableName, required int chapterId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName, where: '${DBValues.dbSampleBy} = ?', whereArgs: [chapterId]);
    final List<SupplicationEntity> byChapterSupplications = resources.isNotEmpty ? resources.map((e) => SupplicationEntity.fromModel(SupplicationModel.fromMap(e))).toList() : [];
    return byChapterSupplications;
  }

  @override
  Future<SupplicationEntity> getSupplicationById({required String tableName, required int supplicationId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName, where: '${DBValues.dbSupplicationId} = ?', whereArgs: [supplicationId]);
    final SupplicationEntity? supplicationById = resources.isNotEmpty ? SupplicationEntity.fromModel(SupplicationModel.fromMap(resources.first)) : null;
    return supplicationById!;
  }

  @override
  Future<List<SupplicationEntity>> getFavoriteSupplications({required String tableName, required List<int> ids}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName, where: '${DBValues.dbSupplicationId} IN (${ids.map((id) => '?').join(', ')})', whereArgs: ids);
    final List<SupplicationEntity> favoriteSupplications = resources.isNotEmpty ? resources.map((e) => SupplicationEntity.fromModel(SupplicationModel.fromMap(e))).toList() : [];
    return favoriteSupplications;
  }
}
