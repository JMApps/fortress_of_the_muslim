class SupplicationEntity {
  final int supplicationId;
  final String arabicText;
  final String? transcriptionText;
  final String? translationText;
  final String? nameAudio;
  final int sampleBy;
  final int countNumber;

  SupplicationEntity({
    required this.supplicationId,
    required this.arabicText,
    required this.transcriptionText,
    required this.translationText,
    required this.nameAudio,
    required this.sampleBy,
    required this.countNumber,
  });
}
