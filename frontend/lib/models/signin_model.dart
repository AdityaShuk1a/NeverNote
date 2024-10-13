class SignInModel {
  final String userName;
  final String userPassword;

  SignInModel({
    required this.userName,
    required this.userPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': userName,
      'password': userPassword,
    };
  }
}

class LoginResponse {
  final bool success;
  final String? token;
  final String? error;

  LoginResponse({
    required this.success,
    this.token,
    this.error,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] ?? false,
      token: json['token'],
      error: json['error'],
    );
  }
}
