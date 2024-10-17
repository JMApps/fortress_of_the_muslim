import '../entities/chapter_entity.dart';
import '../repositories/chapter_repository.dart';

class ChapterUseCase {

  final ChapterRepository _chapterRepository;

  ChapterUseCase(this._chapterRepository);

  Future<List<ChapterEntity>> fetchAllChapters() async {
    try {
      return await _chapterRepository.getAllChapters();
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<ChapterEntity> fetchChapterById({required int chapterId}) async {
    try {
      return await _chapterRepository.getChapterById(chapterId: chapterId);
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<List<ChapterEntity>> fetchFavoriteChapters({required List<int> ids}) async {
    try {
      return await _chapterRepository.getFavoriteChapters(ids: ids);
    } catch (e) {
      throw Exception('$e');
    }
  }
}