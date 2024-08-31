class FootnoteModel {
  final int footnoteId;
  final String footnote;

  FootnoteModel({
    required this.footnoteId,
    required this.footnote,
  });

  factory FootnoteModel.fromMap(Map<dynamic, String> map) {
    return FootnoteModel(
      footnoteId: map['footnote_id'] as int,
      footnote: map['footnote'] as String,
    );
  }
}
