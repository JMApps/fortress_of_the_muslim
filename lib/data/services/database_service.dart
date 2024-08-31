import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../core/strings/db_values.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService.internal();

  factory DatabaseService() => _instance;

  DatabaseService.internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initializeDatabase();
    return _db!;
  }

  Future<Database> initializeDatabase() async {
    final String databasePath = await getDatabasesPath();
    String path = join(databasePath, DBValues.dbName);

    Database database = await openDatabase(path);

    if (await database.getVersion() < DBValues.dbVersion) {
      await database.close();
      await deleteDatabase(path);
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        throw Exception('Invalid create ${DBValues.dbName} = $e');
      }

      ByteData data = await rootBundle.load(join('assets/databases', DBValues.dbName));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);

      database = await openDatabase(path);
      await database.setVersion(DBValues.dbVersion);
    }

    return database;
  }
}
