import 'package:flutter/material.dart';

import '../../domain/entities/collection_entity.dart';
import '../../domain/usecases/collection_use_case.dart';

class CollectionsState extends ChangeNotifier {
  final CollectionUseCase _collectionUseCase;

  CollectionsState(this._collectionUseCase);

  Future<List<CollectionEntity>> fetchAllCollections() async {
    return await _collectionUseCase.fetchAllCollections();
  }

  Future<CollectionEntity> fetchCollectionById({required int collectionId}) async {
    return await _collectionUseCase.fetchCollectionById(collectionId: collectionId);
  }

  Future<int> createCollection({required Map<String, Object?> mapCollection}) async {
    final int createCollection = await _collectionUseCase.createCollection(mapCollection: mapCollection);
    notifyListeners();
    return createCollection;
  }

  Future<int> updateCollection({required Map<String, Object?> mapCollection, required int collectionId}) async {
    final int updateCollection = await _collectionUseCase.updateCollection(mapCollection: mapCollection, collectionId: collectionId);
    notifyListeners();
    return updateCollection;
  }

  Future<int> deleteCollection({required int collectionId}) async {
    final int deleteCollection = await _collectionUseCase.deleteCollection(collectionId: collectionId);
    notifyListeners();
    return deleteCollection;
  }
}