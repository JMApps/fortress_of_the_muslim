import '../../data/models/chapter_model.dart';

class ChapterEntity {
  final int chapterId;
  final String chapterNumber;
  final String chapterTitle;
  final int favoriteState;

  ChapterEntity({
    required this.chapterId,
    required this.chapterNumber,
    required this.chapterTitle,
    required this.favoriteState,
  });

  factory ChapterEntity.fromModel(ChapterModel model) {
    return ChapterEntity(
      chapterId: model.chapterId,
      chapterNumber: model.chapterNumber,
      chapterTitle: model.chapterTitle,
      favoriteState: model.favoriteState,
    );
  }
}
