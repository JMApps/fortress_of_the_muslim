import '../entities/chapter_entity.dart';
import '../repositories/chapter_repository.dart';

class ChapterUseCase {

  final ChapterRepository _chapterRepository;

  ChapterUseCase(this._chapterRepository);

  Future<List<ChapterEntity>> fetchAllChapters({required String languageCode}) async {
    try {
      return await _chapterRepository.getAllChapters(tableName: languageCode);
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<ChapterEntity> fetchChapterById({required String languageCode, required int chapterId}) async {
    try {
      return await _chapterRepository.getChapterById(tableName: languageCode, chapterId: chapterId);
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<List<ChapterEntity>> fetchFavoriteChapters({required String languageCode, required List<int> ids}) async {
    try {
      return await _chapterRepository.getFavoriteChapters(tableName: languageCode, ids: ids);
    } catch (e) {
      throw Exception('$e');
    }
  }
}