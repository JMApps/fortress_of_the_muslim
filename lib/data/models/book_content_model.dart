class BookContentModel {
  final int bookContentId;
  final String bookContentTitle;
  final String bookContent;

  BookContentModel({
    required this.bookContentId,
    required this.bookContentTitle,
    required this.bookContent,
  });

  factory BookContentModel.fromMap(Map<dynamic, String> map) {
    return BookContentModel(
      bookContentId: map['book_content_id'] as int,
      bookContentTitle: map['book_content_title'] as String,
      bookContent: map['book_content'] as String,
    );
  }
}
