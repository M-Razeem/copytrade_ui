import 'package:flutter/material.dart';

import 'main.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  set(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(a),
               test1(set: set,),
            ],
          ),
        ),
      ),
    );
  }
}

class test1 extends StatefulWidget {
  final Function set;
  const test1({Key? key, required this.set}) : super(key: key);

  @override
  State<test1> createState() => _test1State();
}

class _test1State extends State<test1> {
  TextEditingController password = TextEditingController();
  var _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: password,
          obscureText: _isObscured,
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 0, style: BorderStyle.none),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 0, style: BorderStyle.none),
            ),
            hintText: "Password",
            hintStyle: TextStyle(color: Colors.grey),
            suffixIcon: IconButton(
              onPressed: () {
                setState(
                  () {
                    _isObscured = !_isObscured;
                  },
                );
              },
              icon: _isObscured
                  ? const Icon(
                      Icons.visibility,
                      color: Color.fromRGBO(243, 186, 47, 1),
                    )
                  : const Icon(
                      Icons.visibility_off,
                      color: Color.fromRGBO(243, 186, 47, 1),
                    ),
            ),
          ),
        ),
        TextButton(
          onPressed: ()  {
            a = password.text;
          },
          child: Text("Submit"),
        ),
      ],
    );
  }
}
