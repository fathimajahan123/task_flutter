// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task_flutter/view/login/login.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passcontroller = TextEditingController();
    TextEditingController confirmpasscontroller = TextEditingController();
    final emailkey = GlobalKey<FormState>();
    final passkey = GlobalKey<FormState>();
    final confirmpasskey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign Up for Free",
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
                    return "password should be 6 characters";
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
            Form(
              key: confirmpasskey,
              child: TextFormField(
                controller: confirmpasscontroller,
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    hintText: "Your Confirm Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey))),
                validator: (value) {
                  if (value != passcontroller.text) {
                    return "incorrect password";
                  }
                },
                onChanged: (value) {
                  print(value.toString());
                  passkey.currentState!.validate();
                },
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor: WidgetStatePropertyAll(Colors.blue)),
              onPressed: () {
                String emaildata = emailcontroller.text;
                String passdata = passcontroller.text;

                if (passkey.currentState?.validate() == true &&
                    confirmpasskey.currentState?.validate() == true) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Login(emaildata: emaildata, passdata: passdata)));
                }
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  "Sign up",
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
                  "Already have an account?",
                  style: TextStyle(fontSize: 12),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login(
                                    emaildata: '',
                                    passdata: "",
                                  )));
                    },
                    child: Text(
                      "Sign in",
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
