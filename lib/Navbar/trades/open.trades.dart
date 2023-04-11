import 'package:alxgration_speedometer/speedometer.dart';
import 'package:copytrade_ui/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OpenTrades extends StatefulWidget {
  const OpenTrades({Key? key}) : super(key: key);

  @override
  State<OpenTrades> createState() => _OpenTradesState();
}

class _OpenTradesState extends State<OpenTrades> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.06),
            Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Theme.of(context).shadowColor,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: darkMode?Theme.of(context).scaffoldBackgroundColor : Theme.of(context).scaffoldBackgroundColor,
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.30,
                      height: MediaQuery.of(context).size.height*0.14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Theme.of(context).indicatorColor,
                        border: Border.all(color: darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("\$80",style: TextStyle(fontSize:36,color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d) ),),
                          Text("Total",style: TextStyle(fontSize: 20,color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d)),)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                SizedBox(height: MediaQuery.of(context).size.height*0.241,child: ColoredBox(color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d)),width: 1.5,),
                SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                CircleAvatar(
                  radius: 4.5,
                  backgroundColor:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d) ,
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("BLUE BIRD/USDT",style: TextStyle(fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),),
                    Text("100\%",style: TextStyle(fontSize: 15,fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),)
                  ],
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.06),
            Container(
              width: MediaQuery.of(context).size.width*0.95,
              height: MediaQuery.of(context).size.height*0.06,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(12),
                 color:darkMode?Color(0xff394754):Theme.of(context).shadowColor
             ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.06),
                    child: Text("SYMBOL",style: TextStyle(color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d),fontSize: 13,fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AMOUNT",style: TextStyle(color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d),fontSize: 13,fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight)),
                        Text("(fullfilled)",style: TextStyle(color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d),fontSize: 9,fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: MediaQuery.of(context).size.width*0.03),
                    child: Text("PROGRESS",style: TextStyle(color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d),fontSize: 13,fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight)),
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.015),
            Container(
        width: MediaQuery.of(context).size.width*0.95,
        height: MediaQuery.of(context).size.height*0.16,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color:darkMode?Color(0xff394754):Theme.of(context).shadowColor
        ),
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           SizedBox(width: MediaQuery.of(context).size.width*0.018,),
           CircleAvatar(
             radius: 23,
             backgroundColor: Color(0xff27DDFC),
             child: Center(child: Text("B",style: TextStyle(fontSize: 32,color: Colors.white),)),
           ),
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               SizedBox(height: MediaQuery.of(context).size.height*0.020,),
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("BLUE BIRD/USDT",style: TextStyle(fontSize: 15,fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),),
                   SizedBox(height: MediaQuery.of(context).size.height*0.025),
                   Row(
                     children: [
                       CircleAvatar(
                         radius: 10,
                         backgroundColor: Color(0xff25A27B),
                         child: SvgPicture.asset("assets/t.svg"),
                       ),
                       SizedBox(width: MediaQuery.of(context).size.width*0.015,),
                       Text("9.11")
                     ],
                   )
                 ],
               ),
             ],
           ),
           SizedBox(width: MediaQuery.of(context).size.width*0.02,),
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               SizedBox(height: MediaQuery.of(context).size.height*0.020,),
               Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("\$ 9.84",style: TextStyle(fontSize: 15,fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),),
                   SizedBox(height: MediaQuery.of(context).size.height*0.025),
                   Text("\$(4.98)",style: TextStyle(fontSize: 15,fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),),
                 ],
               ),
             ],
           ),

         ],
       ),
      )
          ],
        ),
      ),
    );
  }
}
