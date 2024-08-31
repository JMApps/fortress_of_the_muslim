import 'package:flutter/material.dart';

import '../../domain/entities/chapter_entity.dart';
import '../../domain/usecases/chapter_use_case.dart';
import '../repositories/chapter_data_repository.dart';

class MainChaptersState extends ChangeNotifier {
  final ChapterUseCase _chapterUseCase = ChapterUseCase(ChapterDataRepository());

  Future<List<ChapterEntity>> getAllChapters() async {
    return await _chapterUseCase.fetchAllChapters();
  }

  Future<ChapterEntity> getChapterById({required int chapterId}) async {
    return await _chapterUseCase.fetchChapterById(chapterId: chapterId);
  }

  Future<List<ChapterEntity>> getFavoriteChapters({required int ids}) async {
    return await _chapterUseCase.fetchFavoriteChapters(ids: ids);
  }

  Future<int> addChapterFavorite({required int chapterId}) async {
    throw UnimplementedError();
  }

  Future<int> removeChapterFavorite({required int chapterId}) async {
    throw UnimplementedError();
  }
}