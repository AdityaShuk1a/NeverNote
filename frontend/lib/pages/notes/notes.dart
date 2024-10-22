import 'package:flutter/material.dart';
import 'package:nevernote/components/notes_card.dart';
import 'package:nevernote/helpers/user_data.dart';
import 'package:nevernote/pages/home_page.dart';
import 'package:nevernote/pages/notes/create_note.dart';
import 'package:nevernote/services/notes_data_service.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});
  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final String username = UserData.username.toString();
  @override
  Widget build(BuildContext context) {
    // Define colors for a chill, relaxing theme
    var backgroundColor = Color(0xFFDCD7D5); // Soft teal background
    var appBarColor = Color(0xFF95B8D1); // Muted blue for AppBar
    var textColor = Color(0xFFB8E0D4); // Light greenish for text
    var accentColor = Color(0xFFD6EADF); // Pale green for accents
    var noNotesTextColor =
        Color(0xFFEAC4D5); // Gentle pink for no-notes message

    return Scaffold(
      floatingActionButton: Container(
        width: 70, // Set width for larger size
        height: 70, // Set height for larger size
        child: FloatingActionButton(
          backgroundColor: accentColor, // Match the color scheme
          onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => CreateNotes(username: username)));
          },
          child: Icon(Icons.add, size: 30), // Adjust icon size if needed
        ),
      ),
      backgroundColor: backgroundColor, // Chill background color
      appBar: AppBar(
        backgroundColor: appBarColor, // Chill AppBar color
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context) => Home()));
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white, // Icon color
        ),
        title: Text(
          "MY NOTES",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white, // Title color
            fontSize: 35.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: FutureBuilder(
        future: NotesDataService().fetchNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: accentColor), // Loading indicator color
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: TextStyle(color: textColor), // Error text color
              ),
            );
          } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
            return Center(
              child: Text(
                'No notes available',
                style: TextStyle(color: noNotesTextColor), // No-notes message color
              ),
            );
          } else {
            var notes = snapshot.data as List;
            return ListView.separated(
              padding: const EdgeInsets.all(6.0),
              itemCount: notes.length,
              separatorBuilder: (context, index) => SizedBox(height: 8.0),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Color(0xFFE0F7FA)
                      ], // Gradient from white to light cyan
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: NotesCard(
                    head: notes[index].NoteHeading,
                    body: notes[index].NoteBody,
                    id: notes[index].NotesId,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
