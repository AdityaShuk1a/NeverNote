import 'package:flutter/material.dart';
import 'package:nevernote/models/profile_data.dart';
import 'package:nevernote/pages/auth/signin.dart';
import 'package:nevernote/pages/profile_page.dart';
import 'pages/home_page.dart';
<<<<<<< HEAD
import 'pages/auth/register.dart';
import 'pages/auth/signin.dart';
import 'pages/auth/register.dart';
import 'pages/auth/signin.dart';
=======
>>>>>>> main

void main() => runApp(MaterialApp(
  theme: ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle:  TextStyle(
        
        fontSize: 20.0,
        ),
    )
  ),
<<<<<<< HEAD
  home: const SignIn(),
=======
  home: ProfileCard(),

>>>>>>> main
));
 

