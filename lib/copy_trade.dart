import 'package:copytrade_ui/privacy.dart';
import 'package:copytrade_ui/profile.dart';
import 'package:copytrade_ui/profile/settings.dart';
import 'package:copytrade_ui/traders.dart';
import 'package:copytrade_ui/wallet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Navbar/earn.dart';
import 'login.dart';
import 'main.dart';

class CopyTrade extends StatefulWidget {
  const CopyTrade({Key? key}) : super(key: key);

  @override
  State<CopyTrade> createState() => _CopyTradeState();
}

class _CopyTradeState extends State<CopyTrade> {
  final TextEditingController _controller = TextEditingController();
  bool _isExpanded = false;
  bool _value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: Drawer(
        width: MediaQuery.of(context).size.width*0.6,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            Text(
              "Menu",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                color: Theme.of(context).textTheme.titleLarge?.color,
                fontWeight: FontWeight.w600,
              ),
            ),
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings1()));
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
                  "Privacy Policy & Terms",
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
      appBar: AppBar(
        backgroundColor: darkMode? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).scaffoldBackgroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
           Icon(Icons.notifications)
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.0225,),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width*0.045,),
                Text("TRADES"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Theme.of(context).shadowColor
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search Trades",
                    hintStyle: TextStyle(fontSize: 11),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none
                    )
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width*0.925,
                height: MediaQuery.of(context).size.height*0.1,
                decoration:_isExpanded==false? BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color:darkMode?Color(0xff394754):Theme.of(context).shadowColor
                ):BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft:Radius.circular(12) ),
                  color:darkMode?Color(0xff394754):Theme.of(context).shadowColor,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width*0.025,),
                    CircleAvatar(
                      radius: 23,
                      backgroundColor:Theme.of(context).shadowColor,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                    Container(
                      width: MediaQuery.of(context).size.width*0.45,
                        child: Text("Mohanlal",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),)),
                    SizedBox(width: MediaQuery.of(context).size.width*0.15,),
                    Switch(
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      },

                      activeColor: Colors.white,
                      inactiveThumbColor: Colors.grey,
                      activeTrackColor:Color(0xffFAD432),
                      inactiveTrackColor: Colors.grey[300],
                    )

                  ],
                ),
              ),
            ),
            AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: _isExpanded ? MediaQuery.of(context).size.height*0.3 : 0.0,
                width:MediaQuery.of(context).size.width*0.925,
                child:SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.925,
                    height:  MediaQuery.of(context).size.height*0.24,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),bottomLeft: Radius.circular(12)),
                        color:darkMode?Color(0xff394754):Theme.of(context).shadowColor
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Divider(color: Colors.yellow,),
                          SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                          Row(
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width*0.028,),
                              Text("ROI Monthly",style: TextStyle(fontSize:15,fontWeight: FontWeight.w700,color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d)),),
                              SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                              Container(
                                width: MediaQuery.of(context).size.width*0.28,
                                  child: Text("33.907\%",style: TextStyle(color: Color(0xffFAD432),fontSize: 20,fontWeight: FontWeight.w700),))
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.025,),
                          Row(
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width*0.028,),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.transparent,
                                child: SvgPicture.asset("assets/vector.svg"),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.008,),
                              Container(
                                width: MediaQuery.of(context).size.width*0.29,
                                  child: Text("Win Rate Montly",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),)),
                              SizedBox(width: MediaQuery.of(context).size.width*0.008,),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.transparent,
                                child: SvgPicture.asset("assets/Group 119.svg"),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.008,),
                              Container(
                               width: MediaQuery.of(context).size.width*0.19,
                                  child: Text("Today's PNL",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),)),
                              SizedBox(width: MediaQuery.of(context).size.width*0.008,),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.transparent,
                                child: SvgPicture.asset("assets/Group 120.svg"),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.008,),
                              Container(
                                  width: MediaQuery.of(context).size.width*0.18,
                                  child: Text("Followers",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),))
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.003,),
                          Row(
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width*0.095,),
                              Container(
                                  width: MediaQuery.of(context).size.width*0.29,
                                  child: Text("289.012\%",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Color(0xffFAD432)),)),
                              SizedBox(width: MediaQuery.of(context).size.width*0.0623),
                              Container(
                                  width: MediaQuery.of(context).size.width*0.19,
                                  child: Text("\$289.012",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Color(0xffFAD432)))),
                              SizedBox(width: MediaQuery.of(context).size.width*0.075,),
                              Container(
                                  width: MediaQuery.of(context).size.width*0.18,
                                  child:Text("199",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Color(0xffFAD432))))
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                          Row(
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width*0.028,),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.transparent,
                                child: SvgPicture.asset("assets/path1006.svg"),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.008,),
                              Container(
                                  width: MediaQuery.of(context).size.width*0.29,
                                  child: Text("ROI Total",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),)),
                              SizedBox(width: MediaQuery.of(context).size.width*0.008,),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.transparent,
                                child: SvgPicture.asset("assets/Group 122.svg"),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.008,),
                              Container(
                                  width: MediaQuery.of(context).size.width*0.19,
                                  child: Text("AUM",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),)),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.003,),
                          Row(
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width*0.095,),
                              Container(
                                  width: MediaQuery.of(context).size.width*0.29,
                                  child: Text("289.012\%",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Color(0xffFAD432)),)),
                              SizedBox(width: MediaQuery.of(context).size.width*0.06,),
                              Container(
                                  width: MediaQuery.of(context).size.width*0.19,
                                  child: Text("\$289.012",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Color(0xffFAD432)))),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
