// lib/services/register_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/register_model.dart';

class RegisterService {
  Future<String?> registerUser(RegisterModel registerModel) async {
    final String baseUrl = 'http://127.0.0.1:8000/register';

    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(registerModel.toJson()),
      );

      if (response.statusCode == 201) {
        print('Registration successful: ${response.body}');
        return "User created successfully."; 
      } else {
        print('Registration failed: ${response.body}');
        return jsonDecode(response.body)['message'] ?? 'Registration failed.';
      }
    } catch (e) {
      print('Error during registration: $e');
      return 'An error occurred'; 
    }
  }
}