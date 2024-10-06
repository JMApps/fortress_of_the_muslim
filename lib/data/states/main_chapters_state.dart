import 'package:flutter/material.dart';

import '../../domain/entities/chapter_entity.dart';
import '../../domain/usecases/chapter_use_case.dart';

class MainChaptersState extends ChangeNotifier {
  final ChapterUseCase _chapterUseCase;

  MainChaptersState(this._chapterUseCase);

  Future<List<ChapterEntity>> getAllChapters() async {
    return await _chapterUseCase.fetchAllChapters();
  }

  Future<ChapterEntity> getChapterById({required int chapterId}) async {
    return await _chapterUseCase.fetchChapterById(chapterId: chapterId);
  }

  Future<List<ChapterEntity>> getFavoriteChapters({required List<int> ids}) async {
    return await _chapterUseCase.fetchFavoriteChapters(ids: ids);
  }

  Future<int> addChapterFavorite({required int chapterId}) async {
    throw UnimplementedError();
  }

  Future<int> removeChapterFavorite({required int chapterId}) async {
    throw UnimplementedError();
  }
}