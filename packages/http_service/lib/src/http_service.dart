import 'http_service_impl.dart';

abstract class HttpService {
  static HttpService? _instance;
  static HttpService get instance => _instance ?? HttpServiceImpl();

  Future<bool> post(String url, Map<String, dynamic> body);
}
