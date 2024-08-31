class ChapterModel {
  final int chapterId;
  final String chapterNumber;
  final String chapterTitle;

  ChapterModel({
    required this.chapterId,
    required this.chapterNumber,
    required this.chapterTitle,
  });

  factory ChapterModel.fromMap(Map<dynamic, Object?> map) {
    return ChapterModel(
      chapterId: map['chapter_id'] as int,
      chapterNumber: map['chapter_number'] as String,
      chapterTitle: map['chapter_title'] as String,
    );
  }
}
