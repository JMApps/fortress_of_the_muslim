class MainSupplicationModel {
  late final int id;
  late final String? arabicText;
  late final String? transcriptionText;
  late final String translationText;
  late final String contentForShare;
  late final String? nameAudio;
  late final int favoriteState;
  late final int? countNumber;

  MainSupplicationModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    arabicText = map['arabic_text'];
    transcriptionText = map['transcription_text'];
    translationText = map['translation_text'];
    contentForShare = map['content_for_share'];
    nameAudio = map['name_audio'];
    favoriteState = map['favorite_state'];
    countNumber = map['count_number'];
  }
}
