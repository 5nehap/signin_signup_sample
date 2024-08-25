import 'package:flutter/material.dart';
import 'package:signin_signup_sample/main.dart';
import 'package:signin_signup_sample/view/sign_in/signin.dart';


class signuppage extends StatelessWidget {
  const signuppage({super.key});

  @override
  Widget build(BuildContext context) {
    //final _formKey = GlobalKey<FormState>();
    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController passwordConfirmedController =
        TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          weight: 10,
          size: 30,
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 30),
                  child: Text(
                    "Sign up for free",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9),
                          borderSide: BorderSide(width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintText: "Your email addresss",
                        label: Text("email")),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email address';
                      }
                      if (!emailcontroller.text.contains("@")) {
                        return 'please enter a valid emial adress';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordController,
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
                        return 'Password must be atleast 6 characters';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    obscureText: true,
                    controller: passwordConfirmedController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 2),
                      ),
                      hintText: "Your confirm password",
                      label: Text("confirm password"),
                      enabledBorder: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter confirm password';
                      }
                      if (value != passwordController.text) {
                        return 'Password do not match';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
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
                          email = emailcontroller.text;
                          password = passwordController.text;

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => signinpage(),
                              ));
                        }
                      },
                      child: Text(
                        "Sign up",
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
                        "Already have an account?",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => signinpage(),
                              ));
                        },
                        child: Text(
                          "Sign in",
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