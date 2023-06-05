class MainChapterModel {
  late final int id;
  late final String chapterNumber;
  late final String chapterTitle;
  late final int favoriteState;

  MainChapterModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    chapterNumber = map['chapter_number'];
    chapterTitle = map['chapter_title'];
    favoriteState = map['favorite_state'];
  }
}
