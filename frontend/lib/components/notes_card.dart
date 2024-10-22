import 'package:flutter/material.dart';
import 'package:nevernote/pages/notes/notes_page.dart';

class NotesCard extends StatefulWidget {
  final String head;
  final String body;
  final String id;

  NotesCard({required this.head, required this.body, required this.id});

  @override
  State<NotesCard> createState() => _NotesCardState();
}

class _NotesCardState extends State<NotesCard> {
  // Define color variables
  final Color appBarBackgroundColor =
      Color.fromARGB(255, 119, 158, 232); // Soft teal for AppBar
  final Color iconColor = Colors.white; // White for icons
  final Color appBarTextColor = Colors.white; // White for AppBar text
  final Color pageBackgroundColor =
      Color(0xFF95B8D1); // Muted blue for page background
  final Color containerBackgroundColor =
      Color(0xFFDCD7D5); // Light greenish for containers
  final Color dividerColor = Color(0xFFD6EADF); // Pale green for dividers
  final Color textColor =
      Color.fromARGB(255, 189, 57, 115); // Darkened pink for better readability
  final Color gradientStartColor =
      Color.fromARGB(255, 203, 207, 227); // Slightly darker gradient start
  final Color gradientEndColor =
      Color.fromARGB(255, 207, 227, 216); // Lightened for better readability
  final Color boxShadowColor =
      Colors.grey.withOpacity(0.3); // Softer box shadow

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        gradient: LinearGradient(
          colors: [gradientStartColor, gradientEndColor], // Gradient colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: boxShadowColor,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotesPage(
                    headd: widget.head,
                    bodyy: widget.body,
                    pk: widget.id,
                  ),
                ),
              );
            },
            contentPadding: EdgeInsets.all(5),
            tileColor: Colors.transparent,
            title: Text(
              widget.head,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor, // Use text color variable
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotesPage(
                    headd: widget.head,
                    bodyy: widget.body,
                    pk: widget.id,
                  ),
                ),
              );
            },
            contentPadding: EdgeInsets.all(7),
            tileColor: Colors.transparent,
            title: Text(
              widget.body.length > 50
                  ? '${widget.body.substring(0, 50)}...'
                  : widget.body,
              // maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                color: textColor, // Use text color variable
              ),
            ),
          ),
        ],
      ),
    );
  }
}