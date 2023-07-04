class FootnoteModel {
  late final int id;
  late final String footnote;

  FootnoteModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    footnote = map['footnote'];
  }
}
