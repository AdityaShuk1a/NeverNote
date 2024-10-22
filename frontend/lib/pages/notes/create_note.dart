import 'package:flutter/material.dart';
import 'package:nevernote/components/end_drawer.dart';
import 'package:nevernote/helpers/user_data.dart';
import 'package:nevernote/pages/notes/notes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nevernote/services/notes_data_service.dart'; // For encoding the data to JSON

class CreateNotes extends StatefulWidget {
  CreateNotes({required this.username});
  final String username;
  @override
  State<CreateNotes> createState() => _CreateNotesState();
}

class _CreateNotesState extends State<CreateNotes> {
  NotesDataService createNoteService = NotesDataService();
  // Controllers for the text fields
  TextEditingController headController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  // Define color variables
  final Color appBarBackgroundColor = Color(0xFF95B8D1);
  final Color iconColor = Colors.white;
  final Color appBarTextColor = Colors.white;
  final Color pageBackgroundColor = Color(0xFF809BCE);
  final Color containerBackgroundColor =
      Color.fromARGB(255, 235, 213, 231);
  final Color dividerColor = Color.fromARGB(255, 222, 218, 223);
  final Color textColor = Color.fromARGB(255, 223, 154, 184);
  final Color gradientStartColor = const Color.fromARGB(255, 189, 194, 206);
  final Color gradientEndColor = Color(0xFFE0F7FA);
  final Color boxShadowColor = Colors.grey.withOpacity(0.3);
//done
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarBackgroundColor,
        leading: IconButton(
          color: iconColor,
          onPressed: () {
            Navigator.pop(
                context, MaterialPageRoute(builder: (context) => Notes()));
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Create New Note",
          style: TextStyle(
            color: appBarTextColor,
            fontSize: 25.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.save, color: Colors.white), // Save icon
                onPressed: () {
                  String head = headController.text;
                  String body = bodyController.text;
                  // Call the createNote function to send data to the backend
                  print(widget.username);
                  createNoteService.createNote(widget.username, head ,body  );
                  Navigator.pop(context);
                },
              );
            },
          ),
        ],
      ),
      endDrawer: EndDrawerBar(id: ""), // No pk needed for create page
      body: Container(
        decoration: BoxDecoration(
          color: pageBackgroundColor,
        ),
        child: ListView(
          padding: const EdgeInsets.all(15.0),
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [gradientStartColor, gradientEndColor],
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: boxShadowColor,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: headController,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 189, 57, 115),
                ),
                decoration: InputDecoration(
                  hintText: "Enter Title",
                  border: InputBorder.none,
                ),
                maxLines: 1,
              ),
              constraints: BoxConstraints(
                minHeight: 80.0,
                maxHeight: double.infinity,
              ),
            ),
            Divider(
              height: 20.0,
              color: dividerColor,
              thickness: 2.0,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [gradientStartColor, gradientEndColor],
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: boxShadowColor,
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: bodyController,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromARGB(255, 189, 57, 115),
                ),
                decoration: InputDecoration(
                  hintText: "Enter Body",
                  border: InputBorder.none,
                ),
                maxLines: null, // Allows multiple lines
              ),
              constraints: BoxConstraints(
                minHeight: 155.0,
                maxHeight: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
