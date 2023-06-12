import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService.internal();

  factory DatabaseService() => _instance;
  static Database? _db;
  final _databaseVersion = 1;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initializeDatabase();
    return _db!;
  }

  DatabaseService.internal();

  Future<Database> initializeDatabase() async {
    Directory? documentDirectory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();

    String databasePath = join(documentDirectory!.path, 'fortress_database.db');

    // String toDeleteDB = '${documentDirectory.path}/fortress_database.db';
    // var delDB = await databaseExists(toDeleteDB);
    // if (delDB) {
    //   await deleteDatabase(toDeleteDB);
    // }

    bool exists = await databaseExists(databasePath);

    if (!exists) {
      try {
        await Directory(dirname(databasePath)).create(recursive: true);
      } catch (_) {
        Exception('Invalid database');
      }

      ByteData data = await rootBundle.load(join('assets/databases', 'fortress_database.db'));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(databasePath).writeAsBytes(bytes, flush: true);
    }

    var onOpen = await openDatabase(databasePath, version: _databaseVersion);
    return onOpen;
  }
}
