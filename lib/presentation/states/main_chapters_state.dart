import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/strings/app_constraints.dart';
import '../../domain/entities/chapter_entity.dart';
import '../../domain/usecases/chapter_use_case.dart';

class MainChaptersState extends ChangeNotifier {
  final _mainAppSettingsBox = Hive.box(AppConstraints.keyMainSettingsBox);

  final ChapterUseCase _chapterUseCase;

  late Future<List<ChapterEntity>> _futureMainChapters;

  MainChaptersState(this._chapterUseCase) {
    _favoriteChapterIds = _mainAppSettingsBox.get(AppConstraints.keyChapterIds, defaultValue: <int>[]);
    _lastChapterId = _mainAppSettingsBox.get(AppConstraints.keyLastSavedChapter, defaultValue: 1);
    _futureMainChapters = _getAllChapters();
  }

  late List<int> _favoriteChapterIds = [];

  List<int> get getFavoriteChapterIds => _favoriteChapterIds;

  Future<List<ChapterEntity>> _getAllChapters() async {
    return await _chapterUseCase.fetchAllChapters();
  }

  Future<ChapterEntity> getChapterById({required int chapterId}) async {
    return await _chapterUseCase.fetchChapterById(chapterId: chapterId);
  }

  Future<List<ChapterEntity>> getFavoriteChapters({required List<int> ids}) async {
    return await _chapterUseCase.fetchFavoriteChapters(ids: ids);
  }

  Future<List<ChapterEntity>> fetchChapters() {
    return _futureMainChapters;
  }

  void toggleChapterFavorite({required int chapterId}) async {
    final bool exist = _favoriteChapterIds.contains(chapterId);
    if (exist) {
      _favoriteChapterIds.remove(chapterId);
    } else {
      _favoriteChapterIds.add(chapterId);
    }
    await _mainAppSettingsBox.put(AppConstraints.keyChapterIds, _favoriteChapterIds);
    notifyListeners();
  }

  bool chapterIsFavorite(int chapterId) {
    return _favoriteChapterIds.contains(chapterId);
  }

  late int _lastChapterId;

  int get getLastChapterId => _lastChapterId;

  void saveLastChapter(int chapterId) async {
    _lastChapterId = chapterId;
    await _mainAppSettingsBox.put(AppConstraints.keyLastSavedChapter, chapterId);
    notifyListeners();
  }
}