import '../entities/collection_entity.dart';
import '../repositories/collection_repository.dart';

class CollectionUseCase {
  final CollectionRepository _collectionRepository;

  CollectionUseCase(this._collectionRepository);

  Future<List<CollectionEntity>> fetchAllCollections() async {
    try {
      return await _collectionRepository.getAllCollections();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<CollectionEntity> fetchCollectionById({required int collectionId}) async {
    try {
      return await _collectionRepository.getCollectionById(collectionId: collectionId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> createCollection({required Map<String, Object?> mapCollection}) async {
    try {
      return await _collectionRepository.createCollection(mapCollection: mapCollection);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> updateCollection({required Map<String, Object?> mapCollection, required int collectionId}) async {
    try {
      return await _collectionRepository.updateCollection(mapCollection: mapCollection, collectionId: collectionId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> deleteCollection({required int collectionId}) async {
    try {
      return await _collectionRepository.deleteCollection(collectionId: collectionId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}