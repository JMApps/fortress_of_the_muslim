class ChapterItem {
  late int _id;
  late String _chapterTitle;
  late int _favoriteState;

  ChapterItem(this._id, this._chapterTitle, this._favoriteState);

  ChapterItem.fromMap(dynamic obj) {
    this._id = obj['_id'];
    this._chapterTitle = obj['chapter_title'];
    this._favoriteState = obj['favorite_state'];
  }

  int get id => _id;

  String get chapterTitle => _chapterTitle;

  int get favoriteState => _favoriteState;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['_id'] = _id;
    map['chapter_title'] = _chapterTitle;
    map['favorite_state'] = _favoriteState;
    return map;
  }
}