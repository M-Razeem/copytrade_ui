import 'package:copytrade_ui/privacy.dart';
import 'package:copytrade_ui/profile.dart';
import 'package:copytrade_ui/profile/settings.dart';
import 'package:copytrade_ui/traders.dart';
import 'package:copytrade_ui/wallet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login.dart';
import '../main.dart';
import 'earn.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: darkMode ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).scaffoldBackgroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Menu",
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
              color: Theme.of(context).textTheme.titleLarge?.color,
              fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                },
                child: Container(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
                  width: MediaQuery.of(context).size.width*0.95,
                  child: Text(
                    "Profile",
                    style: TextStyle(
                        fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                        fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
                        color: Theme.of(context).textTheme.bodyMedium?.color
                    ),
                  ),
                ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Wallet()));
              },
              child: Container(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
                width: MediaQuery.of(context).size.width*0.95,
                child: Text(
                    "Wallet",
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                      fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
                      color: Theme.of(context).textTheme.bodyMedium?.color
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            TextButton(
              onPressed: (){

              },
              child: Container(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
                width: MediaQuery.of(context).size.width*0.95,
                child: Text(
                    "Connect To Binance",
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                      fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
                      color: Theme.of(context).textTheme.bodyMedium?.color
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Traders()));
              },
              child: Container(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
                width: MediaQuery.of(context).size.width*0.95,
                child: Text(
                    "Traders",
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                      fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
                      color: Theme.of(context).textTheme.bodyMedium?.color
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
              },
              child: Container(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
                width: MediaQuery.of(context).size.width*0.95,
                child: Text(
                    "Settings",
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                      fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
                      color: Theme.of(context).textTheme.bodyMedium?.color
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            TextButton(
              onPressed: (){

              },
              child: Container(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
                width: MediaQuery.of(context).size.width*0.95,
                child: Text(
                    "Support",
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                      fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
                      color: Theme.of(context).textTheme.bodyMedium?.color
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            TextButton(
              onPressed: (){

              },
              child: Container(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
                width: MediaQuery.of(context).size.width*0.95,
                child: Text(
                    "Guide",
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                      fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
                      color: Theme.of(context).textTheme.bodyMedium?.color
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Earn()));
              },
              child: Container(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
                width: MediaQuery.of(context).size.width*0.95,
                child: Text(
                    "Refer & Earn",
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                      fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
                      color: Theme.of(context).textTheme.bodyMedium?.color
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Privacy()));
              },
              child: Container(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
                width: MediaQuery.of(context).size.width*0.95,
                child: Text(
                    "Privacy Policy &\nTerms",
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                      fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
                      color: Theme.of(context).textTheme.bodyMedium?.color
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            TextButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const login()));
              },
              child: Container(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.02),
                width: MediaQuery.of(context).size.width*0.95,
                child: Text(
                    "Logout",
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                    fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
                    color: Theme.of(context).textTheme.bodyMedium?.color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
