import 'package:fortress_of_the_muslim/model/chapter_item.dart';
import 'package:fortress_of_the_muslim/model/supplication_item.dart';

import 'database_helper.dart';

class DatabaseQuery {
  DatabaseHelper con = DatabaseHelper();

  Future<List<ChapterItem>> getAllChapters() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_chapters');
    List<ChapterItem> mainChapters =
        res.isNotEmpty ? res.map((c) => ChapterItem.fromMap(c)).toList() : null;
    return mainChapters;
  }

  Future<List<ChapterItem>> getChapterSearchResult(String text) async {
    var dbClient = await con.db;
    var res = await dbClient.rawQuery(
        "SELECT * FROM Table_of_chapters WHERE _id LIKE '%$text%' OR chapter_title LIKE '%$text%'");
    List<ChapterItem> searchResult =
        res.isNotEmpty ? res.map((c) => ChapterItem.fromMap(c)).toList() : null;
    return searchResult;
  }

  addRemoveFavoriteChapter(int state, int _id) async {
    var dbClient = await con.db;
    await dbClient.rawQuery(
        'UPDATE Table_of_chapters SET favorite_state = $state WHERE _id == $_id');
  }

  Future<List<ChapterItem>> getFavoriteChapters() async {
    var dbClient = await con.db;
    var res =
        await dbClient.query('Table_of_chapters', where: 'favorite_state == 1');
    List<ChapterItem> favoriteChapters =
        res.isNotEmpty ? res.map((c) => ChapterItem.fromMap(c)).toList() : null;
    return favoriteChapters;
  }

  Future<List<SupplicationItem>> getAllSupplications() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_supplications');
    List<SupplicationItem> listSupplications = res.isNotEmpty
        ? res.map((c) => SupplicationItem.fromMap(c)).toList()
        : null;
    return listSupplications;
  }

  Future<List<SupplicationItem>> getSupplicationSearchResult(
      String text) async {
    var dbClient = await con.db;
    var res = await dbClient.rawQuery(
        "SELECT * FROM Table_of_supplications WHERE _id LIKE '%$text%' OR content_translation LIKE '%$text%'");
    List<SupplicationItem> searchResult = res.isNotEmpty
        ? res.map((c) => SupplicationItem.fromMap(c)).toList()
        : null;
    return searchResult;
  }

  addRemoveFavoriteSupplication(int state, int _id) async {
    var dbClient = await con.db;
    await dbClient.rawQuery(
        'UPDATE Table_of_supplications SET favorite_state = $state WHERE _id == $_id');
  }
}
