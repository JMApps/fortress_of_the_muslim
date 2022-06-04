class ChapterContentItemModel {
  final int id;
  String? contentArabic;
  String? contentTranscription;
  final String contentTranslation;
  final String contentForCopyAndShare;
  final int sampleBy;
  String? nameAudio;
  final int favoriteState;

  ChapterContentItemModel.fromMap(dynamic object)
      : id = object['_id'],
        contentArabic = object['content_arabic'],
        contentTranscription = object['content_transcription'],
        contentTranslation = object['content_translation'],
        contentForCopyAndShare = object['content_for_copy_and_share'],
        sampleBy = object['sample_by'],
        nameAudio = object['name_audio'],
        favoriteState = object['favorite_state'];
}
