import 'package:nevernote/helpers/user_data.dart';

class NotesData  {
  String? username = UserData.username.toString();
  String? NotesId;
  String? NoteHeading;
  String? NoteBody;

  NotesData({
    this.NotesId,
    this.NoteHeading,
    this.NoteBody,
    this.username,



  });

  NotesData.fromJson(Map<dynamic, dynamic> json) {
    this.NotesId = json['id'];
    this.NoteHeading = json['note_heading'];
    this.NoteBody = json['note_body'];

  }

  
}
class CreateNotesData {
  final String noteHeading;
  final String noteBody;
  final bool postNote;
  final String username;

  CreateNotesData({
    required this.noteHeading,
    required this.noteBody,
    required this.postNote,
    required this.username,
  });

  // Converts the CreateNotesData instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'note_heading': noteHeading,
      'note_body': noteBody,
      'post_note_global': postNote,  // If this is a required field, make sure it's in the backend model
      'user_name_pk': username,     // Assuming username is the user id or username
    };
  }
}