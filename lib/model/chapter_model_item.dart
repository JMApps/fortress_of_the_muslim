class ChapterModelItem {
  late int _id;
  late String _chapterTitle;
  late int _favoriteState;

  ChapterModelItem(this._id, this._chapterTitle, this._favoriteState);

  ChapterModelItem.fromMap(dynamic obj) {
    this._id = obj['_id'];
    this._chapterTitle = obj['chapter_title'];
    this._favoriteState = obj['favorite_state'];
  }

  int get id => _id;

  String get chapterTitle => _chapterTitle;

  int get favoriteState => _favoriteState;
}
