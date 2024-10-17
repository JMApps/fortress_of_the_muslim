import '../entities/supplication_entity.dart';
import '../repositories/supplication_repository.dart';

class SupplicationUseCase {
  final SupplicationRepository _supplicationRepository;

  SupplicationUseCase(this._supplicationRepository);

  Future<List<SupplicationEntity>> fetchAllSupplications() async {
    try {
      return await _supplicationRepository.getAllSupplications();
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<List<SupplicationEntity>> fetchSupplicationsByChapterId({required int chapterId}) async {
    try {
      return await _supplicationRepository.getSupplicationsByChapterId(chapterId: chapterId);
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<SupplicationEntity> fetchSupplicationById({required int supplicationId}) async {
    try {
      return await _supplicationRepository.getSupplicationById(supplicationId: supplicationId);
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<List<SupplicationEntity>> fetchFavoriteSupplications({required List<int> ids}) async {
    try {
      return await _supplicationRepository.getFavoriteSupplications(ids: ids);
    } catch (e) {
      throw Exception('$e');
    }
  }
}