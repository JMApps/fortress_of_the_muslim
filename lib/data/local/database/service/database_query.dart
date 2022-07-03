import 'package:fortress_of_the_muslim/data/local/database/model/book_content_item_model.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/chapter_content_day_night_item_model.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/chapter_content_item_model.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/favorite_chapter_item_model.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/favorite_supplication_item_model.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/main_chapter_item_model.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/main_supplication_item_model.dart';
import 'package:fortress_of_the_muslim/data/local/database/service/database_service.dart';

class DatabaseQuery {
  DatabaseService con = DatabaseService();

  Future<List<MainChapterItemModel>> getAllChapters() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_chapters');
    List<MainChapterItemModel>? mainChapters = res.isNotEmpty ? res.map((c) => MainChapterItemModel.fromMap(c)).toList() : null;
    return mainChapters!;
  }

  Future<List<MainChapterItemModel>> getOneChapter(int id) async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_chapters', where: '_id == $id');
    List<MainChapterItemModel>? mainChapters = res.isNotEmpty ? res.map((c) => MainChapterItemModel.fromMap(c)).toList() : null;
    return mainChapters!;
  }

  Future<List<FavoriteChapterItemModel>> getFavoriteChapters() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_chapters', where: 'favorite_state == 1');
    List<FavoriteChapterItemModel>? favoriteChapters = res.isNotEmpty ? res.map((c) => FavoriteChapterItemModel.fromMap(c)).toList() : null;
    return favoriteChapters!;
  }

  Future<List<ChapterContentItemModel>> getContentChapter(int id) async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_supplications', where: 'sample_by == $id');
    List<ChapterContentItemModel>? chapterContent = res.isNotEmpty ? res.map((c) => ChapterContentItemModel.fromMap(c)).toList() : null;
    return chapterContent!;
  }

  Future<List<ChapterContentDayNightItemModel>> getDayNightContentChapter(bool dayNight) async {
    var dbClient = await con.db;
    var res = await dbClient.query(dayNight ? 'Table_of_supplications_day' : 'Table_of_supplications_night');
    List<ChapterContentDayNightItemModel>? dayNightContents = res.isNotEmpty ? res.map((c) => ChapterContentDayNightItemModel.fromMap(c)).toList() : null;
    return dayNightContents!;
  }

  Future<List<MainSupplicationItemModel>> getAllSupplications() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_supplications');
    List<MainSupplicationItemModel>? mainSupplications = res.isNotEmpty ? res.map((c) => MainSupplicationItemModel.fromMap(c)).toList() : null;
    return mainSupplications!;
  }

  Future<List<FavoriteSupplicationItemModel>> getFavoriteSupplications() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_supplications', where: 'favorite_state == 1');
    List<FavoriteSupplicationItemModel>? favoriteSupplications = res.isNotEmpty ? res.map((c) => FavoriteSupplicationItemModel.fromMap(c)).toList() : null;
    return favoriteSupplications!;
  }

  Future<List<MainChapterItemModel>> getChapterSearchResult(String keyword) async {
    var dbClient = await con.db;
    var res = await dbClient.rawQuery("SELECT * FROM Table_of_chapters WHERE chapter_number LIKE '%$keyword%' OR chapter_title LIKE '%$keyword%'");
    List<MainChapterItemModel>? searchResult = res.isNotEmpty ? res.map((c) => MainChapterItemModel.fromMap(c)).toList() : null;
    return searchResult!;
  }

  Future<List<MainSupplicationItemModel>> getSupplicationSearchResult(String keyword) async {
    var dbClient = await con.db;
    var res = await dbClient.rawQuery("SELECT * FROM Table_of_supplications WHERE _id LIKE '%$keyword%' OR content_translation LIKE '%$keyword%'");
    List<MainSupplicationItemModel>? searchResult = res.isNotEmpty ? res.map((c) => MainSupplicationItemModel.fromMap(c)).toList() : null;
    return searchResult!;
  }

  addRemoveFavoriteChapter(int state, int chapterId) async {
    var dbClient = await con.db;
    await dbClient.rawQuery('UPDATE Table_of_chapters SET favorite_state = $state WHERE _id == $chapterId');
  }

  addRemoveFavoriteSupplication(int state, int supplicationId) async {
    var dbClient = await con.db;
    await dbClient.rawQuery('UPDATE Table_of_supplications SET favorite_state = $state WHERE _id == $supplicationId');
  }

  Future<List<BookContentItemModel>> getBookContent() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_about_us');
    List<BookContentItemModel>? bookContent = res.isNotEmpty ? res.map((c) => BookContentItemModel.fromMap(c)).toList() : null;
    return bookContent!;
  }
}
