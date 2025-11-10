import '../models/occurrence.dart';
import '../repositories/repositories.dart';

class SubmitOccurrenceUseCase {
  const SubmitOccurrenceUseCase({
    required InsertOccurenceInDatabaseRepository
    insertOccurenceInDatabaseRepository,
    required SendOccurrenceRepository sendOccurrenceRepository,
    required UpdateOccurrenceSyncRepository updateOccurrenceSyncRepository,
  }) : _insertOccurenceInDatabaseRepository =
           insertOccurenceInDatabaseRepository,
       _sendOccurrenceRepository = sendOccurrenceRepository,
       _updateOccurrenceSyncRepository = updateOccurrenceSyncRepository;
  final InsertOccurenceInDatabaseRepository
  _insertOccurenceInDatabaseRepository;
  final SendOccurrenceRepository _sendOccurrenceRepository;
  final UpdateOccurrenceSyncRepository _updateOccurrenceSyncRepository;

  Future<void> call(Occurrence occurrence) async {
    final occurrenceId = await _insertOccurenceInDatabaseRepository(occurrence);
    final wasSync = await _sendOccurrenceRepository(occurrence);
    if (wasSync && occurrenceId != null) {
      await _updateOccurrenceSyncRepository(occurrenceId: occurrenceId);
    }
  }
}
