import 'package:fortress_of_the_muslim/data/model/main_chapter_model.dart';
import 'package:fortress_of_the_muslim/data/model/main_supplication_model.dart';
import 'package:fortress_of_the_muslim/data/service/database_service.dart';

class DatabaseQuery {
  final DatabaseService _con = DatabaseService();

  static final DatabaseQuery _instance = DatabaseQuery.internal();
  factory DatabaseQuery() => _instance;
  DatabaseQuery.internal();

  Future<List<MainChapterModel>> getAllChapters() async {
    var dbClient = await _con.db;
    var res = await dbClient.query('Table_of_chapters');
    List<MainChapterModel>? mainChapters = res.isNotEmpty ? res.map((c) => MainChapterModel.fromMap(c)).toList() : null;
    return mainChapters!;
  }

  Future<List<MainChapterModel>> getBookmarkChapters() async {
    var dbClient = await _con.db;
    var res = await dbClient.query('Table_of_chapters', where: 'favorite_state == 1');
    List<MainChapterModel>? mainChapters = res.isNotEmpty ? res.map((c) => MainChapterModel.fromMap(c)).toList() : null;
    return mainChapters!;
  }

  addRemoveFavoriteChapter(int state, int chapterId) async {
    var dbClient = await _con.db;
    await dbClient.rawQuery('UPDATE Table_of_chapters SET favorite_state = $state WHERE id == $chapterId');
  }

  Future<List<MainSupplicationModel>> getAllSupplications() async {
    var dbClient = await _con.db;
    var res = await dbClient.query('Table_of_supplications');
    List<MainSupplicationModel>? mainSupplications = res.isNotEmpty ? res.map((c) => MainSupplicationModel.fromMap(c)).toList() : null;
    return mainSupplications!;
  }

  Future<List<MainSupplicationModel>> getBookmarkSupplications() async {
    var dbClient = await _con.db;
    var res = await dbClient.query('Table_of_supplications', where: 'favorite_state == 1');
    List<MainSupplicationModel>? mainSupplications = res.isNotEmpty ? res.map((c) => MainSupplicationModel.fromMap(c)).toList() : null;
    return mainSupplications!;
  }

  addRemoveFavoriteSupplication(int state, int supplicationId) async {
    var dbClient = await _con.db;
    await dbClient.rawQuery('UPDATE Table_of_supplications SET favorite_state = $state WHERE id == $supplicationId');
  }
}
