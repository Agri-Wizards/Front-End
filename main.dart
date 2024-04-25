import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farm Friend',
      home: HomeScreen(), // Use HomeScreen widget here
      debugShowCheckedModeBanner: false,
    );
  }
}
