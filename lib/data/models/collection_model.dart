import 'dart:convert';

import '../../core/strings/db_values.dart';

class CollectionModel {
  final int collectionId;
  final String collectionTitle;
  final String? collectionDescription;
  final List<int>? collectionSupplicationIds;

  const CollectionModel({
    required this.collectionId,
    required this.collectionTitle,
    required this.collectionDescription,
    required this.collectionSupplicationIds,
  });

  factory CollectionModel.fromMap(Map<String, Object?> map) {
    final String? supplicationIdsJson = map[DBValues.dbCollectionSupplicationIds] as String?;
    final List<int>? supplicationIds = supplicationIdsJson != null ? List<int>.from(jsonDecode(supplicationIdsJson)) : null;

    return CollectionModel(
      collectionId: map[DBValues.dbCollectionId] as int,
      collectionTitle: map[DBValues.dbCollectionTitle] as String,
      collectionDescription: map[DBValues.dbCollectionDescription] as String?,
      collectionSupplicationIds: supplicationIds,
    );
  }
}
