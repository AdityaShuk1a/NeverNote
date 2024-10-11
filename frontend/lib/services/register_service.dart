// lib/services/register_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/register_model.dart';

class RegisterService {
  Future<bool> registerUser(RegisterModel registerModel) async {
    final String baseUrl = 'http://127.0.0.1:8000/api/register/'; //    ADITYA----> CHECK THIS 

    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(registerModel.toJson()),
      );

      if (response.statusCode == 200) {
        // yeah same confusion here about how to handle successful registration, maybe navigate to login page or home page
        print('Registration successful: ${response.body}');
        return true; 
      } else {
        print('Registration failed: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error during registration: $e');
      return false;
    }
  }
}
