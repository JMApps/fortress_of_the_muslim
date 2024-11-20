
import 'package:sqflite/sqflite.dart';

import '../../core/strings/db_values.dart';
import '../../domain/entities/chapter_entity.dart';
import '../../domain/repositories/chapter_repository.dart';
import '../models/chapter_model.dart';
import '../services/database_service.dart';

class ChapterDataRepository implements ChapterRepository {
  final DatabaseService _databaseService;

  ChapterDataRepository(this._databaseService);

  @override
  Future<List<ChapterEntity>> getAllChapters({required String languageCode}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValues.getChapterTableName(languageCode));
    final List<ChapterEntity> allChapters = resources.isNotEmpty ? resources.map((e) => ChapterEntity.fromModel(ChapterModel.fromMap(e))).toList() : [];
    return allChapters;
  }

  @override
  Future<ChapterEntity> getChapterById({required String languageCode, required int chapterId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValues.getChapterTableName(languageCode), where: '${DBValues.dbChapterId} = ?', whereArgs: [chapterId]);
    final ChapterEntity? chapterById = resources.isNotEmpty ? ChapterEntity.fromModel(ChapterModel.fromMap(resources.first)) : null;
    return chapterById!;
  }

  @override
  Future<List<ChapterEntity>> getFavoriteChapters({required String languageCode, required List<int> ids}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValues.getChapterTableName(languageCode), where: '${DBValues.dbChapterId} IN (${ids.map((id) => '?').join(', ')})', whereArgs: ids);
    final List<ChapterEntity> favoriteChapters = resources.isNotEmpty ? resources.map((e) => ChapterEntity.fromModel(ChapterModel.fromMap(e))).toList() : [];
    return favoriteChapters;
  }
}
