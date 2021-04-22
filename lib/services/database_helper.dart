import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  DatabaseHelper.internal();

  initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'fortress.db');

    ByteData data = await rootBundle.load(join('assets/databases', 'fortress.db'));
    List<int> bytes = data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);

    await File(path).writeAsBytes(bytes);

    var ourDb = await openDatabase(path);
    return ourDb;
  }
}
