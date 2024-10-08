import '../entities/supplication_entity.dart';
import '../repositories/supplication_repository.dart';

class SupplicationUseCase {
  final SupplicationRepository _supplicationRepository;

  SupplicationUseCase(this._supplicationRepository);

  Future<List<SupplicationEntity>> fetchAllSupplications() async {
    return await _supplicationRepository.getAllSupplications();
  }

  Future<List<SupplicationEntity>> fetchSupplicationsByChapterId({required int chapterId}) async {
    return await _supplicationRepository.getSupplicationsByChapterId(chapterId: chapterId);
  }

  Future<SupplicationEntity> fetchSupplicationById({required int supplicationId}) async {
    return await _supplicationRepository.getSupplicationById(supplicationId: supplicationId);
  }

  Future<List<SupplicationEntity>> fetchFavoriteSupplications({required List<int> ids}) async {
    return await _supplicationRepository.getFavoriteSupplications(ids: ids);
  }
}