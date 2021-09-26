class SupplicationDayNightItem {
  int? id;
  String? contentArabic;
  String? contentTranscription;
  String? contentTranslation;
  String? contentForCopyAndShare;
  int? buttonState;
  int? buttonCount;
  String? nameAudio;
  int? favoriteState;

  SupplicationDayNightItem(
      this.id,
      this.contentArabic,
      this.contentTranscription,
      this.contentTranslation,
      this.contentForCopyAndShare,
      this.buttonState,
      this.buttonCount,
      this.nameAudio,
      this.favoriteState);

  SupplicationDayNightItem.fromMap(dynamic obj) {
    this.id = obj['_id'];
    this.contentArabic = obj['content_arabic'];
    this.contentTranscription = obj['content_transcription'];
    this.contentTranslation = obj['content_translation'];
    this.contentForCopyAndShare = obj['content_for_copy_and_share'];
    this.buttonState = obj['button_state'];
    this.buttonCount = obj['button_count'];
    this.nameAudio = obj['name_audio'];
    this.favoriteState = obj['favorite_state'];
  }
}
