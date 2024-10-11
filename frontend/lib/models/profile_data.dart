
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


