import 'package:flutter/material.dart';

class NotesCard extends StatefulWidget {
  // const NotesCard({super.key});
  final String head;
  final String body;
  NotesCard({required this.head , required this.body});

  @override

  State<NotesCard> createState() => _NotesCardState();
}

class _NotesCardState extends State<NotesCard> {

  @override


  Widget build(BuildContext context) {
    return ListView(
      // padding: EdgeInsets.all(15.0),
      
       
      
      
          children: [
            Container(
              padding: EdgeInsets.all(5),
              color: Colors.blue[200],
              // height: 50.0,
              child: Text(
                'NotesCard ${widget.head}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(7),
              color: const Color.fromARGB(255, 146, 143, 244),
              child: Text(
                'NotesCard ${widget.body}',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),

            // alignment: AlignmentDirectional(0,4 ),// padding: EdgeInsets.all(5.0),
          ],
        
    );
  }
}
