import '../../data/models/supplication_model.dart';

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

  factory SupplicationEntity.fromModel(SupplicationModel model) {
    return SupplicationEntity(
      supplicationId: model.supplicationId,
      arabicText: model.arabicText,
      transcriptionText: model.transcriptionText,
      translationText: model.translationText,
      nameAudio: model.nameAudio,
      sampleBy: model.sampleBy,
      countNumber: model.countNumber,
    );
  }
}
