import '../models/occurrence.dart';

abstract class SendOccurrenceRepository {
  const SendOccurrenceRepository();

  Future<bool> call(Occurrence occurrence);
}
