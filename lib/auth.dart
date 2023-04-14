import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copytrade_ui/Navbar/home.dart';
import 'package:copytrade_ui/login.dart';
import 'package:copytrade_ui/main.dart';
import 'package:copytrade_ui/navbar.dart';
import 'package:copytrade_ui/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            if(currentUserId!=(snapshot.data?.uid??"")){
              currentUserId=snapshot.data?.uid??"";
              getUser();
            }
            return Navbar();
          }
          else{
            return login();
          }
        },
      ),
    );
  }
}
