import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nevernote/models/profile_data.dart';


class ProfileDataService {
  List<ProfileData> PD = [];
  fetchProfileData() async {
    try{

      String baseUrl = 'http://127.0.0.1:8000/';
      final response = await http.get(Uri.parse(baseUrl+'yaha/7b4d0834-e109-49b4-93fa-8474e47685cf'));

      print(response);
      if (response.statusCode == 200) {
        var data = response.body;

        var decodeData = jsonDecode(data.toString());
        
        print(decodeData);
        for (var data in decodeData){
          ProfileData pd = ProfileData.fromJson(data);
          PD.add(pd);
        }
        print(PD);
        return PD;
      } 
    }
    catch(e){
      throw Exception(e.toString());

    }
    
  }

}