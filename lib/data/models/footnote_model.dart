import '../../core/strings/db_values.dart';

class FootnoteModel {
  final int footnoteId;
  final String footnote;

  const FootnoteModel({
    required this.footnoteId,
    required this.footnote,
  });

  factory FootnoteModel.fromMap(Map<String, Object?> map) {
    return FootnoteModel(
      footnoteId: map[DBValues.dbFootnoteId] as int,
      footnote: map[DBValues.dbFootnote] as String,
    );
  }
}
