import 'package:flutter/material.dart';
import 'package:nevernote/models/profile_data.dart';
import 'package:nevernote/pages/auth/signin.dart';
import 'package:nevernote/pages/notes/notes.dart';
import 'package:nevernote/pages/profile_page.dart';
import 'package:nevernote/pages/auth/register.dart';
import 'pages/home_page.dart';
import 'package:nevernote/pages/landing_page.dart';



void main() => runApp(
    MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        titleTextStyle:  TextStyle(
          
          fontSize: 20.0,
          ),
          
      )
    ),
    // home:  const Register(), // changed by Abhijit

    //setting up named routes:
    initialRoute: '/landing_page',
    routes: {
      '/landing_page' : (context) => const LandingPage(),
      '/register' : (context) => const Register(),
      '/signin' : (context) => const SignIn(),
      '/home':  (context) => const Home(),
      '/profile' : (context) =>  ProfileCard(),
    },
  ),
);
 

