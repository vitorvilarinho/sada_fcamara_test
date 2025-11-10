import 'package:http_service/http_service.dart';

import '../../domain/models/occurrence.dart';
import '../../domain/repositories/repositories.dart';

class SendOccurrenceRepositoryImpl implements SendOccurrenceRepository {
  const SendOccurrenceRepositoryImpl({required HttpService httpService})
    : _httpService = httpService;
  final HttpService _httpService;

  @override
  Future<bool> call(Occurrence occurrence) async =>
      _httpService.post('url', occurrence.toMap());
}
