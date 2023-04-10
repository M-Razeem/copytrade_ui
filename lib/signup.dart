import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'login.dart';
import 'main.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  var _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: darkMode? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).scaffoldBackgroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        title: Text(
          "Signup",
          style: TextStyle(
            color: Theme.of(context).splashColor,
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black12),
                height: MediaQuery.of(context).size.height*0.055,
                width: MediaQuery.of(context).size.width*0.85,
                child: TextField(
                  controller: userName,
                  obscureText: false,
                  style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(13),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none),
                    ),
                    hintText: "Username",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.black12,
                ),
                height: MediaQuery.of(context).size.height*0.055,
                width: MediaQuery.of(context).size.width*0.85,
                child: TextField(
                  controller: email,
                  style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(13),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none),
                      ),
                      hintText: "Your Email",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,)),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.black12,
                ),
                height: MediaQuery.of(context).size.height*0.055,
                width: MediaQuery.of(context).size.width*0.85,
                child: TextField(
                  controller: password,
                  obscureText: _isObscured,
                  style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(13),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none),
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            _isObscured = !_isObscured;
                          },
                        );
                      },
                      icon: _isObscured
                          ? Icon(
                              Icons.visibility,
                              color: Theme.of(context).splashColor,
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: Theme.of(context).splashColor,
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              RawMaterialButton(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                onPressed: () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  )
                      .then(
                    (value) {
                      FirebaseFirestore.instance
                          .collection("user")
                          .doc(value.user?.uid ?? "")
                          .set(
                        {
                          "email": email.text,
                          "password": password.text,
                          "username": userName.text,
                          "User ID": value.user?.uid ?? "",
                        },
                      );
                      password.clear();
                      email.clear();
                      userName.clear();
                    },
                  );
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const login()));
                },
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height*0.055,
                  minWidth: MediaQuery.of(context).size.width*0.85,
                ),
                fillColor: Theme.of(context).splashColor,
                elevation: 1,
                child: const Text(
                  "Sign up",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              const Text(
                '''By signing up, you agreed with our Terms of
              Services and Privacy Policy''',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Already have account? ",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: "Log in",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).splashColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const login()));
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
