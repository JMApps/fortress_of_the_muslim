class SupplicationModel {
  final int supplicationId;
  final String? arabicText;
  final String? transcriptionText;
  final String translationText;
  final String? nameAudio;
  final int countNumber;

  SupplicationModel({
    required this.supplicationId,
    required this.arabicText,
    required this.transcriptionText,
    required this.translationText,
    required this.nameAudio,
    required this.countNumber,
  });

  factory SupplicationModel.fromMap(Map<dynamic, String> map) {
    return SupplicationModel(
      supplicationId: map['supplication_id'] as int,
      arabicText: map['arabic_text'],
      transcriptionText: map['transcription_text'],
      translationText: map['translation_text'] as String,
      nameAudio: map['name_audio'],
      countNumber: map['count_number'] as int,
    );
  }
}
