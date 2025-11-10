import 'package:database/database.dart';

import '../../domain/repositories/update_occurrence_sync_repository.dart';

class UpdateOccurrenceSyncRepositoryImpl
    implements UpdateOccurrenceSyncRepository {
  const UpdateOccurrenceSyncRepositoryImpl({
    required DatabaseService databaseService,
  }) : _databaseService = databaseService;

  final DatabaseService _databaseService;

  @override
  Future<void> call({required occurrenceId}) =>
      _databaseService.markOccurrenceAsSynced(occurrenceId);
}
