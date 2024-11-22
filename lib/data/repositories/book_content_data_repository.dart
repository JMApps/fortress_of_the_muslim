import 'package:sqflite/sqflite.dart';

import '../../core/strings/db_values.dart';
import '../../domain/entities/book_content_entity.dart';
import '../../domain/repositories/book_content_repository.dart';
import '../models/book_content_model.dart';
import '../services/database_service.dart';

class BookContentDataRepository implements BookContentRepository {
  final DatabaseService _databaseService;

  BookContentDataRepository(this._databaseService);

  @override
  Future<List<BookContentEntity>> getAllContentBook({required String languageCode}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValues.getBookContentTableName(languageCode));
    final List<BookContentEntity> allBookContents = resources.isNotEmpty ? resources.map((e) => BookContentEntity.fromModel(BookContentModel.fromMap(e))).toList() : [];
    return allBookContents;
  }

  @override
  Future<BookContentEntity> getContentBookById({required String languageCode, required int bookContentId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValues.getBookContentTableName(languageCode), where: '${DBValues.dbBookContentId} = ?', whereArgs: [bookContentId]);
    final BookContentEntity? chapterById = resources.isNotEmpty ? BookContentEntity.fromModel(BookContentModel.fromMap(resources.first)) : null;
    return chapterById!;
  }
}