import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';



class CircularProgressIndicatorApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CircularProgressIndicatorAppState();
  }
}

class CircularProgressIndicatorAppState extends State<CircularProgressIndicatorApp>{
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child: Column(
         children: [
       SleekCircularSlider(
       appearance: CircularSliderAppearance(
         size: 80,
         customColors: CustomSliderColors(progressBarColor: Colors.red,trackColor:Colors.blue ),

           customWidths: CustomSliderWidths(progressBarWidth: 5,trackWidth: 5)),
      min: 0,
      max: 100,
      initialValue: 30,
    )
         ],
       ),
     ),
    );
  }
  // this function updates the progress value

}