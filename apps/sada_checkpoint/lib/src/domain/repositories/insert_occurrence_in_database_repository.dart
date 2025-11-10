import '../models/occurrence.dart';

abstract class InsertOccurenceInDatabaseRepository {
  const InsertOccurenceInDatabaseRepository();

  Future<int?> call(Occurrence occurence);
}
