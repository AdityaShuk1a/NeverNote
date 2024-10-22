import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nevernote/models/signin_model.dart';

class SignInService {
  Future<LoginResponse> login(SignInModel signInModel) async {
    const String apiUrl = 'http://127.0.0.1:8000/login'; 

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(signInModel.toJson()),
      );

      if (response.statusCode == 200) {
        print('signin successful: ${response.body}');
        return LoginResponse.fromJson(jsonDecode(response.body));
      } else {
        print('signin successful: ${response.body}');
        return LoginResponse(success: false, error: 'Invalid credentials');
      }
    } catch (e) {
      print('Error during signin: $e');
      return LoginResponse(success: false, error: 'An error occurred: $e');
    }
  }
}