import '../entities/supplication_entity.dart';

abstract class SupplicationRepository {
  Future<List<SupplicationEntity>> getAllSupplications({required String tableName});

  Future<List<SupplicationEntity>> getSupplicationsByChapterId({required String tableName, required int chapterId});

  Future<SupplicationEntity> getSupplicationById({required String tableName, required int supplicationId});

  Future<List<SupplicationEntity>> getFavoriteSupplications({required String tableName, required List<int> ids});
}