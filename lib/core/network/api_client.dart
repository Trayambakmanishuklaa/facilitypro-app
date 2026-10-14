import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/api_constants.dart';

class ApiClient {
  final http.Client _client = http.Client();

  Map<String, String> get _headers => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

  Future<dynamic> get(String endpoint) async {
    try {
      final response = await _client
          .get(Uri.parse(endpoint), headers: _headers)
          .timeout(const Duration(seconds: ApiConstants.timeoutSeconds));
      return _processResponse(response);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _client
          .post(
            Uri.parse(endpoint),
            headers: _headers,
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: ApiConstants.timeoutSeconds));
      return _processResponse(response);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  dynamic _processResponse(http.Response response) {
    final body = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return body;
    } else {
      final errorMsg = body['message'] ?? 'Server error (${response.statusCode})';
      throw Exception(errorMsg);
    }
  }
}
