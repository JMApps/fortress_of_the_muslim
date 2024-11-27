import '../../data/models/collection_model.dart';

class CollectionEntity {
  final int collectionId;
  final String collectionTitle;
  final String? collectionDescription;
  final String? collectionSupplicationIds;

  const CollectionEntity({
    required this.collectionId,
    required this.collectionTitle,
    required this.collectionDescription,
    required this.collectionSupplicationIds,
  });

  factory CollectionEntity.fromModel(CollectionModel model) {
    return CollectionEntity(
      collectionId: model.collectionId,
      collectionTitle: model.collectionTitle,
      collectionDescription: model.collectionDescription,
      collectionSupplicationIds: model.collectionSupplicationIds,
    );
  }
}
