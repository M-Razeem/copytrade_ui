import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'main.dart';


class Traders extends StatefulWidget {
  const Traders({Key? key}) : super(key: key);

  @override
  State<Traders> createState() => _TradersState();
}

class _TradersState extends State<Traders> {

  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: darkMode? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).scaffoldBackgroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        toolbarHeight: 20,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.03,
                ),
                Text(
                    "Traders",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.01,
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.78,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 1,
                  itemBuilder: (context,index){
                    return Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height*0.3,
                          width: MediaQuery.of(context).size.width*0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.black12
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.02,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*0.03,
                                  ),
                                  Text(
                                    "Trader 01"
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height*0.2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                      "Follow",
                                    style: TextStyle(
                                      fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                      fontWeight: FontWeight.w800
                                    )
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*0.03,
                                  ),
                                  FlutterSwitch(
                                    width: MediaQuery.of(context).size.width*0.16,
                                      height: MediaQuery.of(context).size.height*0.04,
                                      activeColor: Theme.of(context).splashColor,
                                      value: status,
                                      onToggle: (bool val){
                                        setState(() {
                                          status=val;
                                        });
                                      },
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width*0.03,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
