import '../../core/strings/db_values.dart';

class CollectionModel {
  final int collectionId;
  final String collectionTitle;
  final String? collectionDescription;
  final int collectionColor;

  const CollectionModel({
    required this.collectionId,
    required this.collectionTitle,
    required this.collectionDescription,
    required this.collectionColor,
  });

  factory CollectionModel.fromMap(Map<String, Object?> map) {
    return CollectionModel(
      collectionId: map[DBValues.dbCollectionId] as int,
      collectionTitle: map[DBValues.dbCollectionTitle] as String,
      collectionDescription: map[DBValues.dbCollectionDescription] as String?,
      collectionColor: map[DBValues.dbCollectionColor] as int,
    );
  }
}
