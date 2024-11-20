class DBValues {
  static const String dbName = 'fortress_of_the_muslim.db';
  static const int dbVersion = 2;

  static const Map<String, String> _chapterTableNames = {
    'ru': 'Table_of_chapters_ru',
    'ky': 'Table_of_chapters_ky',
  };

  static String getChapterTableName(String languageCode) {
    return _chapterTableNames[languageCode] ?? _chapterTableNames['ru']!;
  }

  static const String dbChapterId = 'chapter_id';
  static const String dbChapterNumber = 'chapter_number';
  static const String dbChapterTitle = 'chapter_title';

  static const Map<String, String> _footnoteTableNames = {
    'ru': 'Table_of_footnotes_ru',
    'ky': 'Table_of_footnotes_ky',
  };

  static String getFootnoteTableName(String languageCode) {
    return _footnoteTableNames[languageCode] ?? _footnoteTableNames['ru']!;
  }

  static const String dbFootnoteId = 'footnote_id';
  static const String dbFootnote = 'footnote';

  static const Map<String, String> _supplicationTableNames = {
    'ru': 'Table_of_supplications_ru',
    'ky': 'Table_of_supplications_ky',
  };

  static String getSupplicationTableName(String languageCode) {
    return _supplicationTableNames[languageCode] ?? _supplicationTableNames['ru']!;
  }

  static const String dbSupplicationId = 'supplication_id';
  static const String dbArabicText = 'arabic_text';
  static const String dbTranscriptionText = 'transcription_text';
  static const String dbTranslationText = 'translation_text';
  static const String dbNameAudio = 'name_audio';
  static const String dbCounterNumber = 'count_number';

  static const Map<String, String> _bookContentTableNames = {
    'ru': 'Table_of_book_content_ru',
    'ky': 'Table_of_book_content_ky',
  };

  static String getBookContentTableName(String languageCode) {
    return _bookContentTableNames[languageCode] ?? _bookContentTableNames['ru']!;
  }

  static const String dbBookContentId = 'book_content_id';
  static const String dbBookContentTitle = 'book_content_title';
  static const String dbBookContent = 'book_content';

  static const String dbSampleBy = 'sample_by';
}