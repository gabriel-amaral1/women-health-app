import 'package:flutter/material.dart';
import 'package:women_health_app/screens/Home.dart';
import 'package:women_health_app/screens/Login.dart';

/*
Colors:
  - Color(0xFF06BEE1) (AppBar Color)
  - Colors.white (Background Color)
  - Color(0xFF718F94) (Main Button Color)
  - Color(0xFF122932) (Help Button Color)
  - Color(0xFF1B2F33) (Choice Button Color)
*/

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      backgroundColor: Color(0xFFF0E7D8),
      scaffoldBackgroundColor: Color(0xFFA63A50),
      focusColor: Color(0xFF718F94),
      disabledColor: Color(0xFFE8DBC4)
    ),
    debugShowCheckedModeBanner: false,
    
    home: Home(),
  ));
}