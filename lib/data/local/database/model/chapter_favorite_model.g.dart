// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_favorite_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChapterFavoriteModelAdapter extends TypeAdapter<ChapterFavoriteModel> {
  @override
  final int typeId = 33;

  @override
  ChapterFavoriteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChapterFavoriteModel(
      isFavorite: fields[0] as bool,
      chapterId: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ChapterFavoriteModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.isFavorite)
      ..writeByte(1)
      ..write(obj.chapterId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChapterFavoriteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
