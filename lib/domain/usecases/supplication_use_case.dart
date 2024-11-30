import '../entities/supplication_entity.dart';
import '../repositories/supplication_repository.dart';

class SupplicationUseCase {
  final SupplicationRepository _supplicationRepository;

  SupplicationUseCase(this._supplicationRepository);

  Future<List<SupplicationEntity>> fetchAllSupplications({required String tableName}) async {
    try {
      return await _supplicationRepository.getAllSupplications(tableName: tableName);
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<List<SupplicationEntity>> fetchSupplicationsByChapterId({required String tableName, required int chapterId}) async {
    try {
      return await _supplicationRepository.getSupplicationsByChapterId(tableName: tableName, chapterId: chapterId);
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<SupplicationEntity> fetchSupplicationById({required String tableName, required int supplicationId}) async {
    try {
      return await _supplicationRepository.getSupplicationById(tableName: tableName, supplicationId: supplicationId);
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<List<SupplicationEntity>> fetchFavoriteSupplications({required String tableName, required List<int> ids}) async {
    try {
      return await _supplicationRepository.getFavoriteSupplications(tableName: tableName, ids: ids);
    } catch (e) {
      throw Exception('$e');
    }
  }
}