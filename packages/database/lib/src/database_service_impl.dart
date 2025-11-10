import 'dart:typed_data';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'database_service.dart';

class DatabaseServiceImpl implements DatabaseService {
  static final DatabaseServiceImpl _instance = DatabaseServiceImpl._internal();
  factory DatabaseServiceImpl() => _instance;

  DatabaseServiceImpl._internal();

  Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'form_data.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE occurrences (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            license_plate TEXT,
            responsible_name TEXT,
            signature BLOB,
            sync INTEGER NOT NULL DEFAULT 0
          )
        ''');

        await db.execute('''
          CREATE TABLE occurrence_images (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            occurrence_id INTEGER,
            image BLOB,
            FOREIGN KEY (occurrence_id) REFERENCES occurrences (id) ON DELETE CASCADE
          )
        ''');
      },
    );
  }

  @override
  Future<int?> insertOccurrenceWithImages({
    required String licensePlate,
    required String responsibleName,
    required Uint8List signature,
    required List<Uint8List> images,
  }) async {
    final database = await db;
    int? occurrenceId;

    await database.transaction((txn) async {
      occurrenceId = await txn.insert('occurrences', {
        'license_plate': licensePlate,
        'responsible_name': responsibleName,
        'signature': signature,
        'sync': 0,
      });

      for (final img in images) {
        await txn.insert('occurrence_images', {
          'occurrence_id': occurrenceId,
          'image': img,
        });
      }
    });

    await database.close();
    return occurrenceId;
  }

  @override
  Future<List<Map<String, dynamic>>> getUnsyncedOccurrences() async {
    final database = await db;
    final List<Map<String, dynamic>> occurrences = await database.query(
      'occurrences',
      where: 'sync = ?',
      whereArgs: [0],
    );
    await database.close();
    return occurrences;
  }

  @override
  Future<void> markOccurrenceAsSynced(int id) async {
    final database = await db;
    await database.update(
      'occurrences',
      {'sync': 1},
      where: 'id = ?',
      whereArgs: [id],
    );

    // await database.close();
  }
}
