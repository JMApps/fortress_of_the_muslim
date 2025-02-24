import '../../../domain/entities/collection_entity.dart';

class CollectionArgs {
  final CollectionEntity collectionModel;
  final String supplicationTableName;

  const CollectionArgs({
    required this.collectionModel,
    required this.supplicationTableName,
  });
}
