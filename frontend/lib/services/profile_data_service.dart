import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nevernote/models/profile_data.dart';


class ProfileDataService {
<<<<<<< HEAD
  List PD = [];
=======
  List<ProfileData> PD = [];
>>>>>>> b1144980cbdb1967608c346798922b59a7529f6d
  fetchProfileData() async {
    try{

      String baseUrl = 'http://127.0.0.1:8000/';
<<<<<<< HEAD
      final response = await http.get(Uri.parse(baseUrl+'yaha/absdk'));
=======
      final response = await http.get(Uri.parse(baseUrl+'yaha/959cdb31-469a-4589-b658-9aa4b7c4806b'));
>>>>>>> b1144980cbdb1967608c346798922b59a7529f6d

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