import 'package:flutter/material.dart';

class CollectionSupplicationsState extends ChangeNotifier {
  CollectionSupplicationsState(List<int> collectionSupplicationIds) : _collectionSupplicationIds = List<int>.from(collectionSupplicationIds);

  late final List<int> _collectionSupplicationIds;

  List<int> get collectionSupplicationIds => _collectionSupplicationIds;

  void removeFromCollection({required int supplicationId}) {
    _collectionSupplicationIds.remove(supplicationId);
    notifyListeners();
  }

  bool supplicationIsCollection({required int supplicationId}) {
    return _collectionSupplicationIds.contains(supplicationId);
  }

  void addAllToCollection({required List<int> supplicationIds}) {
    _collectionSupplicationIds.addAll(supplicationIds);
    notifyListeners();
  }

  void addToCollection(int supplicationId) {
    if (!_collectionSupplicationIds.contains(supplicationId)) {
      _collectionSupplicationIds.add(supplicationId);
      notifyListeners();
    }
  }

  void removeFromCollectionById(int supplicationId) {
    _collectionSupplicationIds.remove(supplicationId);
    notifyListeners();
  }
}