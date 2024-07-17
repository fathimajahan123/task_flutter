// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task_flutter/view/home/home.dart';
import 'package:task_flutter/view/registration/registration.dart';

class Login extends StatelessWidget {
  final String emaildata;
  final String passdata;
  Login({required this.emaildata, required this.passdata});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passcontroller = TextEditingController();
    final emailkey = GlobalKey<FormState>();
    final passkey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign in to your Account",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Form(
              key: emailkey,
              child: TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                    hintText: "Your Email Address",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey))),
                validator: (value) {
                  if (value != null && value.contains("@")) {
                    return null;
                  } else {
                    return "incorrect email";
                  }
                },
                onChanged: (value) {
                  print(value.toString());
                  emailkey.currentState!.validate();
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
              key: passkey,
              child: TextFormField(
                controller: passcontroller,
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    hintText: "Your Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey))),
                validator: (value) {
                  if (value != null && value.length >= 6) {
                    return null;
                  } else {
                    return "enter correct password";
                  }
                },
                onChanged: (value) {
                  print(value.toString());
                  passkey.currentState!.validate();
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.check_box_outline_blank,
                  color: Colors.grey,
                ),
                Text(
                  "Remember Me",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  width: 220,
                ),
                Text(
                  "Forgot Password",
                  style: TextStyle(color: Colors.blue, fontSize: 12),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  backgroundColor: WidgetStatePropertyAll(Colors.blue)),
              onPressed: () {
                if (emaildata == emailcontroller.text &&
                    passdata == passcontroller.text &&
                    emaildata != "" &&
                    passdata != "") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(20),
                      duration: Duration(seconds: 5),
                      action: SnackBarAction(label: "retry", onPressed: () {}),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.blueGrey,
                      content: Text("failed to login")));
                }
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  "Sign in",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(fontSize: 12),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Registration()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.blue, fontSize: 12),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
