import '../../data/models/book_content_model.dart';

class BookContentEntity {
  final int bookContentId;
  final String bookContentTitle;
  final String bookContent;

  BookContentEntity({
    required this.bookContentId,
    required this.bookContentTitle,
    required this.bookContent,
  });

  factory BookContentEntity.fromModel(BookContentModel model) {
    return BookContentEntity(
      bookContentId: model.bookContentId,
      bookContentTitle: model.bookContentTitle,
      bookContent: model.bookContent,
    );
  }
}
