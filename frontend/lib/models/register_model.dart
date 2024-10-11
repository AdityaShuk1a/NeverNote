class RegisterModel {
  String username;
  String firstName;
  String lastName;
  String email;
  String phone;
  String password;

  RegisterModel({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }
}
