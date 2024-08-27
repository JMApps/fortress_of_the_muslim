import '../entities/chapter_entity.dart';

abstract class ChapterRepository {
  Future<List<ChapterEntity>> getAllChapters();

  Future<ChapterEntity> getChapterById({required int chapterId});

  Future<List<ChapterEntity>> getFavoriteChapters({required int ids});

  Future<int> addChapterFavorite({required int chapterId});

  Future<int> removeChapterFavorite({required int chapterId});
}