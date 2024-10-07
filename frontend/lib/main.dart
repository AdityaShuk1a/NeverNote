import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/auth/register.dart';
import 'pages/auth/signin.dart';
import 'pages/auth/register.dart';
import 'pages/auth/signin.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle:  TextStyle(
        
        fontSize: 20.0,
        ),
    )
  ),
  home: const SignIn(),
));
 

