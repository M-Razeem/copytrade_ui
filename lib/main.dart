import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copytrade_ui/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

String? currentUserMail;
String? currentUserName;
String? currentUserId="";
Map<String,dynamic>? currentUserData={};
StreamController<int> streamController=StreamController<int>();
bool darkMode = false;
IconData iconDark = Icons.dark_mode;
IconData iconLight = Icons.light_mode;

String a="hello world";

getUser() async{
  DocumentSnapshot<Map<String,dynamic>> doc= await FirebaseFirestore.instance.collection("users").doc(currentUserId).get();
  currentUserData=doc.data()!;
  currentUserName=currentUserData?["username"];
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

ThemeData lightTheme = ThemeData(
  focusColor: Colors.black12,
  disabledColor: Color.fromRGBO(245, 245, 245, 1),
  shadowColor: Color.fromRGBO(209, 211, 213, 1),
  indicatorColor: Color.fromRGBO(234, 235, 237, 1),
  hoverColor: Colors.grey,
  splashColor: Color.fromRGBO(250, 212, 50, 1),
  highlightColor: Color.fromRGBO(243, 244, 246, 1),
  useMaterial3: true,
  hintColor: Colors.black45,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    color: Color.fromRGBO(255, 255, 255, 1),
  ),
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color.fromRGBO(245, 245, 245, 1),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color.fromRGBO(250, 212, 50, 1),
  ),
  textTheme: const TextTheme(
      bodySmall: TextStyle(
          fontSize: 10,
          color: Colors.black
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        color: Colors.black,
        fontWeight: FontWeight.w800,
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        fontSize: 40,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
          fontSize: 20,
          color: Colors.black
      ),
    titleLarge: TextStyle(
        fontSize: 30,
        color: Colors.black
    ),
  ),
  iconTheme: const IconThemeData(
    color: Color.fromRGBO(250, 212, 50, 1),
  ),
);

ThemeData darkTheme = ThemeData(
  focusColor: Color.fromRGBO(41, 49, 60, 1),
  dividerColor: Color.fromRGBO(40, 48, 59, 0.7),
  disabledColor: Color.fromRGBO(42, 48, 62, 1),
  indicatorColor: Color.fromRGBO(23, 30, 38, 1),
  shadowColor: Color.fromRGBO(52, 59, 70, 1),
  hoverColor: Colors.grey.shade600,
  splashColor: Color.fromRGBO(250, 212, 50, 1),
  highlightColor: Color.fromRGBO(65, 74, 89, 1),
  useMaterial3: true,
  hintColor: Colors.white,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    color: Color.fromRGBO(31, 38, 48, 1),
  ),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color.fromRGBO(23, 30, 38, 1),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color.fromRGBO(250, 212, 50, 1),
  ),
  textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontSize: 10,
        color: Colors.white,
        fontWeight: FontWeight.w800,
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        color: Colors.white,
        fontWeight: FontWeight.w800,
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        fontSize: 40,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
          fontSize: 20,
          color: Colors.white
      ),
    titleLarge: TextStyle(
      fontSize: 30,
        color: Colors.white
    ),
  ),
  iconTheme: const IconThemeData(
    color: Color.fromRGBO(250, 212, 50, 1),
  ),
);


class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    streamController.stream.listen((event) {
     setState(() {

     });
   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: darkMode ? darkTheme : lightTheme,
      home: Auth(),
    );
  }
}
