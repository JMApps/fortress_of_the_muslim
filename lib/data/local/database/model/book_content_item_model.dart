class BookContentItemModel {
  final int id;
  final String title;
  final String content;

  BookContentItemModel.fromMap(dynamic object)
      : id = object['_id'],
        title = object['title'],
        content = object['content'];
}
