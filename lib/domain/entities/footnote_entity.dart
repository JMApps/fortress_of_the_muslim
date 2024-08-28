import '../../data/models/footnote_model.dart';

class FootnoteEntity {
  final int footnoteId;
  final String footnote;

  FootnoteEntity({
    required this.footnoteId,
    required this.footnote,
  });

  factory FootnoteEntity.fromModel(FootnoteModel model) {
    return FootnoteEntity(
      footnoteId: model.footnoteId,
      footnote: model.footnote,
    );
  }
}
