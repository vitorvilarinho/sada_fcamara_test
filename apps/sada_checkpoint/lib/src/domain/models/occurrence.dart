import 'dart:io';
import 'dart:ui' as ui;

class Occurrence {
  Occurrence({
    required this.photos,
    required this.licensePlate,
    required this.responsibleName,
    required this.signature,
    required this.createdAt,
  });

  final List<File> photos;
  final String licensePlate;
  final String responsibleName;
  final ui.Image signature;
  final DateTime createdAt;

  Map<String, dynamic> toMap() {
    return {
      'photos': photos,
      'licensePlate': licensePlate,
      'responsibleName': responsibleName,
      'signature': signature,
      'createdAt': createdAt,
    };
  }
}
