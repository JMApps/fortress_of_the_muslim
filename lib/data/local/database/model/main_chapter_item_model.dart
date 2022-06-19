class MainChapterItemModel {
  final int id;
  final String chapterNumber;
  final String chapterTitle;
  final int favoriteState;

  MainChapterItemModel.fromMap(dynamic object)
      : id = object['_id'],
        chapterNumber = object['chapter_number'],
        chapterTitle = object['chapter_title'],
        favoriteState = object['favorite_state'];
}
