import 'package:fortress_of_the_muslim/data/model/main_chapter_model.dart';
import 'package:fortress_of_the_muslim/data/service/database_service.dart';

class DatabaseQuery {
  DatabaseService con = DatabaseService();

  Future<List<MainChapterModel>> getAllChapters() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_chapters');
    List<MainChapterModel>? mainChapters = res.isNotEmpty ? res.map((c) => MainChapterModel.fromMap(c)).toList() : null;
    return mainChapters!;
  }

  addRemoveFavoriteChapter(int state, int chapterId) async {
    var dbClient = await con.db;
    await dbClient.rawQuery('UPDATE Table_of_chapters SET favorite_state = $state WHERE id == $chapterId');
  }
}
