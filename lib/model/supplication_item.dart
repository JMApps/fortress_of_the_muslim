class SupplicationItem {
  late int _id;
  late String _contentArabic;
  late String _contentTranscription;
  late String _contentTranslation;
  late String _contentForCopyAndShare;
  late int _sampleBy;
  late String _nameAudio;
  late int _favoriteState;

  SupplicationItem(
      this._id,
      this._contentArabic,
      this._contentTranscription,
      this._contentTranslation,
      this._contentForCopyAndShare,
      this._sampleBy,
      this._nameAudio,
      this._favoriteState);

  SupplicationItem.fromMap(dynamic obj) {
    this._id = obj['_id'];
    this._contentArabic = obj['content_arabic'];
    this._contentTranscription = obj['content_transcription'];
    this._contentTranslation = obj['content_translation'];
    this._contentForCopyAndShare = obj['content_for_copy_and_share'];
    this._sampleBy = obj['sample_by'];
    this._nameAudio = obj['name_audio'];
    this._favoriteState = obj['favorite_state'];
  }

  int get id => _id;

  String get contentArabic => _contentArabic;

  String get contentTranscription => _contentTranscription;

  String get contentTranslation => _contentTranslation;

  String get contentForCopyAndShare => _contentForCopyAndShare;

  int get sampleBy => _sampleBy;

  String get nameAudio => _nameAudio;

  int get favoriteState => _favoriteState;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['_id'] = _id;
    map['content_arabic'] = _contentArabic;
    map['content_transcription'] = _contentTranscription;
    map['content_translation'] = _contentTranslation;
    map['content_for_copy_and_share'] = _contentForCopyAndShare;
    map['sample_by'] = _sampleBy;
    map['name_audio'] = _nameAudio;
    map['favorite_state'] = _favoriteState;
    return map;
  }
}
