import '../entities/chapter_entity.dart';

abstract class ChapterRepository {
  Future<List<ChapterEntity>> getAllChapters({required String languageCode});

  Future<ChapterEntity> getChapterById({required String languageCode, required int chapterId});

  Future<List<ChapterEntity>> getFavoriteChapters({required String languageCode, required List<int> ids});
}