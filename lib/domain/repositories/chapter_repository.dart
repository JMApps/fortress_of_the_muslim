import '../entities/chapter_entity.dart';

abstract class ChapterRepository {
  Future<List<ChapterEntity>> getAllChapters();

  Future<ChapterEntity> getChapterById({required int chapterId});

  Future<List<ChapterEntity>> getFavoriteChapters({required List<int> ids});
}