class OtherModelItem {
  late int _id;
  late String _title;
  late String _content;

  OtherModelItem(this._id, this._title, this._content);

  OtherModelItem.fromMap(dynamic obj) {
    this._id = obj['_id'];
    this._title = obj['title'];
    this._content = obj['content'];
  }

  int get id => _id;

  String get title => _title;

  String get content => _content;
}
