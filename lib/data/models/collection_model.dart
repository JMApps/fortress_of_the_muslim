import '../../core/strings/db_values.dart';

class CollectionModel {
  final int collectionId;
  final String collectionTitle;
  final String? collectionDescription;

  const CollectionModel({
    required this.collectionId,
    required this.collectionTitle,
    required this.collectionDescription,
  });

  factory CollectionModel.fromMap(Map<String, Object?> map) {
    return CollectionModel(
      collectionId: map[DBValues.dbCollectionId] as int,
      collectionTitle: map[DBValues.dbCollectionTitle] as String,
      collectionDescription: map[DBValues.dbCollectionDescription] as String?,
    );
  }
}
