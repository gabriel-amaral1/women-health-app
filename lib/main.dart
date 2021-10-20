import 'package:flutter/material.dart';
import 'package:gconsult/screens/Home.dart';
import 'package:gconsult/screens/Login.dart';

/*
Colors:
  - 0xFFA63A50 (AppBar Color)
  - 0xFFF0E7D8 (Background Color)
  - 0xFF718F94 (Main Button Color)
  - 0xFF122932 (Help Button Color)
  - 0xFF1B2F33 (Choice Button Color)
  - 0xFF1B2F33 (Hovered Choice Button Color)
*/

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      backgroundColor: Color(0xFFF0E7D8),
      primaryColor: Color(0xFFA63A50),
      buttonColor: Color(0xFF718F94),
    ),
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}