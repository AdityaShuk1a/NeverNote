import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nevernote/models/notes_data.dart';

class NotesDataService {
  List userNotes=[];
  fetchNotes() async {
    try{
      String BaseUrl = "http://127.0.0.1:8000/";
      final response = await http.get(Uri.parse(BaseUrl+"notes"));
      if(response.statusCode == 200){
        var data = response.body;
        var decodeData = jsonDecode(data);
        print(response.body);

        for(var data in decodeData){
          NotesData notes = NotesData.fromJson(data);
          userNotes.add(notes);
        }
        
        return userNotes;
      }
    }
    catch (e){
      throw Exception(e.toString());
    }
    

  }

}