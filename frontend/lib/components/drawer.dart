import 'package:flutter/material.dart';
import 'package:nevernote/pages/notes/notes.dart';
import 'package:nevernote/pages/profile_page.dart';



class DrawerBar extends StatelessWidget {
  const DrawerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      
      child: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Text(
              "Menu",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            ),
          ),
          ListTile(
            title: const Text(
              "Profile",
              style: TextStyle(
                color: Colors.white,
              ),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileCard()),
              );
            },
          ),
          ListTile(
            title: const Text(
              "Notes",
              style: TextStyle(
                color: Colors.white,
              ),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notes()),
              );
            },
          ),
          // ListTile(
            
          //   title: const Text(
          //     "Logout",
          //     style: TextStyle(
          //       color: Colors.white,
          //     ),),
          //   onTap: () {
              
          //   },
          // ),
        ],
      ),
    );
  }
}
