import 'package:alxgration_speedometer/speedometer.dart';
import 'package:copytrade_ui/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';


List _orders = [];
List fullOrders = [];
List<dynamic> positions = [];
List<dynamic> tradeHistory=[];
double pnl = 0;
DateTime? selectedDate;

class OpenTrades extends StatefulWidget {

  final Map<String, dynamic> traderData;
  const OpenTrades({Key? key, required this.traderData}) : super(key: key);

  @override
  State<OpenTrades> createState() => _OpenTradesState();
}

class _OpenTradesState extends State<OpenTrades> {

  @override
  void initState() {
    _orders = [];
    fullOrders = [];
    positions = [];
    tradeHistory = [];

    selectedDate=DateTime.now();
    getUserData();
    getUserPnl();
    super.initState();
  }

  Map<String,dynamic> coinReport={};
  Map<String,dynamic> dayReport={};
  int wins=0;
  int loses=0;
  Future<bool> getUserData() async {
    try {
      var url = settingsMap['path'];

      Dio dio1 = Dio(BaseOptions(
        baseUrl: url + "/openOrdersAndPositions",
        validateStatus: (status) => true,

      ));
      Response response = await dio1.get('', queryParameters: {

        'key': widget.traderData['api_key'],
        'secret': widget.traderData['api_secret'],
      });

      if (response.data.toString() != "error" &&
          response.data.toString() != "An error occurred" &&
          !response.data.toString().toUpperCase().contains("CORS")) {


        positions = response.data['positions'];
        _orders = response.data['openOrders'];

        setState(() {

        });
        return true;
      } else {
        return await getUserData();
      }
    }
    catch (err) {
      return await getUserData();
    }
  }

  Future<bool> getUserPnl() async {
    try {
      var url = settingsMap['path'];

      Dio dio1 = Dio(BaseOptions(
        baseUrl: url + "/userPnl",
        validateStatus: (status) => true,

      ));
      DateTime now =DateTime.now();
      Response response = await dio1.get('', queryParameters: {

        'key': widget.traderData['api_key'],
        'secret': widget.traderData['api_secret'],
        'fromYear': selectedDate?.year??now.year,
        'fromMonth': selectedDate?.month??now.month,
        'fromDay': 1,
        'toYear': selectedDate?.year??now.year,
        'toMonth': (selectedDate?.month??now.month) + 1,
        'toDay': 1,
      });

      if (!response.data.toString().contains("Access-Control-Allow-Origin")&&!response.data.toString().contains("CORS policy")) {
        print("startttttt");
        if (response.data.toString() != "error" &&
            response.data.toString() != "An error occurred") {



          tradeHistory=response.data['trades'];
          fullOrders=response.data['fullOrders'];

          tradeHistory.sort((a,b)=>(int.tryParse(b['time'].toString())??0).compareTo(int.tryParse(a['time'].toString())??0));
          fullOrders.sort((a,b)=>(int.tryParse(b['time'].toString())??0).compareTo(int.tryParse(a['time'].toString())??0));
          for(var trade in tradeHistory){

            DateTime date =DateTime.fromMillisecondsSinceEpoch(int.parse(trade['time'].toString()));
            String day=date.toLocal().toString().substring(0,10);
            print(day);
            if((double.tryParse(trade['realizedPnl'].toString())??0)>0){
              wins++;
            }
            if((double.tryParse(trade['realizedPnl'].toString())??0)<0){
              loses++;
            }
            if(dayReport[day]==null){
              dayReport[day]={
                "profit":double.tryParse(trade['realizedPnl'].toString())??0,
                "wins":(double.tryParse(trade['realizedPnl'].toString())??0)>0?1:0,
                "loses":(double.tryParse(trade['realizedPnl'].toString())??0)<0?1:0,
                "orders":1,

              };
            }
            else{
              dayReport[day]['profit']+=(double.tryParse(trade['realizedPnl'].toString())??0);
              dayReport[day]['wins']+=(double.tryParse(trade['realizedPnl'].toString())??0)>0?1:0;
              dayReport[day]['loses']+=(double.tryParse(trade['realizedPnl'].toString())??0)<0?1:0;
              dayReport[day]['orders']++;

            }
            if(coinReport[trade["symbol"]]==null){
              coinReport[trade["symbol"]]={
                "profit":double.tryParse(trade['realizedPnl'].toString())??0,
                "wins":(double.tryParse(trade['realizedPnl'].toString())??0)>0?1:0,
                "loses":(double.tryParse(trade['realizedPnl'].toString())??0)<0?1:0,
                "orders":1,

              };
            }
            else{
              coinReport[trade["symbol"]]['profit']+=(double.tryParse(trade['realizedPnl'].toString())??0);
              coinReport[trade["symbol"]]['wins']+=(double.tryParse(trade['realizedPnl'].toString())??0)>0?1:0;
              coinReport[trade["symbol"]]['loses']+=(double.tryParse(trade['realizedPnl'].toString())??0)<0?1:0;
              coinReport[trade["symbol"]]['orders']++;

            }
          }
          print(coinReport);
          print(dayReport);
          pnl=double.tryParse(response.data['pnl'].toString())??0;
          setState(() {

          });
        } else {
          print(response.data.toString());
        }
        return true;
      } else {
        print(response.data.toString());
        await Future.delayed(Duration(seconds: 2));
        return await getUserPnl();
      }
    }
    catch (err) {
      print(err);
      await Future.delayed(Duration(seconds: 2));
      return await getUserPnl();
    }
    }

  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                      padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.08),
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
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            width: MediaQuery.of(context).size.width*0.95,
            height: MediaQuery.of(context).size.height*0.16,
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
                        Container(
                          width: MediaQuery.of(context).size.width*0.3,
                            child: Text("BLUE BIRD/USDT",style: TextStyle(fontSize: 15,fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),)),
                        SizedBox(height: MediaQuery.of(context).size.height*0.025),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Color(0xff25A27B),
                              child: SvgPicture.asset("assets/t.svg"),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width*0.015,),
                            Container(

                              width: MediaQuery.of(context).size.width*0.14,
                                child: Text("9.11"))
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
                        Container(

                          width: MediaQuery.of(context).size.width*0.13,
                            child: Text(
                              "\$ 9.84",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                              ),
                            ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.025),
                        Container(

                            width: MediaQuery.of(context).size.width*0.13,
                            child: Text(
                              "\$(4.98)",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                              ),
                            ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.0225,
                    ),
                    SleekCircularSlider(
                      appearance: CircularSliderAppearance(
                        animationEnabled: false,
                          size: MediaQuery.of(context).size.width*0.26,
                          customColors: CustomSliderColors(progressBarColor: Theme.of(context).splashColor,trackColor: Color(0xff415669) ),
                          customWidths: CustomSliderWidths(progressBarWidth: 5,trackWidth: 5)),
                      innerWidget: (percentage) {
                        return Column(
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height*0.013,),
                            SleekCircularSlider(
                              appearance: CircularSliderAppearance(
                                animationEnabled: false,
                                  size: MediaQuery.of(context).size.width*0.205,
                                  customColors: CustomSliderColors(progressBarColor: Color(0xff25A27B),trackColor: Color(0xff415669) ),
                                  customWidths: CustomSliderWidths(progressBarWidth: 10,trackWidth: 10)),
                              innerWidget: (percentage) {
                                return Column(
                                  children: [
                                    SizedBox( height: MediaQuery.of(context).size.height*0.03,),
                                    Text("\+2.4\%",style: TextStyle(color:Color(0xff25A27B),fontSize: 13 ),),
                                    SizedBox( height: MediaQuery.of(context).size.height*0.01,),
                                    Container(
                                      width: MediaQuery.of(context).size.width*0.11,
                                      height: MediaQuery.of(context).size.height*0.033,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Color(0xff415669)
                                      ),
                                      child: Center(child: Text("26M",style: TextStyle(color: Color(0xffD6DBDE)),)),
                                    )
                                  ],
                                );
                              },
                              min: 0,
                              max: 100,
                              initialValue: 40,
                            )

                          ],
                        );
                      },
                      min: 0,
                      max: 100,
                      initialValue: 30,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.share,color: Colors.white,),
                  ],
                ),
              ],
            ),
          ),
        ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: _isExpanded ? MediaQuery.of(context).size.height*0.3 : 0.0,
            width:MediaQuery.of(context).size.width*0.95,
            child:SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width*0.95,
                height:  MediaQuery.of(context).size.height*0.24,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),bottomLeft: Radius.circular(12)),
                    color:darkMode?Color(0xff394754):Theme.of(context).shadowColor
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                          Text("-\$0.02"),
                          SizedBox(width: MediaQuery.of(context).size.width*0.105,),
                          Text("-0.43\%",style: TextStyle(color: Colors.red),)
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.055,),
                      Row(
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width*0.025,),
                          Text("NEXT ENTRY",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d)),),
                          SizedBox(width: MediaQuery.of(context).size.width*0.41,),
                          Text("NEXT TAKE-PROFIT",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500,color:darkMode? Color(0xffE2E2E2):Color(0xff1d1d1d)),),
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
                          Text("8.961"),
                          SizedBox(width: MediaQuery.of(context).size.width*0.015,),
                          Text("(1.63%)",style: TextStyle(color: Colors.red),),
                          SizedBox(width: MediaQuery.of(context).size.width*0.3,),
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Color(0xff25A27B),
                            child: SvgPicture.asset("assets/t.svg"),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.015,),
                          Text("8.961"),
                          SizedBox(width: MediaQuery.of(context).size.width*0.06,),
                          Text("(-1.63\%)",style: TextStyle(color: Colors.green),)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
        )
            ],
          ),
        ),
      ),
    );
  }
}
