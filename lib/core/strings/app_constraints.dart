import 'dart:ui';

class AppConstraints {
  static const String keyMainSettingsBox = 'key_main_settings';
  static const String keyCounterBox = 'key_counter';
  static const String keyContentSettingsBox = 'key_content_settings';

  static const String keyChapterIds = 'key_favorite_chapters';
  static const String keySupplicationIds = 'key_favorite_supplications';

  static const String keyLastSavedChapter = 'key_last_saved_chapter';

  static const String keyArabicFontIndex = 'key_arabic_font_index';
  static const String keyArabicFontSizeIndex = 'key_arabic_size_index';
  static const String keyArabicFontAlignIndex = 'key_arabic_align_index';
  static const String keyArabicLightColor = 'key_arabic_light_color_index';
  static const String keyArabicDarkColor = 'key_arabic_dark_color_index';

  static const String keyTranscriptionFontIndex = 'key_transcription_font_index';
  static const String keyTranscriptionFontSizeIndex = 'key_transcription_size_index';
  static const String keyTranscriptionFontAlignIndex = 'key_transcription_align_index';
  static const String keyTranscriptionLightColor = 'key_transcription_light_color_index';
  static const String keyTranscriptionDarkColor = 'key_transcription_dark_color_index';

  static const String keyTranslationFontIndex = 'key_translation_font_index';
  static const String keyTranslationFontSizeIndex = 'key_translation_size_index';
  static const String keyTranslationFontAlignIndex = 'key_translation_align_index';
  static const String keyTranslationLightColor = 'key_translation_light_color_index';
  static const String keyTranslationDarkColor = 'key_translation_dark_color_index';

  static const String keyShowTranscriptionState = 'key_show_transcription_state';
  static const String keyCounterAlignIndex = 'key_counter_align_index';

  static const String keyFreeCountValue = 'key_free_count_number';

  static const String keyMorningNotificationState = 'key_morning_notification';
  static const String keyEveningNotificationState = 'key_evening_notification';
  static const String keyMorningNotificationTime = 'key_morning_notification_time';
  static const String keyEveningNotificationTime = 'key_evening_notification_time';
  static const String keyOpenWithChapters = 'key_run_chapters';
  static const String keyDisplayAlwaysOn = 'key_display_on_off';
  static const String keyAppThemeColor = 'key_app_theme_color';
  static const String keyThemeModeIndex = 'key_theme_mode_index';
  static const String keyAppLocaleIndex = 'key_app_locale_index';
  static const String keyShowCollections = 'key_show_collections';

  static const String keyPlaySpeedIndex = 'key_play_speed_index';

  static const String fontGilroy = 'Gilroy';
  static const String fontSFPro = 'SF Pro';

  static const List<String> appLanguages = [
    'Русский',
    'Кыргызча',
    'Қазақша',
  ];

  static const List<Locale> appLocales = [
    Locale('ru', 'RU'),
    Locale('ky', 'KG'),
    Locale('kk', 'KZ'),
  ];
}