import 'dart:convert';
import 'package:http/http.dart' as http;

class NotesDataService {

  fetchNotes() async {
    try{
      String BaseUrl = "http://127.0.0.1:8000/";
      final response = await http.get(Uri.parse(BaseUrl+""));
      if(response.statusCode == 200){
        String data = response.body;
        String decodeData = jsonDecode(data);
        print(decodeData);
      }
    }
    catch (e){
      throw Exception(e.toString());
    }


  }

}