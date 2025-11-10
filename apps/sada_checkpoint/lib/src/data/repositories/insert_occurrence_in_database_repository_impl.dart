import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:database/database.dart';

import '../../domain/models/occurrence.dart';
import '../../domain/repositories/insert_occurrence_in_database_repository.dart';

class InsertOccurenceInDatabaseRepositoryImpl
    implements InsertOccurenceInDatabaseRepository {
  const InsertOccurenceInDatabaseRepositoryImpl({
    required DatabaseService databaseService,
  }) : _databaseService = databaseService;

  final DatabaseService _databaseService;

  @override
  Future<int?> call(Occurrence occurence) async {
    try {
      final signature = await _imageToBytes(occurence.signature);

      final occurrenceId = await _databaseService.insertOccurrenceWithImages(
        licensePlate: occurence.licensePlate,
        responsibleName: occurence.responsibleName,
        signature: signature,
        images: _photosToBytesList(occurence.photos),
        createdAt: occurence.createdAt,
      );
      return occurrenceId;
    } catch (e) {}
    return null;
  }

  Future<Uint8List> _imageToBytes(ui.Image image) async {
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  List<Uint8List> _photosToBytesList(List<File> photos) {
    return photos.map((photo) => photo.readAsBytesSync()).toList();
  }
}
