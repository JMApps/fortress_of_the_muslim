import 'package:fortress_of_the_muslim/model/about_item.dart';
import 'package:fortress_of_the_muslim/model/chapter_model_item.dart';
import 'package:fortress_of_the_muslim/model/supplication_day_night_item.dart';
import 'package:fortress_of_the_muslim/model/supplication_model_item.dart';

import 'database_helper.dart';

class DatabaseQuery {
  DatabaseHelper con = DatabaseHelper();

  Future<List<ChapterModelItem>> getAllChapters() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_chapters');
    List<ChapterModelItem>? mainChapters = res.isNotEmpty ? res.map((c) => ChapterModelItem.fromMap(c)).toList() : null;
    return mainChapters!;
  }

  Future<List<ChapterModelItem>> getChapterSearchResult(String text) async {
    var dbClient = await con.db;
    var res = await dbClient.rawQuery("SELECT * FROM Table_of_chapters WHERE _id LIKE '%$text%' OR chapter_title LIKE '%$text%'");
    List<ChapterModelItem>? searchResult = res.isNotEmpty ? res.map((c) => ChapterModelItem.fromMap(c)).toList() : null;
    return searchResult!;
  }

  addRemoveFavoriteChapter(int state, int _id) async {
    var dbClient = await con.db;
    await dbClient.rawQuery('UPDATE Table_of_chapters SET favorite_state = $state WHERE _id == $_id');
  }

  Future<List<ChapterModelItem>> getFavoriteChapters() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_chapters', where: 'favorite_state == 1');
    List<ChapterModelItem>? favoriteChapters = res.isNotEmpty ? res.map((c) => ChapterModelItem.fromMap(c)).toList() : null;
    return favoriteChapters!;
  }

  Future<List<SupplicationModelItem>> getAllSupplications() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_supplications');
    List<SupplicationModelItem>? listSupplications = res.isNotEmpty ? res.map((c) => SupplicationModelItem.fromMap(c)).toList() : null;
    return listSupplications!;
  }

  Future<List<SupplicationModelItem>> getSupplicationSearchResult(String text) async {
    var dbClient = await con.db;
    var res = await dbClient.rawQuery("SELECT * FROM Table_of_supplications WHERE _id LIKE '%$text%' OR content_translation LIKE '%$text%'");
    List<SupplicationModelItem>? searchResult = res.isNotEmpty ? res.map((c) => SupplicationModelItem.fromMap(c)).toList() : null;
    return searchResult!;
  }

  addRemoveFavoriteSupplication(int state, int _id) async {
    var dbClient = await con.db;
    await dbClient.rawQuery('UPDATE Table_of_supplications SET favorite_state = $state WHERE _id == $_id');
  }

  Future<List<SupplicationModelItem>> getFavoriteSupplications() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_supplications', where: 'favorite_state == 1');
    List<SupplicationModelItem>? favoriteSupplications = res.isNotEmpty ? res.map((c) => SupplicationModelItem.fromMap(c)).toList() : null;
    return favoriteSupplications!;
  }

  Future<List<SupplicationModelItem>> getContentChapter(int _id) async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_supplications', where: 'sample_by == $_id');
    List<SupplicationModelItem>? chapterSupplications = res.isNotEmpty ? res.map((c) => SupplicationModelItem.fromMap(c)).toList() : null;
    return chapterSupplications!;
  }

  Future<List<AboutItem>> getAboutUs() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_about_us');
    List<AboutItem>? aboutBook = res.isNotEmpty ? res.map((c) => AboutItem.fromMap(c)).toList() : null;
    return aboutBook!;
  }


  Future<List<AboutItem>> getAboutUsContent(int _id) async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_about_us', where: '_id == $_id');
    List<AboutItem>? aboutBook = res.isNotEmpty ? res.map((c) => AboutItem.fromMap(c)).toList() : null;
    return aboutBook!;
  }

  Future<List<SupplicationDayNightItem>> getDayNightSupplications(bool dayNight) async {
    var dbClient = await con.db;
    var res = await dbClient.query(dayNight ? 'Table_of_supplications_day' : 'Table_of_supplication_night');
    List<SupplicationDayNightItem>? dayNightSupplications = res.isNotEmpty ? res.map((c) => SupplicationDayNightItem.fromMap(c)).toList() : null;
    return dayNightSupplications!;
  }
}