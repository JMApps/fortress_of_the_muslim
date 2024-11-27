import 'package:flutter/material.dart';

class MainCollectionsState extends ChangeNotifier {
  int _currentCollectionId = 0;

  int get getCurrentCollectionId => _currentCollectionId;

  set setCurrentCollectionId(int id) {
    _currentCollectionId = id;
    notifyListeners();
  }
}