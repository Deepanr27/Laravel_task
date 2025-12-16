import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'http://192.168.134.9:8000/api'; // example: 192.168.1.5

  static Future<void> saveMessage(String username, String message) async {
    final response = await http.post(
      Uri.parse('$baseUrl/messages'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'message': message,
      }),
    );

    print(response.statusCode);
    print(response.body);
  }
}
