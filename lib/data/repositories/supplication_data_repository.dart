import '../../domain/entities/supplication_entity.dart';
import '../../domain/repositories/supplication_repository.dart';
import '../services/database_service.dart';

class SupplicationDataRepository implements SupplicationRepository {
  final DatabaseService _databaseService;

  SupplicationDataRepository(this._databaseService);

  @override
  Future<List<SupplicationEntity>> getFavoriteSupplications(
      {required int ids}) {
    // TODO: implement getFavoriteSupplications
    throw UnimplementedError();
  }

  @override
  Future<SupplicationEntity> getSupplicationById(
      {required int supplicationId}) {
    // TODO: implement getSupplicationById
    throw UnimplementedError();
  }

  @override
  Future<List<SupplicationEntity>> getSupplicationsByChapterId(
      {required int chapterId}) {
    // TODO: implement getSupplicationsByChapterId
    throw UnimplementedError();
  }
}
