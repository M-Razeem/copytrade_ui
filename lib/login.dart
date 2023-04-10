import 'package:copytrade_ui/navbar.dart';
import 'package:copytrade_ui/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
          "Login",
          style: TextStyle(
            color: Theme.of(context).splashColor,
            fontWeight: FontWeight.bold,
            fontSize: 28,
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
                  color: Colors.black12,
                ),
                height: MediaQuery.of(context).size.height*0.055,
                width: MediaQuery.of(context).size.width*0.85,
                child: TextField(
                  controller: email,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyMedium?.color
                  ),
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
                      hintStyle: TextStyle(
                          color: Colors.grey,
                        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                      )),
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
                    hintStyle: TextStyle(
                        color: Colors.grey,
                      fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                    ),
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
                        color: Theme.of(context).splashColor
                      )
                          : Icon(
                        Icons.visibility_off,
                        color: Theme.of(context).splashColor
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
                onPressed: (){
                  FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text).
                  then((value){
                    if(value.user!=null){
                      currentUserId=value.user?.uid??"";
                      getUser();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Navbar()));
                    }
                    else{
                      print("Error");
                    }
                  });
                },
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height*0.055,
                  minWidth: MediaQuery.of(context).size.width*0.85,
                ),
                fillColor: Theme.of(context).splashColor,
                elevation: 1,
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    TextSpan(
                      text: "Sign up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).splashColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const signup()));
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
