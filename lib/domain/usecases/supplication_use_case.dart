import '../entities/supplication_entity.dart';
import '../repositories/supplication_repository.dart';

class SupplicationUseCase {
  final SupplicationRepository _supplicationRepository;

  SupplicationUseCase(this._supplicationRepository);

  Future<List<SupplicationEntity>> fetchAllSupplications({required String languageCode}) async {
    try {
      return await _supplicationRepository.getAllSupplications(languageCode: languageCode);
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<List<SupplicationEntity>> fetchSupplicationsByChapterId({required String languageCode, required int chapterId}) async {
    try {
      return await _supplicationRepository.getSupplicationsByChapterId(languageCode: languageCode, chapterId: chapterId);
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<SupplicationEntity> fetchSupplicationById({required String languageCode, required int supplicationId}) async {
    try {
      return await _supplicationRepository.getSupplicationById(languageCode: languageCode, supplicationId: supplicationId);
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<List<SupplicationEntity>> fetchFavoriteSupplications({required String languageCode, required List<int> ids}) async {
    try {
      return await _supplicationRepository.getFavoriteSupplications(languageCode: languageCode, ids: ids);
    } catch (e) {
      throw Exception('$e');
    }
  }
}