import '../entities/chapter_entity.dart';

abstract class ChapterRepository {
  Future<List<ChapterEntity>> getAllChapters({required String tableName});

  Future<ChapterEntity> getChapterById({required String tableName, required int chapterId});

  Future<List<ChapterEntity>> getFavoriteChapters({required String tableName, required List<int> ids});
}