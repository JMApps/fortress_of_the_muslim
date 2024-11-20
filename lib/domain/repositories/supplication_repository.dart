import '../entities/supplication_entity.dart';

abstract class SupplicationRepository {
  Future<List<SupplicationEntity>> getAllSupplications({required String languageCode});

  Future<List<SupplicationEntity>> getSupplicationsByChapterId({required String languageCode, required int chapterId});

  Future<SupplicationEntity> getSupplicationById({required String languageCode, required int supplicationId});

  Future<List<SupplicationEntity>> getFavoriteSupplications({required String languageCode, required List<int> ids});
}