import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nevernote/helpers/user_data.dart';
import 'package:nevernote/models/notes_data.dart';

class NotesDataService {
  // final String username = UserData.username.toString();
  
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

  Future<void> deleteNotes(String pk) async {
  try {
    String baseUrl = "http://127.0.0.1:8000/";
    final response = await http.delete(Uri.parse(baseUrl + "note/$pk/"));

    if (response.statusCode == 200) {
      print("Note deleted successfully.");
    } else {
      // Handle different response codes
      print("Failed to delete note. Status code: ");
      print("Response body: ");
    }
  } catch (e) {
    // Catch network or other types of errors
    print("An error occurred: ${e.toString()}");
    throw Exception("Failed to delete note: ${e.toString()}");
  }
}
  updateNotes(String pk) async {
    try{
      
    String baseUrl = "http://127.0.0.1:8000/";
    final response = await http.put(Uri.parse(baseUrl + "note/$pk/"));

    }
    catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> createNote(String username, String heading, String body ) async {
    // final String username = UserData.username.toString();
    String baseUrl = "http://127.0.0.1:8000/"; // Adjust the base URL if needed

    // Prepare the data to send to the backend (creating a new note)
    final noteData = CreateNotesData (
      noteHeading: heading,
      noteBody: body,
      postNote: false,
      username :username, 
    );
      
    
    print(json.encode(noteData.toJson()));
    try {
      final response = await http.post(
        Uri.parse(baseUrl + "notes"), // Use POST to create a new note
        body: json.encode(noteData),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 201) {
        // On success, maybe navigate back or show a success message
        print("Note created successfully.");
        // Navigator.pop(context); // You can navigate back after success
      } else {
        // Handle error response
        print("Failed to create note. Status code: ${response.statusCode}");
        print("Response: ${response.body}");
      }
    } catch (e) {
      print("An error occurred: $e");
    }
  }

}