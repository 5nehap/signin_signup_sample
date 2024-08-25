import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:signin_signup_sample/main.dart';
import 'package:signin_signup_sample/view/loginpage/login.dart';
import 'package:signin_signup_sample/view/sign_up/signup.dart';


class signinpage extends StatefulWidget {
  const signinpage({super.key});

  @override
  State<signinpage> createState() => _signinpageState();
}

class _signinpageState extends State<signinpage> {
  @override
  Widget build(BuildContext context) {
    // final _formKey = GlobalKey<FormState>();
    final emailcontroller = TextEditingController();
    final passwordcontroller = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,
        weight: 10,
        size: 30,color: Colors.black,),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 30),
                  child: Text(
                    "Sign in to your Account",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9),
                            borderSide: BorderSide(width: 2),
                          ),
                          hintText: "Your email addresss",
                          label: Text("email"),
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email address';
                          }
                          if (!emailcontroller.text.contains("@")) {
                            return 'email must contain @';
                          } else if (email!=emailcontroller.text) {
                            return "wrong email";
                          } else {
                            
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    controller: passwordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2),
                      ),
                      hintText: "password",
                      label: Text("password"),
                      enabledBorder: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      if (value.length < 8) {
                        return 'password must be  8 character';
                      } else if (password.isNotEmpty&&password!=passwordcontroller.text) {
                        return "wrong password";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Icon(Icons.check_box_outlined,
                          size: 35, color: Colors.black38),
                    ),
                    Text(
                      "Remember Me",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.all(10)),
                    SizedBox(
                      width: 40,
                    ),
                    Spacer(),
                    SizedBox(width: 5),
                    Text(
                      "Forgot password",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.blue),
                    )
                  ],
                ),
                Center(
                  child: Container(
                    height: 50,
                    width: 320,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        elevation: MaterialStateProperty.all(20),
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          if (emailcontroller.text == email &&
                              passwordcontroller.text == password) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                                (Route<dynamic> Route) => false);
                          }
                        }
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => signuppage(),
                              ));
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        ),
                      )
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }
}