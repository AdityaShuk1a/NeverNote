import 'package:flutter/material.dart';
import 'package:nevernote/models/profile_data.dart';
import 'package:nevernote/pages/auth/signin.dart';
import 'package:nevernote/pages/notes/notes.dart';
import 'package:nevernote/pages/profile_page.dart';
import 'pages/home_page.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle:  TextStyle(
        
        fontSize: 20.0,
        ),
    )
  ),
  home: Home(),

));
 

