import '../../core/strings/db_values.dart';

class ChapterModel {
  final int chapterId;
  final String chapterNumber;
  final String chapterTitle;

  const ChapterModel({
    required this.chapterId,
    required this.chapterNumber,
    required this.chapterTitle,
  });

  factory ChapterModel.fromMap(Map<String, Object?> map) {
    return ChapterModel(
      chapterId: map[DBValues.dbChapterId] as int,
      chapterNumber: map[DBValues.dbChapterNumber] as String,
      chapterTitle: map[DBValues.dbChapterTitle] as String,
    );
  }
}
