import 'package:flutter/material.dart';
import 'package:signin_signup_sample/view/sign_in/signin.dart';


void main() {
  runApp(const MyApp());
}

String email = "";
String password = "";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: signinpage(),
    );
  }
}