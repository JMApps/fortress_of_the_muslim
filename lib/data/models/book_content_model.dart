import '../../core/strings/db_values.dart';

class BookContentModel {
  final int bookContentId;
  final String bookTitle;
  final String bookContent;

  BookContentModel({
    required this.bookContentId,
    required this.bookTitle,
    required this.bookContent,
  });

  factory BookContentModel.fromMap(Map<dynamic, String> map) {
    return BookContentModel(
      bookContentId: map[DBValues.dbBookContentId] as int,
      bookTitle: map[DBValues.dbBookTitle] as String,
      bookContent: map[DBValues.dbBookContent] as String,
    );
  }
}
