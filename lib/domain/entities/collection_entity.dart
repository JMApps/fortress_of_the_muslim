import '../../data/models/collection_model.dart';

class CollectionEntity {
  final int collectionId;
  final String collectionTitle;
  final String? collectionDescription;

  const CollectionEntity({
    required this.collectionId,
    required this.collectionTitle,
    required this.collectionDescription,
  });

  factory CollectionEntity.fromModel(CollectionModel model) {
    return CollectionEntity(
      collectionId: model.collectionId,
      collectionTitle: model.collectionTitle,
      collectionDescription: model.collectionDescription,
    );
  }
}
