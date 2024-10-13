class NotesData  {

  String? NoteHeading;
  String? NoteBody;

  NotesData({
    this.NoteHeading,
    this.NoteBody,


  });

  NotesData.fromJson(Map<dynamic, dynamic> json) {
    this.NoteHeading = json['note_heading'];
    this.NoteBody = json['note_body'];

  }

  
}