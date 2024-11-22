import '../../core/strings/db_values.dart';

class BookContentModel {
  final int bookContentId;
  final String bookContentTitle;
  final String bookContent;

  const BookContentModel({
    required this.bookContentId,
    required this.bookContentTitle,
    required this.bookContent,
  });

  factory BookContentModel.fromMap(Map<String, Object?> map) {
    return BookContentModel(
      bookContentId: map[DBValues.dbBookContentId] as int,
      bookContentTitle: map[DBValues.dbBookContentTitle] as String,
      bookContent: map[DBValues.dbBookContent] as String,
    );
  }
}
