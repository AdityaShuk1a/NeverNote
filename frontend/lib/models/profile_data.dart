<<<<<<< HEAD
=======
import 'dart:convert';
import 'package:http/http.dart' as http;
>>>>>>> b1144980cbdb1967608c346798922b59a7529f6d

class ProfileData {
  String? fullName;
  String? userEmail;
  int? userPhoneNumber;

  ProfileData({
    this.fullName,
    this.userEmail,
    this.userPhoneNumber,
  });

  ProfileData.fromJson(Map<dynamic, dynamic> json) {
    this.fullName=  json['user_name'];
    this.userEmail= json['user_email'];
    this.userPhoneNumber= json['user_phone_number'];
    
  }
}


