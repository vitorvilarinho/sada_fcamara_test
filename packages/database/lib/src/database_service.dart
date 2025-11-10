import 'dart:typed_data';

import 'database_service_impl.dart';

abstract class DatabaseService {
  static DatabaseService? _instance;
  static DatabaseService get instance => _instance ?? DatabaseServiceImpl();

  Future<int?> insertOccurrenceWithImages({
    required String licensePlate,
    required String responsibleName,
    required Uint8List signature,
    required List<Uint8List> images,
    required DateTime createdAt,
  });

  Future<List<Map<String, dynamic>>> getUnsyncedOccurrences();

  Future<void> markOccurrenceAsSynced(int id);
}
