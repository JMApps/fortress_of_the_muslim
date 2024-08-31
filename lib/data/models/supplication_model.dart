import '../../core/strings/db_values.dart';

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
      supplicationId: map[DBValues.dbSupplicationId] as int,
      arabicText: map[DBValues.dbArabicText],
      transcriptionText: map[DBValues.dbTranscriptionText],
      translationText: map[DBValues.dbTranslationText] as String,
      nameAudio: map[DBValues.dbNameAudio],
      countNumber: map[DBValues.dbCounterNumber] as int,
    );
  }
}
