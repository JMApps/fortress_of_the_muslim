import 'package:fortress_of_the_muslim/data/model/book_content_model.dart';
import 'package:fortress_of_the_muslim/data/model/footnote_model.dart';
import 'package:fortress_of_the_muslim/data/model/main_chapter_model.dart';
import 'package:fortress_of_the_muslim/data/model/main_supplication_model.dart';
import 'package:fortress_of_the_muslim/data/service/database_chapters_service.dart';
import 'package:fortress_of_the_muslim/data/service/database_service.dart';

class DatabaseQuery {
  final DatabaseService _mainDB = DatabaseService();
  final DatabaseChaptersService _chapterDB = DatabaseChaptersService();

  static final DatabaseQuery _instance = DatabaseQuery.internal();
  factory DatabaseQuery() => _instance;
  DatabaseQuery.internal();

  Future<List<MainChapterModel>> getAllChapters() async {
    var dbClient = await _chapterDB.db;
    var res = await dbClient.query('Table_of_chapters');
    List<MainChapterModel>? allChapters = res.isNotEmpty ? res.map((c) => MainChapterModel.fromMap(c)).toList() : null;
    return allChapters!;
  }

  Future<List<MainChapterModel>> getOneChapter(int chapterId) async {
    var dbClient = await _chapterDB.db;
    var res = await dbClient.query('Table_of_chapters', where: 'id == $chapterId');
    List<MainChapterModel>? allChapters = res.isNotEmpty ? res.map((c) => MainChapterModel.fromMap(c)).toList() : null;
    return allChapters!;
  }

  Future<List<MainChapterModel>> getBookmarkChapters() async {
    var dbClient = await _chapterDB.db;
    var res = await dbClient.query('Table_of_chapters', where: 'favorite_state == 1');
    List<MainChapterModel>? bookmarkChapters = res.isNotEmpty ? res.map((c) => MainChapterModel.fromMap(c)).toList() : null;
    return bookmarkChapters!;
  }

  addRemoveFavoriteChapter(int state, int chapterId) async {
    var dbClient = await _chapterDB.db;
    await dbClient.rawQuery('UPDATE Table_of_chapters SET favorite_state = $state WHERE id == $chapterId');
  }

  Future<List<MainSupplicationModel>> getAllSupplications() async {
    var dbClient = await _mainDB.db;
    var res = await dbClient.query('Table_of_supplications');
    List<MainSupplicationModel>? allSupplications = res.isNotEmpty ? res.map((c) => MainSupplicationModel.fromMap(c)).toList() : null;
    return allSupplications!;
  }

  Future<List<MainSupplicationModel>> getBookmarkSupplications() async {
    var dbClient = await _mainDB.db;
    var res = await dbClient.query('Table_of_supplications', where: 'favorite_state == 1');
    List<MainSupplicationModel>? bookmarkSupplications = res.isNotEmpty ? res.map((c) => MainSupplicationModel.fromMap(c)).toList() : null;
    return bookmarkSupplications!;
  }

  addRemoveFavoriteSupplication(int state, int supplicationId) async {
    var dbClient = await _mainDB.db;
    await dbClient.rawQuery('UPDATE Table_of_supplications SET favorite_state = $state WHERE id == $supplicationId');
  }

  Future<List<MainSupplicationModel>> getChapterContentSupplications(int chapterId) async {
    var dbClient = await _mainDB.db;
    var res = await dbClient.query('Table_of_supplications', where: 'sample_by == $chapterId');
    List<MainSupplicationModel>? chapterContentSupplications = res.isNotEmpty ? res.map((c) => MainSupplicationModel.fromMap(c)).toList() : null;
    return chapterContentSupplications!;
  }

  Future<List<BookContentModel>> getOneBookContent(int bookContentIndex) async {
    var dbClient = await _mainDB.db;
    var res = await dbClient.query('Table_of_book_content', where: 'id == $bookContentIndex');
    List<BookContentModel>? oneBookContent = res.isNotEmpty ? res.map((c) => BookContentModel.fromMap(c)).toList() : null;
    return oneBookContent!;
  }

  Future<List<FootnoteModel>> getAllFootnotes() async {
    var dbClient = await _mainDB.db;
    var res = await dbClient.query('Table_of_footnotes');
    List<FootnoteModel>? allFootnotes = res.isNotEmpty ? res.map((c) => FootnoteModel.fromMap(c)).toList() : null;
    return allFootnotes!;
  }

  Future<List<FootnoteModel>> getOneFootnotes(int footnoteId) async {
    var dbClient = await _mainDB.db;
    var res = await dbClient.query('Table_of_footnotes', where: 'id == $footnoteId');
    List<FootnoteModel>? oneFootnote = res.isNotEmpty ? res.map((c) => FootnoteModel.fromMap(c)).toList() : null;
    return oneFootnote!;
  }
}
