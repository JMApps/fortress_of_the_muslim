import 'package:sqflite/sqflite.dart';

import '../../core/strings/db_values.dart';
import '../../domain/entities/collection_entity.dart';
import '../../domain/repositories/collection_repository.dart';
import '../models/collection_model.dart';
import '../services/collections_database_service.dart';

class CollectionDataRepository implements CollectionRepository {
  final CollectionsDatabaseService _collectionsDatabaseService;

  CollectionDataRepository(this._collectionsDatabaseService);

  @override
  Future<List<CollectionEntity>> getAllCollections() async {
    final Database database = await _collectionsDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValues.dbCollectionTable);
    final List<CollectionEntity> allCollections = resources.isNotEmpty ? resources.map((e) => CollectionEntity.fromModel(CollectionModel.fromMap(e))).toList() : [];
    return allCollections;
  }

  @override
  Future<CollectionEntity> getCollectionById({required int collectionId}) async {
    final Database database = await _collectionsDatabaseService.db;
    final List<Map<String, Object?>> resources = await database.query(DBValues.dbCollectionTable, where: '${DBValues.dbCollectionId} = ?', whereArgs: [collectionId]);
    final CollectionEntity? collectionById = resources.isNotEmpty ? CollectionEntity.fromModel(CollectionModel.fromMap(resources.first)) : null;
    return collectionById!;
  }

  @override
  Future<int> createCollection({required Map<String, Object?> mapCollection}) async {
    final Database database = await _collectionsDatabaseService.db;
    return await database.insert(DBValues.dbCollectionTable, mapCollection);
  }

  @override
  Future<int> updateCollection({required Map<String, Object?> mapCollection, required int collectionId}) async {
    final Database database = await _collectionsDatabaseService.db;
    return await database.update(DBValues.dbCollectionTable, mapCollection, where: '${DBValues.dbCollectionId} = ?', whereArgs: [collectionId]);
  }

  @override
  Future<int> deleteCollection({required int collectionId}) async {
    final Database database = await _collectionsDatabaseService.db;
    return await database.delete(DBValues.dbCollectionId, where: '${DBValues.dbCollectionId} = ?', whereArgs: [collectionId]);
  }
}
