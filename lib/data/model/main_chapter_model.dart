class MainChapterModel {
  late final int id;
  late final String chapterNumber;
  late final String chapterNumberEn;
  late final String chapterTitle;
  late final String chapterTitleEn;
  late final int favoriteState;

  MainChapterModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    chapterNumber = map['chapter_number'];
    chapterNumberEn = map['chapter_number_en'];
    chapterTitle = map['chapter_title'];
    chapterTitleEn = map['chapter_title_en'];
    favoriteState = map['favorite_state'];
  }
}
