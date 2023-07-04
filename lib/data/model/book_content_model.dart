class BookContentModel {
  late final int id;
  late final String title;
  late final String content;

  BookContentModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    content = map['content'];
  }
}
