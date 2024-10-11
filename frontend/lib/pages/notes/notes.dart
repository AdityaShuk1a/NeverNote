import 'package:flutter/material.dart';
import 'package:nevernote/components/notes_card.dart';
import 'package:nevernote/pages/home_page.dart';
import 'package:nevernote/services/notes_data_service.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        title: const Text(
          "Notes",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: FutureBuilder(
          future: NotesDataService().fetchNotes(),
          builder: (context, snapshot) {
            var notes = snapshot.data as List;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return NotesCard(
                    head: notes[index].NoteHeading,
                    body: notes[index].NoteBody);
              },
            );
            // return Container();
          }),
    );
  }
}
