import 'package:flutter/material.dart';
import 'package:gconsult/screens/Home.dart';
import 'package:gconsult/screens/Login.dart';

/*
Colors:
  - 0xFF06BEE1 (AppBar Color)
  - Colors.white (Background Color)
  - 0xFF718F94 (Main Button Color)
  - 0xFF122932 (Help Button Color)
  - 0xFF1B2F33 (Choice Button Color)
  - 0xFF1B2F33 (Hovered Choice Button Color)
*/

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      backgroundColor: Colors.white,
      primaryColor: Color(0xFF06BEE1), // floating action button
      scaffoldBackgroundColor: Color(0xFF06BEE1), // appbar
      buttonColor: Color(0xFF1768AC), // choice color
      hoverColor: Color(0xFF0F93C7), // choice color hover
      disabledColor: Color(0xFFF5F5F5) // background of textfield in UserData.dart
    ),
    debugShowCheckedModeBanner: false,
    
    home: Home(),
  ));
}