import 'package:flutter/material.dart';
import 'package:fortress_of_the_muslim/application/main_app.dart';
import 'package:fortress_of_the_muslim/data/constants.dart';
import 'package:fortress_of_the_muslim/data/local/database/model/chapter_favorite_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ChapterFavoriteModelAdapter());
  bool exists = await Hive.boxExists(Constants.keyFavoritesBox);
  late Box box;
  if (!exists) {
    box = await Hive.openBox(Constants.keyFavoritesBox);
    box.put('key_t', ChapterFavoriteModel(isFavorite: false, chapterId: 0));
  } else {
    box = await Hive.openBox(Constants.keyFavoritesBox);
  }
  runApp(const MainApp());
}
