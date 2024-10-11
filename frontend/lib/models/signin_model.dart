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
