import 'package:hive_flutter/hive_flutter.dart';
part 'chapter_favorite_model.g.dart';

@HiveType(typeId: 33)
class ChapterFavoriteModel {

  @HiveField(0)
  final bool isFavorite;

  @HiveField(1)
  final int chapterId;

  ChapterFavoriteModel({required this.isFavorite, required this.chapterId});
}