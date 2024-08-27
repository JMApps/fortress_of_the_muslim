import '../entities/supplication_entity.dart';

abstract class SupplicationRepository {
  Future<List<SupplicationEntity>> getSupplicationsByChapterId({required int chapterId});

  Future<SupplicationEntity> getSupplicationById({required int supplicationId});

  Future<List<SupplicationEntity>> getFavoriteSupplications({required int ids});
}