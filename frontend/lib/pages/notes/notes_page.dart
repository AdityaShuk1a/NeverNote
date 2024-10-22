import 'package:flutter/material.dart';
import 'package:nevernote/components/end_drawer.dart';
import 'package:nevernote/pages/notes/notes.dart';

class NotesPage extends StatefulWidget {
  final String headd;
  final String bodyy;
  final String pk;
  NotesPage({required this.headd, required this.bodyy, required this.pk});
  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // Define color variables
  // Muted blue for AppBar

  final Color appBarBackgroundColor = Color(0xFF95B8D1);
  // Color.fromARGB(255, 119, 158, 232); // Soft teal for AppBar
  final Color iconColor = Colors.white; // White for icons
  final Color appBarTextColor = Colors.white; // White for AppBar text
  final Color pageBackgroundColor = Color(0xFF809BCE);
  // Color(0xFF95B8D1); // Muted blue for page background
  final Color containerBackgroundColor =
      Color.fromARGB(255, 235, 213, 231); // Light purple for containers
  final Color dividerColor =
      Color.fromARGB(255, 222, 218, 223); // Pale purple for dividers
  final Color textColor = Color.fromARGB(
      255, 223, 154, 184); // Darkened pink for better readability
  final Color gradientStartColor = const Color.fromARGB(
      255, 189, 194, 206); // Slightly darker gradient start
  final Color gradientEndColor =
      Color(0xFFE0F7FA); // Lightened for better readability
  final Color boxShadowColor =
      Colors.grey.withOpacity(0.3); // Softer box shadow
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
          "NOTE PAGE",
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
                icon: Icon(Icons.kebab_dining,
                    color: Colors.white), // Custom icon and color
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),
      endDrawer: EndDrawerBar(id: widget.pk),
      body: Container(
        decoration: BoxDecoration(
          color: pageBackgroundColor, // Page background color
        ),
        child: ListView(
          padding: const EdgeInsets.all(15.0),
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [gradientStartColor, gradientEndColor],
                ), // Gradient from white to light cyan
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
              // ignore: sort_child_properties_last
              child: Text(
                widget.headd,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 189, 57, 115),
                ),
              ),
              constraints: BoxConstraints(
                minHeight: 80.0, // Minimum height
                maxHeight:
                    double.infinity, // Allow height to grow based on content
              ),
            ),
            Divider(
              height: 20.0,
              color: dividerColor, // Divider color
              thickness: 2.0,
            ),
            Container(
              // height: 200,
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
              // ignore: sort_child_properties_last
              child: Text(
                widget.bodyy,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromARGB(255, 189, 57, 115),
                ),
              ),
              constraints: BoxConstraints(
                minHeight: 155.0, // Minimum height
                maxHeight:
                    double.infinity, // Allow height to grow based on content
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//done