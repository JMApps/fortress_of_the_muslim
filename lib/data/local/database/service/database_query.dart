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

  Future<List<FavoriteChapterItemModel>> getFavoriteChapters() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_chapters', where: 'favorite_state == 1');
    List<FavoriteChapterItemModel>? favoriteChapters = res.isNotEmpty ? res.map((c) => FavoriteChapterItemModel.fromMap(c)).toList() : null;
    return favoriteChapters!;
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
    var res = await dbClient.rawQuery("SELECT * FROM Table_of_chapters WHERE _id LIKE '%$keyword%' OR chapter_title LIKE '%$keyword%'");
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
    var res = await dbClient.rawQuery('UPDATE Table_of_chapters SET favorite_state = $state WHERE _id == $chapterId');
  }

  addRemoveFavoriteSupplication(int state, int supplicationId) async {
    var dbClient = await con.db;
    await dbClient.rawQuery('UPDATE Table_of_supplications SET favorite_state = $state WHERE _id == $supplicationId');
  }

  // Future<List<SupplicationModelItem>> getSupplicationSearchResult(String text) async {
  //   var dbClient = await con.db;
  //   var res = await dbClient.rawQuery("SELECT * FROM Table_of_supplications WHERE _id LIKE '%$text%' OR content_translation LIKE '%$text%'");
  //   List<SupplicationModelItem>? searchResult = res.isNotEmpty ? res.map((c) => SupplicationModelItem.fromMap(c)).toList() : null;
  //   return searchResult!;
  // }
  //

  // Future<List<SupplicationModelItem>> getContentChapter(int _id) async {
  //   var dbClient = await con.db;
  //   var res = await dbClient.query('Table_of_supplications', where: 'sample_by == $_id');
  //   List<SupplicationModelItem>? chapterSupplications = res.isNotEmpty ? res.map((c) => SupplicationModelItem.fromMap(c)).toList() : null;
  //   return chapterSupplications!;
  // }
  //
  // Future<List<OtherModelItem>> getAboutUs() async {
  //   var dbClient = await con.db;
  //   var res = await dbClient.query('Table_of_about_us');
  //   List<OtherModelItem>? aboutBook = res.isNotEmpty ? res.map((c) => OtherModelItem.fromMap(c)).toList() : null;
  //   return aboutBook!;
  // }
  //
  //
  // Future<List<OtherModelItem>> getAboutUsContent(int _id) async {
  //   var dbClient = await con.db;
  //   var res = await dbClient.query('Table_of_about_us', where: '_id == $_id');
  //   List<OtherModelItem>? aboutBook = res.isNotEmpty ? res.map((c) => OtherModelItem.fromMap(c)).toList() : null;
  //   return aboutBook!;
  // }
  //
  // Future<List<SupplicationDayNightItem>> getDayNightSupplications(bool dayNight) async {
  //   var dbClient = await con.db;
  //   var res = await dbClient.query(dayNight ? 'Table_of_supplications_day' : 'Table_of_supplication_night');
  //   List<SupplicationDayNightItem>? dayNightSupplications = res.isNotEmpty ? res.map((c) => SupplicationDayNightItem.fromMap(c)).toList() : null;
  //   return dayNightSupplications!;
  // }
}
