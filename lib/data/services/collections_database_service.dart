import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../core/strings/db_values.dart';

class CollectionsDatabaseService {
  static final CollectionsDatabaseService _instance = CollectionsDatabaseService.internal();

  factory CollectionsDatabaseService() => _instance;

  CollectionsDatabaseService.internal();

  static Database? _collectionDb;

  Future<Database> get db async {
    if (_collectionDb != null) {
      return _collectionDb!;
    }
    _collectionDb = await initializeDatabase();
    return _collectionDb!;
  }

  Future<Database> initializeDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, DBValues.collectionDbName);

    Database database;

    bool dbExists = await databaseExists(dbPath);
    if (dbExists) {
      database = await openDatabase(dbPath);
      int currentVersion = await database.getVersion();
      if (currentVersion < DBValues.collectionDvVersion) {
        await database.close();
        await deleteDatabase(dbPath);
        database = await _createNewDatabase(dbPath);
      }
    } else {
      database = await _createNewDatabase(dbPath);
    }

    return database;
  }

  Future<Database> _createNewDatabase(String dbPath) async {
    Database database = await openDatabase(dbPath, version: DBValues.collectionDvVersion, onCreate: _createDb);
    await database.setVersion(DBValues.collectionDvVersion);
    return database;
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${DBValues.dbCollectionTable} (
        ${DBValues.dbCollectionId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${DBValues.dbCollectionTitle} TEXT,
        ${DBValues.dbCollectionDescription} TEXT,
        ${DBValues.dbCollectionSupplicationIds} INTEGER
      );
    ''');
  }
}