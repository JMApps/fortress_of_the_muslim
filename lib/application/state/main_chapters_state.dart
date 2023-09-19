import 'package:flutter/cupertino.dart';
import 'package:fortress_of_the_muslim/application/string/app_constraints.dart';
import 'package:fortress_of_the_muslim/data/service/database_query.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainChaptersState extends ChangeNotifier {

  final _settingBox = Hive.box(AppConstraints.keyMainSettings);

  final DatabaseQuery _databaseQuery = DatabaseQuery();

  DatabaseQuery get getDatabaseQuery => _databaseQuery;

  int _lastSavedChapterIndex = 1;

  int get getLastSavedChapterIndex => _lastSavedChapterIndex;

  List<int> _favoriteSupplications = [];

  List<int> get getFavoriteSupplications => _favoriteSupplications;

  MainChaptersState() {
    _lastSavedChapterIndex = _settingBox.get(AppConstraints.keyLastSavedChapter, defaultValue: 1);
    _favoriteSupplications = _settingBox.get(AppConstraints.keyFavoriteSupplicationIds, defaultValue: <int>[]);
  }

  saveLastChapter(int chapterId) {
    _lastSavedChapterIndex = chapterId;
    _settingBox.put(AppConstraints.keyLastSavedChapter, _lastSavedChapterIndex);
    notifyListeners();
  }

  addRemoveChapterBookmark(int state, int chapterId) {
    _databaseQuery.addRemoveFavoriteChapter(state, chapterId);
    notifyListeners();
  }

  toggleFavorite(int supplicationId) {
    final exist = _favoriteSupplications.contains(supplicationId);
    if (exist) {
      _favoriteSupplications.remove(supplicationId);
    } else {
      _favoriteSupplications.add(supplicationId);
    }
    _settingBox.put(AppConstraints.keyFavoriteSupplicationIds, _favoriteSupplications);
    notifyListeners();
  }

  bool supplicationIsFavorite(int id) {
    final exist = _favoriteSupplications.contains(id);
    return exist;
  }

  @override
  void dispose() {
    super.dispose();
    _settingBox.close();
  }
}
