class SupplicationModelItem {
  int? id;
  String? contentArabic;
  String? contentTranscription;
  String? contentTranslation;
  String? contentForCopyAndShare;
  int? sampleBy;
  String? nameAudio;
  int? favoriteState;

  SupplicationModelItem(
      this.id,
      this.contentArabic,
      this.contentTranscription,
      this.contentTranslation,
      this.contentForCopyAndShare,
      this.sampleBy,
      this.nameAudio,
      this.favoriteState);

  SupplicationModelItem.fromMap(dynamic obj) {
    this.id = obj['_id'];
    this.contentArabic = obj['content_arabic'];
    this.contentTranscription = obj['content_transcription'];
    this.contentTranslation = obj['content_translation'];
    this.contentForCopyAndShare = obj['content_for_copy_and_share'];
    this.sampleBy = obj['sample_by'];
    this.nameAudio = obj['name_audio'];
    this.favoriteState = obj['favorite_state'];
  }
}
