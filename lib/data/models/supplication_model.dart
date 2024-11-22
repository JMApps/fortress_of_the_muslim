import '../../core/strings/db_values.dart';

class SupplicationModel {
  final int supplicationId;
  final String? arabicText;
  final String? transcriptionText;
  final String translationText;
  final String? nameAudio;
  final int countNumber;

  const SupplicationModel({
    required this.supplicationId,
    required this.arabicText,
    required this.transcriptionText,
    required this.translationText,
    required this.nameAudio,
    required this.countNumber,
  });

  factory SupplicationModel.fromMap(Map<String, Object?> map) {
    return SupplicationModel(
      supplicationId: map[DBValues.dbSupplicationId] as int,
      arabicText: map[DBValues.dbArabicText] as String?,
      transcriptionText: map[DBValues.dbTranscriptionText] as String?,
      translationText: map[DBValues.dbTranslationText] as String,
      nameAudio: map[DBValues.dbNameAudio] as String?,
      countNumber: map[DBValues.dbCounterNumber] as int,
    );
  }
}
