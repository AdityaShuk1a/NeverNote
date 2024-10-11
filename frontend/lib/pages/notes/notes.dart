import 'package:flutter/material.dart';
import 'package:nevernote/pages/home_page.dart';
import 'package:nevernote/services/notes_data_service.dart';

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
          onPressed: (){
            Navigator.pop(context,
            MaterialPageRoute(builder: (context)=> Home()));
          },
          icon:const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          ),
        title:const Text("Notes",
        style: TextStyle(
          fontSize: 20.0,
          
        ),
        ),
      ),
      body: FloatingActionButton(onPressed: (){
        return NotesDataService().fetchNotes();
      },
      child: Icon(Icons.refresh),
      ),
    );
  }
}