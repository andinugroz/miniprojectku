import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miniproject/pages/login.dart';

void main() {
  runApp(const MyMiniProject());
}

class MyMiniProject extends StatelessWidget {
  const MyMiniProject({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
        home: LoginPage());
  }
}
