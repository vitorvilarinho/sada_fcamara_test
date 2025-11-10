import 'dart:math';

import 'http_service.dart';

class HttpServiceImpl implements HttpService {
  @override
  Future<bool> post(String url, Map<String, dynamic> body) async {
    final random = Random();
    final successRate = 0.7;

    await Future.delayed(Duration(seconds: 2));

    if (random.nextDouble() < successRate) {
      return true;
    } else {
      return false;
    }
  }
}
