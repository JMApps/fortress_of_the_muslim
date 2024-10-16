import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/strings/app_constraints.dart';
import '../../domain/entities/supplication_entity.dart';
import '../../domain/usecases/supplication_use_case.dart';

class MainSupplicationsState extends ChangeNotifier {
  final _mainAppSettingsBox = Hive.box(AppConstraints.keyMainSettingsBox);

  final SupplicationUseCase _supplicationUseCase;

  late Future<List<SupplicationEntity>> _futureMainSupplications;


  MainSupplicationsState(this._supplicationUseCase) {
    _favoriteSupplicationIds = _mainAppSettingsBox.get(AppConstraints.keySupplicationIds, defaultValue: <int>[]);
    _futureMainSupplications = _getAllSupplications();
  }

  late List<int> _favoriteSupplicationIds = [];

  List<int> get getFavoriteSupplicationIds => _favoriteSupplicationIds;

  Future<List<SupplicationEntity>> fetchAllSupplications() {
    return _futureMainSupplications;
  }

  Future<List<SupplicationEntity>> _getAllSupplications() async {
    return await _supplicationUseCase.fetchAllSupplications();
  }

  Future<List<SupplicationEntity>> getSupplicationsByChapterId({required int chapterId}) async {
    return await _supplicationUseCase.fetchSupplicationsByChapterId(chapterId: chapterId);
  }

  Future<SupplicationEntity> getSupplicationById({required int supplicationId}) async {
    return await _supplicationUseCase.fetchSupplicationById(supplicationId: supplicationId);
  }

  Future<List<SupplicationEntity>> getFavoriteSupplications({required List<int> ids}) async {
    return await _supplicationUseCase.fetchFavoriteSupplications(ids: ids);
  }

  void toggleSupplicationFavorite({required int supplicationId}) {
    final bool exist = _favoriteSupplicationIds.contains(supplicationId);
    if (exist) {
      _favoriteSupplicationIds.remove(supplicationId);
    } else {
      _favoriteSupplicationIds.add(supplicationId);
    }
    _mainAppSettingsBox.put(AppConstraints.keySupplicationIds, _favoriteSupplicationIds);
    notifyListeners();
  }

  bool supplicationIsFavorite(int supplicationId) {
    return _favoriteSupplicationIds.contains(supplicationId);
  }
}