class AboutItem {
  late int _id;
  late String _title;
  late String _content;

  AboutItem(this._id, this._title, this._content);

  AboutItem.fromMap(dynamic obj) {
    this._id = obj['_id'];
    this._title = obj['title'];
    this._content = obj['content'];
  }

  int get id => _id;

  String get title => _title;

  String get content => _content;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['_id'] = _id;
    map['title'] = _title;
    map['content'] = _content;
    return map;
  }
}
