class MainChapterItemModel {
  final int id;
  final String chapterSubTitle;
  final int favoriteState;

  MainChapterItemModel.fromMap(dynamic object)
      : id = object['_id'],
        chapterSubTitle = object['chapter_title'],
        favoriteState = object['favorite_state'];
}
