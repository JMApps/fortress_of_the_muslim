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

  Future<List<ChapterEntity>> fetchFavoriteChapters({required List<int> ids}) async {
    return await _chapterRepository.getFavoriteChapters(ids: ids);
  }
}