class RegisterModel {
  final String userName;
  final String userFirstName;
  final String userLastName;
  final String userEmail;
  final String userPhoneNumber;
  final String userPassword;

  RegisterModel({
    required this.userName,
    required this.userFirstName,
    required this.userLastName,
    required this.userEmail,
    required this.userPhoneNumber,
    required this.userPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_name': userName,
      'user_first_name': userFirstName,
      'user_last_name': userLastName,
      'user_email': userEmail,
      'user_phone_number': userPhoneNumber,
      'user_password': userPassword,
    };
  }
}
