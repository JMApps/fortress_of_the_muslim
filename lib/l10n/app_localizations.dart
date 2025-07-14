import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_kk.dart';
import 'app_localizations_ky.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('kk'),
    Locale('ky'),
    Locale('ru')
  ];

  /// No description provided for @chapterTableName.
  ///
  /// In ru, this message translates to:
  /// **'Table_of_chapters_ru'**
  String get chapterTableName;

  /// No description provided for @supplicationsTableName.
  ///
  /// In ru, this message translates to:
  /// **'Table_of_supplications_ru'**
  String get supplicationsTableName;

  /// No description provided for @footnotesTableName.
  ///
  /// In ru, this message translates to:
  /// **'Table_of_footnotes_ru'**
  String get footnotesTableName;

  /// No description provided for @bookContentTableName.
  ///
  /// In ru, this message translates to:
  /// **'Table_of_book_content_ru'**
  String get bookContentTableName;

  /// No description provided for @appName.
  ///
  /// In ru, this message translates to:
  /// **'Крепость мусульманина'**
  String get appName;

  /// No description provided for @appSlogan.
  ///
  /// In ru, this message translates to:
  /// **' – твоя несокрушимая крепость!'**
  String get appSlogan;

  /// No description provided for @morningPrayers.
  ///
  /// In ru, this message translates to:
  /// **'Время утренних азкаров'**
  String get morningPrayers;

  /// No description provided for @eveningPrayers.
  ///
  /// In ru, this message translates to:
  /// **'Время вечерних азкаров'**
  String get eveningPrayers;

  /// No description provided for @back.
  ///
  /// In ru, this message translates to:
  /// **'Назад'**
  String get back;

  /// No description provided for @toStart.
  ///
  /// In ru, this message translates to:
  /// **'В начало'**
  String get toStart;

  /// No description provided for @chapters.
  ///
  /// In ru, this message translates to:
  /// **'Главы'**
  String get chapters;

  /// No description provided for @chapter.
  ///
  /// In ru, this message translates to:
  /// **'Глава'**
  String get chapter;

  /// No description provided for @collections.
  ///
  /// In ru, this message translates to:
  /// **'Коллекции'**
  String get collections;

  /// No description provided for @showCollections.
  ///
  /// In ru, this message translates to:
  /// **'Отображать коллекции'**
  String get showCollections;

  /// No description provided for @collectionIsEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Вы не создали ни одной коллекции'**
  String get collectionIsEmpty;

  /// No description provided for @collectionSupplicationsIsEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Данная коллекция пуста'**
  String get collectionSupplicationsIsEmpty;

  /// No description provided for @createCollection.
  ///
  /// In ru, this message translates to:
  /// **'Создать коллекцию'**
  String get createCollection;

  /// No description provided for @changeCollection.
  ///
  /// In ru, this message translates to:
  /// **'Изменить коллекцию'**
  String get changeCollection;

  /// No description provided for @deleteCollection.
  ///
  /// In ru, this message translates to:
  /// **'Удалить коллекцию'**
  String get deleteCollection;

  /// No description provided for @enterTitle.
  ///
  /// In ru, this message translates to:
  /// **'Введите название'**
  String get enterTitle;

  /// No description provided for @title.
  ///
  /// In ru, this message translates to:
  /// **'Название (обязательно)'**
  String get title;

  /// No description provided for @enterDescription.
  ///
  /// In ru, this message translates to:
  /// **'Введите описание'**
  String get enterDescription;

  /// No description provided for @description.
  ///
  /// In ru, this message translates to:
  /// **'Описание (необязательно)'**
  String get description;

  /// No description provided for @change.
  ///
  /// In ru, this message translates to:
  /// **'Изменить'**
  String get change;

  /// No description provided for @changed.
  ///
  /// In ru, this message translates to:
  /// **'Изменено'**
  String get changed;

  /// No description provided for @delete.
  ///
  /// In ru, this message translates to:
  /// **'Удалить'**
  String get delete;

  /// No description provided for @deleted.
  ///
  /// In ru, this message translates to:
  /// **'Удалено'**
  String get deleted;

  /// No description provided for @cancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get cancel;

  /// No description provided for @selectSupplications.
  ///
  /// In ru, this message translates to:
  /// **'Выберите дуа'**
  String get selectSupplications;

  /// No description provided for @favoriteChapters.
  ///
  /// In ru, this message translates to:
  /// **'Избранное'**
  String get favoriteChapters;

  /// No description provided for @favoriteChaptersIsEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Избранных глав нет'**
  String get favoriteChaptersIsEmpty;

  /// No description provided for @allSupplications.
  ///
  /// In ru, this message translates to:
  /// **'Все дуа'**
  String get allSupplications;

  /// No description provided for @favoriteSupplications.
  ///
  /// In ru, this message translates to:
  /// **'Избранные дуа'**
  String get favoriteSupplications;

  /// No description provided for @favoriteSupplicationsIsEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Избранных дуа нет'**
  String get favoriteSupplicationsIsEmpty;

  /// No description provided for @search.
  ///
  /// In ru, this message translates to:
  /// **'Начните поиск'**
  String get search;

  /// No description provided for @searchIsEmpty.
  ///
  /// In ru, this message translates to:
  /// **'По вашему запросу ничего не найдено'**
  String get searchIsEmpty;

  /// No description provided for @add.
  ///
  /// In ru, this message translates to:
  /// **'Добавить'**
  String get add;

  /// No description provided for @added.
  ///
  /// In ru, this message translates to:
  /// **'Добавлено'**
  String get added;

  /// No description provided for @removed.
  ///
  /// In ru, this message translates to:
  /// **'Удалено'**
  String get removed;

  /// No description provided for @morning.
  ///
  /// In ru, this message translates to:
  /// **'Утром'**
  String get morning;

  /// No description provided for @evening.
  ///
  /// In ru, this message translates to:
  /// **'Вечером'**
  String get evening;

  /// No description provided for @beforeSleep.
  ///
  /// In ru, this message translates to:
  /// **'Перед сном'**
  String get beforeSleep;

  /// No description provided for @afterPrayer.
  ///
  /// In ru, this message translates to:
  /// **'После молитвы'**
  String get afterPrayer;

  /// No description provided for @istikhara.
  ///
  /// In ru, this message translates to:
  /// **'Истихара'**
  String get istikhara;

  /// No description provided for @counter.
  ///
  /// In ru, this message translates to:
  /// **'Счётчик'**
  String get counter;

  /// No description provided for @counterAlign.
  ///
  /// In ru, this message translates to:
  /// **'Расположение счётчика'**
  String get counterAlign;

  /// No description provided for @readLastChapter.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить чтение || главы'**
  String get readLastChapter;

  /// No description provided for @settings.
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get settings;

  /// No description provided for @settingTexts.
  ///
  /// In ru, this message translates to:
  /// **'Настройки текста'**
  String get settingTexts;

  /// No description provided for @bookContent.
  ///
  /// In ru, this message translates to:
  /// **'Содержимое'**
  String get bookContent;

  /// No description provided for @aboutUs.
  ///
  /// In ru, this message translates to:
  /// **'О нас'**
  String get aboutUs;

  /// No description provided for @copy.
  ///
  /// In ru, this message translates to:
  /// **'Скопировать'**
  String get copy;

  /// No description provided for @copied.
  ///
  /// In ru, this message translates to:
  /// **'Скопировано'**
  String get copied;

  /// No description provided for @share.
  ///
  /// In ru, this message translates to:
  /// **'Поделиться'**
  String get share;

  /// No description provided for @shareWithAudio.
  ///
  /// In ru, this message translates to:
  /// **'Поделиться с аудио'**
  String get shareWithAudio;

  /// No description provided for @font.
  ///
  /// In ru, this message translates to:
  /// **'Шрифт'**
  String get font;

  /// No description provided for @arabicFontNames.
  ///
  /// In ru, this message translates to:
  /// **'Hafs, Noto Naskh, Scheherazade'**
  String get arabicFontNames;

  /// No description provided for @translationFontNames.
  ///
  /// In ru, this message translates to:
  /// **'Gilroy, SF Pro, Montserrat'**
  String get translationFontNames;

  /// No description provided for @align.
  ///
  /// In ru, this message translates to:
  /// **'Расположение'**
  String get align;

  /// No description provided for @textsAlign.
  ///
  /// In ru, this message translates to:
  /// **'Расположение текста'**
  String get textsAlign;

  /// No description provided for @alignStart.
  ///
  /// In ru, this message translates to:
  /// **'По левому краю'**
  String get alignStart;

  /// No description provided for @alignCenter.
  ///
  /// In ru, this message translates to:
  /// **'По центру'**
  String get alignCenter;

  /// No description provided for @alignEnd.
  ///
  /// In ru, this message translates to:
  /// **'По правому краю'**
  String get alignEnd;

  /// No description provided for @alignJustify.
  ///
  /// In ru, this message translates to:
  /// **'По обоим краям'**
  String get alignJustify;

  /// No description provided for @textSize.
  ///
  /// In ru, this message translates to:
  /// **'Размер текста'**
  String get textSize;

  /// No description provided for @fontSizeNames.
  ///
  /// In ru, this message translates to:
  /// **'Маленький, Нормальный, Средний, Большой, Очень большой, Максимальный'**
  String get fontSizeNames;

  /// No description provided for @counterValues.
  ///
  /// In ru, this message translates to:
  /// **'Без ограничений, После молитвы, 100'**
  String get counterValues;

  /// No description provided for @counterAligns.
  ///
  /// In ru, this message translates to:
  /// **'Слева, По центру, Справа'**
  String get counterAligns;

  /// No description provided for @playSpeed.
  ///
  /// In ru, this message translates to:
  /// **'Скорость воспроизведения'**
  String get playSpeed;

  /// No description provided for @repeatOn.
  ///
  /// In ru, this message translates to:
  /// **'Повтор включен'**
  String get repeatOn;

  /// No description provided for @repeatOff.
  ///
  /// In ru, this message translates to:
  /// **'Повтор выключен'**
  String get repeatOff;

  /// No description provided for @playSpeedNames.
  ///
  /// In ru, this message translates to:
  /// **'1x, 0.9x, 0.8x, 0.7x, 0.6x, 0.5x'**
  String get playSpeedNames;

  /// No description provided for @remindMorning.
  ///
  /// In ru, this message translates to:
  /// **'Напоминать утром'**
  String get remindMorning;

  /// No description provided for @remindEvening.
  ///
  /// In ru, this message translates to:
  /// **'Напоминать вечером'**
  String get remindEvening;

  /// No description provided for @listChapters.
  ///
  /// In ru, this message translates to:
  /// **'Список глав'**
  String get listChapters;

  /// No description provided for @openWithListChapters.
  ///
  /// In ru, this message translates to:
  /// **'Открывать со списка глав'**
  String get openWithListChapters;

  /// No description provided for @display.
  ///
  /// In ru, this message translates to:
  /// **'Дисплей'**
  String get display;

  /// No description provided for @displayAlwaysOn.
  ///
  /// In ru, this message translates to:
  /// **'Дисплей всегда включён'**
  String get displayAlwaysOn;

  /// No description provided for @themeColor.
  ///
  /// In ru, this message translates to:
  /// **'Цвет темы'**
  String get themeColor;

  /// No description provided for @selectThemeColor.
  ///
  /// In ru, this message translates to:
  /// **'Выберите цвет темы'**
  String get selectThemeColor;

  /// No description provided for @theme.
  ///
  /// In ru, this message translates to:
  /// **'Тема'**
  String get theme;

  /// No description provided for @themeApp.
  ///
  /// In ru, this message translates to:
  /// **'Тема приложения'**
  String get themeApp;

  /// No description provided for @themeModeNames.
  ///
  /// In ru, this message translates to:
  /// **'Дневная, Ночная, Система'**
  String get themeModeNames;

  /// No description provided for @language.
  ///
  /// In ru, this message translates to:
  /// **'Язык'**
  String get language;

  /// No description provided for @appLanguage.
  ///
  /// In ru, this message translates to:
  /// **'Язык приложения'**
  String get appLanguage;

  /// No description provided for @textColor.
  ///
  /// In ru, this message translates to:
  /// **'Цвет текста'**
  String get textColor;

  /// No description provided for @arabic.
  ///
  /// In ru, this message translates to:
  /// **'Арабский'**
  String get arabic;

  /// No description provided for @transcription.
  ///
  /// In ru, this message translates to:
  /// **'Транскрипция'**
  String get transcription;

  /// No description provided for @showTranscription.
  ///
  /// In ru, this message translates to:
  /// **'Показывать транскрипцию'**
  String get showTranscription;

  /// No description provided for @translation.
  ///
  /// In ru, this message translates to:
  /// **'Перевод'**
  String get translation;

  /// No description provided for @defaultSettings.
  ///
  /// In ru, this message translates to:
  /// **'По умолчанию'**
  String get defaultSettings;

  /// No description provided for @forLightTheme.
  ///
  /// In ru, this message translates to:
  /// **'Для дневной темы'**
  String get forLightTheme;

  /// No description provided for @forDarkTheme.
  ///
  /// In ru, this message translates to:
  /// **'Для ночной темы'**
  String get forDarkTheme;

  /// No description provided for @close.
  ///
  /// In ru, this message translates to:
  /// **'Закрыть'**
  String get close;

  /// No description provided for @ourApps.
  ///
  /// In ru, this message translates to:
  /// **'Наши приложения'**
  String get ourApps;

  /// No description provided for @moreOurApps.
  ///
  /// In ru, this message translates to:
  /// **'Больше наших приложений'**
  String get moreOurApps;

  /// No description provided for @appStore.
  ///
  /// In ru, this message translates to:
  /// **'App Store'**
  String get appStore;

  /// No description provided for @googlePlay.
  ///
  /// In ru, this message translates to:
  /// **'Google Play'**
  String get googlePlay;

  /// No description provided for @ourSocials.
  ///
  /// In ru, this message translates to:
  /// **'Наши соцсети'**
  String get ourSocials;

  /// No description provided for @telegram.
  ///
  /// In ru, this message translates to:
  /// **'Telegram'**
  String get telegram;

  /// No description provided for @ummaLife.
  ///
  /// In ru, this message translates to:
  /// **'UmmaLife'**
  String get ummaLife;

  /// No description provided for @instagram.
  ///
  /// In ru, this message translates to:
  /// **'Instagram'**
  String get instagram;

  /// No description provided for @jmapps.
  ///
  /// In ru, this message translates to:
  /// **'@jmapps'**
  String get jmapps;

  /// No description provided for @devMuslim.
  ///
  /// In ru, this message translates to:
  /// **'@dev_muslim'**
  String get devMuslim;

  /// No description provided for @linkGooglePlay.
  ///
  /// In ru, this message translates to:
  /// **'https://play.google.com/store/apps/dev?id=8649252597553656018'**
  String get linkGooglePlay;

  /// No description provided for @linkAppStore.
  ///
  /// In ru, this message translates to:
  /// **'https://apps.apple.com/ru/developer/imanil-binyaminov/id1564920953'**
  String get linkAppStore;

  /// No description provided for @versionAndroid.
  ///
  /// In ru, this message translates to:
  /// **'Версия Android:'**
  String get versionAndroid;

  /// No description provided for @versionIOS.
  ///
  /// In ru, this message translates to:
  /// **'Версия iOS:'**
  String get versionIOS;

  /// No description provided for @linkAndroid.
  ///
  /// In ru, this message translates to:
  /// **'https://play.google.com/store/apps/details?id=jmapps.fortressofthemuslim'**
  String get linkAndroid;

  /// No description provided for @linkIOS.
  ///
  /// In ru, this message translates to:
  /// **'https://apps.apple.com/ru/app/крепость-верующего/id1564920951'**
  String get linkIOS;

  /// No description provided for @linkTelegram.
  ///
  /// In ru, this message translates to:
  /// **'https://t.me/jmapps'**
  String get linkTelegram;

  /// No description provided for @linkInstagram.
  ///
  /// In ru, this message translates to:
  /// **'https://instagram.com/dev_muslim'**
  String get linkInstagram;

  /// No description provided for @linkUmmaLife.
  ///
  /// In ru, this message translates to:
  /// **'https://ummalife.com/jmapps'**
  String get linkUmmaLife;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'kk', 'ky', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'kk':
      return AppLocalizationsKk();
    case 'ky':
      return AppLocalizationsKy();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
