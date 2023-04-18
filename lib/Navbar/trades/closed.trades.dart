import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../main.dart';

class ClosedTrades extends StatefulWidget {
  @override
  _ClosedTradesState createState() => _ClosedTradesState();
}

class _ClosedTradesState extends State<ClosedTrades> {
  bool _isExpanded = false;
  int percentageValue=30;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     extendBody: true,
     extendBodyBehindAppBar: darkMode ? true : false,
     backgroundColor: darkMode ? Colors.transparent : Theme.of(context).scaffoldBackgroundColor,
     body: darkMode? Container(
       height: MediaQuery.of(context).size.height*1,
       width: MediaQuery.of(context).size.width*1,
       decoration: BoxDecoration(
         image: DecorationImage(
           image: AssetImage(
             "assets/background.png",
           ),
           fit: BoxFit.cover,
         ),
       ),
       child: SafeArea(
         child: Center(
           child: Column(
             children: [
               SizedBox(height:MediaQuery.of(context).size.height*0.042),
               Text("TOTAL CHANGE",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
               SizedBox(height:MediaQuery.of(context).size.height*0.012),
               Text("\$562.2",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
               SizedBox(height:MediaQuery.of(context).size.height*0.021),
               Container(
                 width: MediaQuery.of(context).size.width*0.95,
                 height: MediaQuery.of(context).size.height*0.069,
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
               SizedBox(height:MediaQuery.of(context).size.height*0.027),
               InkWell(
                 onTap: () {
                   setState(() {
                     _isExpanded = !_isExpanded;
                   });
                 },

                 child: Container(
                   width: MediaQuery.of(context).size.width*0.95,
                   height: MediaQuery.of(context).size.height*0.131,
                   decoration:_isExpanded==false? BoxDecoration(
                       borderRadius: BorderRadius.circular(12),
                       color:darkMode?Color(0xff394754):Theme.of(context).shadowColor
                   ):BoxDecoration(
                       borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft:Radius.circular(12) ),
                       color:darkMode?Color(0xff394754):Theme.of(context).shadowColor
                   ),
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       SizedBox(width: MediaQuery.of(context).size.width*0.015,),
                       CircleAvatar(
                         radius: 23,
                         backgroundColor: Color(0xff27DDFC),
                         child: Center(child: Text("B",style: TextStyle(fontSize: 32,color: Colors.white),)),
                       ),
                       SizedBox(width: MediaQuery.of(context).size.width*0.006,),
                       Container(
                           width: MediaQuery.of(context).size.width*0.28,
                           color: Colors.transparent,
                           child: Text("ONE/USDT",style: TextStyle(fontSize: 15,fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),)),
                       SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                       Container(
                           width: MediaQuery.of(context).size.width*0.135,
                           child: Text("\$9.84",style: TextStyle(fontSize: 15,fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),)),
                       SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                       Column(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           SleekCircularSlider(
                             appearance: CircularSliderAppearance(
                                 animationEnabled: false,
                                 size: MediaQuery.of(context).size.width*0.26,
                                 customColors: CustomSliderColors(progressBarColor: Theme.of(context).splashColor,trackColor: Color(0xff415669) ),
                                 customWidths: CustomSliderWidths(progressBarWidth: 5,trackWidth: 5)),
                             innerWidget: (percentage) {
                               return Column(
                                 children: [
                                   SizedBox(height: MediaQuery.of(context).size.height*0.014,),
                                   SleekCircularSlider(
                                     appearance: CircularSliderAppearance(
                                         animationEnabled: false,
                                         size: MediaQuery.of(context).size.width*0.205,
                                         customColors: CustomSliderColors(progressBarColor:Color(0xff25A27B) ,trackColor:Color(0xff415669)  ),
                                         customWidths: CustomSliderWidths(progressBarWidth: 10,trackWidth: 10)),
                                     innerWidget: (percentage) {
                                       return Column(
                                         children: [
                                           SizedBox( height: MediaQuery.of(context).size.height*0.03,),
                                           Text("${percentage}\%",style: TextStyle(color:Color(0xff25A27B),fontSize: 13 ),),
                                           SizedBox( height: MediaQuery.of(context).size.height*0.01,),
                                           Container(
                                             width: MediaQuery.of(context).size.width*0.11,
                                             height: MediaQuery.of(context).size.height*0.033,
                                             decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(5),
                                                 color: Color(0xff415669)
                                             ),
                                             child: Center(child: Text("8h",style: TextStyle(color: Color(0xffD6DBDE)),)),
                                           )
                                         ],
                                       );
                                     },
                                     min: 0,
                                     max: 100,
                                     initialValue: 100,
                                   )

                                 ],
                               );
                             },
                             min: 0,
                             max: 100,
                             initialValue: 100,
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),
               ),
               AnimatedContainer(
                   duration: Duration(milliseconds: 300),
                   height: _isExpanded ? MediaQuery.of(context).size.height*0.4 : 0.0,
                   width:MediaQuery.of(context).size.width*0.95,
                   child:SingleChildScrollView(
                     child: Container(
                       width: MediaQuery.of(context).size.width*0.95,
                       height:  MediaQuery.of(context).size.height*0.32,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),bottomLeft: Radius.circular(12)),
                           color:darkMode?Color(0xff394754):Theme.of(context).shadowColor
                       ),
                       child: Column(
                         children: [
                           Divider(color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d)),
                           SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                           Row(
                             children: [
                               SizedBox(width: MediaQuery.of(context).size.width*0.025,),
                               Text("AVERAGE ENTRY PRICE",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d)),),
                               SizedBox(width: MediaQuery.of(context).size.width*0.28,),
                               Text("PNL",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d)),),
                             ],
                           ),
                           SizedBox(height: MediaQuery.of(context).size.height*0.024,),
                           Row(
                             children: [
                               SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                               CircleAvatar(
                                 radius: 10,
                                 backgroundColor: Color(0xff25A27B),
                                 child: SvgPicture.asset("assets/t.svg"),
                               ),
                               SizedBox(width: MediaQuery.of(context).size.width*0.015,),
                               Text("9.11"),
                               SizedBox(width: MediaQuery.of(context).size.width*0.445,),
                               Text("-\$4.5"),
                               SizedBox(width: MediaQuery.of(context).size.width*0.105,),
                               Text("100\%",style: TextStyle(color: Colors.green),)
                             ],
                           ),
                           SizedBox(height: MediaQuery.of(context).size.height*0.035,),
                           Row(
                             children: [
                               SizedBox(width: MediaQuery.of(context).size.width*0.025,),
                               Text("CLOSED AT",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d)),),
                               SizedBox(width: MediaQuery.of(context).size.width*0.427,),
                               Text("CLOSE REASON",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d)),),
                             ],
                           ),
                           SizedBox(height: MediaQuery.of(context).size.height*0.024,),
                           Row(
                             children: [
                               SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                               CircleAvatar(
                                 radius: 10,
                                 backgroundColor: Colors.transparent,
                                 child: Icon(Icons.schedule,color: Colors.red,),
                               ),
                               SizedBox(width: MediaQuery.of(context).size.width*0.015,),
                               Text("8 APR 13.39",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10)),
                               SizedBox(width: MediaQuery.of(context).size.width*0.361,),
                               Text("Tps Fulfilled",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13),),

                             ],
                           ),
                           SizedBox(height: MediaQuery.of(context).size.height*0.024,),
                           Row(
                             children: [
                               SizedBox(width: MediaQuery.of(context).size.width*0.025,),
                               Text("OPEN AT",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d)),),
                               SizedBox(width: MediaQuery.of(context).size.width*0.46,),
                               Text("POSITION",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d)),),
                             ],
                           ),
                           SizedBox(height: MediaQuery.of(context).size.height*0.024,),
                           Row(
                             children: [
                               SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                               CircleAvatar(
                                 radius: 10,
                                 backgroundColor: Colors.transparent,
                                 child: Icon(Icons.schedule,color: Colors.green,),
                               ),
                               SizedBox(width: MediaQuery.of(context).size.width*0.015,),
                               Container(
                                   width: 180,

                                   child: Text("8 APR 13.39",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10),)),
                               SizedBox(width: MediaQuery.of(context).size.width*0.075,),
                               Container(
                                   width: 100,
                                   child: Text("LONG-25X",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 11,color: Colors.green),)),

                             ],
                           ),
                         ],
                       ),
                     ),
                   )
               ),
             ],
           ),
         ),
       ),
     ) :
     SafeArea(
       child: Center(
         child: Column(
           children: [
             SizedBox(height:MediaQuery.of(context).size.height*0.042),
             Text("TOTAL CHANGE",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),),
             SizedBox(height:MediaQuery.of(context).size.height*0.012),
             Text("\$562.2",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
             SizedBox(height:MediaQuery.of(context).size.height*0.021),
             Container(
               width: MediaQuery.of(context).size.width*0.95,
               height: MediaQuery.of(context).size.height*0.069,
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
             SizedBox(height:MediaQuery.of(context).size.height*0.027),
             InkWell(
               onTap: () {
                 setState(() {
                   _isExpanded = !_isExpanded;
                 });
               },

               child: Container(
                 width: MediaQuery.of(context).size.width*0.95,
                 height: MediaQuery.of(context).size.height*0.131,
                 decoration:_isExpanded==false? BoxDecoration(
                     borderRadius: BorderRadius.circular(12),
                     color:darkMode?Color(0xff394754):Theme.of(context).shadowColor
                 ):BoxDecoration(
                     borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft:Radius.circular(12) ),
                     color:darkMode?Color(0xff394754):Theme.of(context).shadowColor
                 ),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     SizedBox(width: MediaQuery.of(context).size.width*0.015,),
                     CircleAvatar(
                       radius: 23,
                       backgroundColor: Color(0xff27DDFC),
                       child: Center(child: Text("B",style: TextStyle(fontSize: 32,color: Colors.white),)),
                     ),
                     SizedBox(width: MediaQuery.of(context).size.width*0.006,),
                     Container(
                         width: MediaQuery.of(context).size.width*0.28,
                         color: Colors.transparent,
                         child: Text("ONE/USDT",style: TextStyle(fontSize: 15,fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),)),
                     SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                     Container(
                         width: MediaQuery.of(context).size.width*0.135,
                         child: Text("\$9.84",style: TextStyle(fontSize: 15,fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),)),
                     SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                     Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         SleekCircularSlider(
                           appearance: CircularSliderAppearance(
                             animationEnabled: false,
                               size: MediaQuery.of(context).size.width*0.26,
                               customColors: CustomSliderColors(progressBarColor: Theme.of(context).splashColor,trackColor: Color(0xff415669) ),
                               customWidths: CustomSliderWidths(progressBarWidth: 5,trackWidth: 5)),
                           innerWidget: (percentage) {
                             return Column(
                               children: [
                                 SizedBox(height: MediaQuery.of(context).size.height*0.014,),
                                 SleekCircularSlider(
                                   appearance: CircularSliderAppearance(
                                        animationEnabled: false,
                                       size: MediaQuery.of(context).size.width*0.205,
                                       customColors: CustomSliderColors(progressBarColor:Color(0xff25A27B) ,trackColor:Color(0xff415669)  ),
                                       customWidths: CustomSliderWidths(progressBarWidth: 10,trackWidth: 10)),
                                   innerWidget: (percentage) {
                                     return Column(
                                       children: [
                                         SizedBox( height: MediaQuery.of(context).size.height*0.03,),
                                         Text("${percentage}\%",style: TextStyle(color:Color(0xff25A27B),fontSize: 13 ),),
                                         SizedBox( height: MediaQuery.of(context).size.height*0.01,),
                                         Container(
                                           width: MediaQuery.of(context).size.width*0.11,
                                           height: MediaQuery.of(context).size.height*0.033,
                                           decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(5),
                                               color: Color(0xff415669)
                                           ),
                                           child: Center(child: Text("8h",style: TextStyle(color: Color(0xffD6DBDE)),)),
                                         )
                                       ],
                                     );
                                   },
                                   min: 0,
                                   max: 100,
                                   initialValue: 100,
                                 )

                               ],
                             );
                           },
                           min: 0,
                           max: 100,
                           initialValue: 100,
                         ),
                       ],
                     ),
                   ],
                 ),
               ),
             ),
             AnimatedContainer(
                 duration: Duration(milliseconds: 300),
                 height: _isExpanded ? MediaQuery.of(context).size.height*0.4 : 0.0,
                 width:MediaQuery.of(context).size.width*0.95,
                 child:SingleChildScrollView(
                   child: Container(
                     width: MediaQuery.of(context).size.width*0.95,
                     height:  MediaQuery.of(context).size.height*0.32,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),bottomLeft: Radius.circular(12)),
                         color:darkMode?Color(0xff394754):Theme.of(context).shadowColor
                     ),
                     child: Column(
                       children: [
                         Divider(color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d)),
                         SizedBox(height: MediaQuery.of(context).size.height*0.015,),
                         Row(
                           children: [
                             SizedBox(width: MediaQuery.of(context).size.width*0.025,),
                             Text("AVERAGE ENTRY PRICE",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d)),),
                             SizedBox(width: MediaQuery.of(context).size.width*0.28,),
                             Text("PNL",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d)),),
                           ],
                         ),
                         SizedBox(height: MediaQuery.of(context).size.height*0.024,),
                         Row(
                           children: [
                             SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                             CircleAvatar(
                               radius: 10,
                               backgroundColor: Color(0xff25A27B),
                               child: SvgPicture.asset("assets/t.svg"),
                             ),
                             SizedBox(width: MediaQuery.of(context).size.width*0.015,),
                             Text("9.11"),
                             SizedBox(width: MediaQuery.of(context).size.width*0.445,),
                             Text("-\$4.5"),
                             SizedBox(width: MediaQuery.of(context).size.width*0.105,),
                             Text("100\%",style: TextStyle(color: Colors.green),)
                           ],
                         ),
                         SizedBox(height: MediaQuery.of(context).size.height*0.035,),
                         Row(
                           children: [
                             SizedBox(width: MediaQuery.of(context).size.width*0.025,),
                             Text("CLOSED AT",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d)),),
                             SizedBox(width: MediaQuery.of(context).size.width*0.427,),
                             Text("CLOSE REASON",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d)),),
                           ],
                         ),
                         SizedBox(height: MediaQuery.of(context).size.height*0.024,),
                         Row(
                           children: [
                             SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                             CircleAvatar(
                               radius: 10,
                               backgroundColor: Colors.transparent,
                               child: Icon(Icons.schedule,color: Colors.red,),
                             ),
                             SizedBox(width: MediaQuery.of(context).size.width*0.015,),
                             Text("8 APR 13.39",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10)),
                             SizedBox(width: MediaQuery.of(context).size.width*0.361,),
                             Text("Tps Fulfilled",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 13),),

                           ],
                         ),
                         SizedBox(height: MediaQuery.of(context).size.height*0.024,),
                         Row(
                           children: [
                             SizedBox(width: MediaQuery.of(context).size.width*0.025,),
                             Text("OPEN AT",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d)),),
                             SizedBox(width: MediaQuery.of(context).size.width*0.46,),
                             Text("POSITION",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d)),),
                           ],
                         ),
                         SizedBox(height: MediaQuery.of(context).size.height*0.024,),
                         Row(
                           children: [
                             SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                             CircleAvatar(
                               radius: 10,
                               backgroundColor: Colors.transparent,
                               child: Icon(Icons.schedule,color: Colors.green,),
                             ),
                             SizedBox(width: MediaQuery.of(context).size.width*0.015,),
                             Container(
                               width: 180,

                                 child: Text("8 APR 13.39",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10),)),
                             SizedBox(width: MediaQuery.of(context).size.width*0.075,),
                             Container(
                               width: 100,
                                 child: Text("LONG-25X",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 11,color: Colors.green),)),

                           ],
                         ),
                       ],
                     ),
                   ),
                 )
             ),
           ],
         ),
       ),
     ),
   );
  }
}
