import '../entities/collection_entity.dart';

abstract class CollectionRepository {
  Future<List<CollectionEntity>> getAllCollections();

  Future<CollectionEntity> getCollectionById({required int collectionId});

  Future<int> createCollection({required Map<String, Object?> mapCollection});

  Future<int> updateCollection({required Map<String, Object?> mapCollection, required int collectionId});

  Future<int> deleteCollection({required int collectionId});
}