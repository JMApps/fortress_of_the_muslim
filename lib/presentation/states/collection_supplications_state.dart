import 'package:flutter/material.dart';

class CollectionSupplicationsState extends ChangeNotifier {
  late final List<int> _collectionSupplicationIds;

  CollectionSupplicationsState(this._collectionSupplicationIds);

  List<int> get collectionSupplicationIds => List.unmodifiable(_collectionSupplicationIds);

  void removeFromCollection({required int supplicationId}) {
    _collectionSupplicationIds.remove(supplicationId);
    notifyListeners();
  }

  bool supplicationIsCollection({required int supplicationId}) {
    return _collectionSupplicationIds.contains(supplicationId);
  }

  void addAllToCollection(List<int> supplicationIds) {
    _collectionSupplicationIds.addAll(supplicationIds);
    notifyListeners();
  }
}