import '../entities/chapter_entity.dart';
import '../repositories/chapter_repository.dart';

class ChapterUseCase {

  final ChapterRepository _chapterRepository;

  ChapterUseCase(this._chapterRepository);

  Future<List<ChapterEntity>> fetchAllChapters() async {
    return await _chapterRepository.getAllChapters();
  }

  Future<ChapterEntity> fetchChapterById({required int chapterId}) async {
    return await _chapterRepository.getChapterById(chapterId: chapterId);
  }

  Future<List<ChapterEntity>> fetchFavoriteChapters({required int ids}) async {
    return await _chapterRepository.getFavoriteChapters(ids: ids);
  }

  Future<int> addChapterFavorite({required int chapterId}) async {
    return await _chapterRepository.addChapterFavorite(chapterId: chapterId);
  }

  Future<int> removeChapterFavorite({required int chapterId}) async {
    return await _chapterRepository.removeChapterFavorite(chapterId: chapterId);
  }
}