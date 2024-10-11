import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nevernote/models/signin_model.dart'; 

class SignInServices {
  Future<LoginResponse> login(String username, String password) async {
    const String apiUrl = 'http://127.0.0.1:8000/api/login/'; //                ADITYA-------->CHECK THIS

    final Map<String, String> body = {
      'username': username,
      'password': password,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(jsonDecode(response.body));
      } else {
        return LoginResponse(success: false, error: 'Invalid credentials');
      }
    } catch (e) {
      return LoginResponse(success: false, error: 'An error occurred: $e');
    }
  }
}
