import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copytrade_ui/Navbar/menu.dart';
import 'package:copytrade_ui/connect.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../copy_trade.dart';
import '../login.dart';
import '../main.dart';
import '../privacy.dart';
import '../profile.dart';
import '../profile/settings.dart';
import '../traders.dart';
import '../wallet.dart';
import 'earn.dart';

List _orders = [];
List fullOrders = [];
List<dynamic> positions = [];
List<dynamic> tradeHistory=[];
double pnl = 0;
DateTime? selectedDate;

class MyHomePage extends StatefulWidget {

  final Map<String, dynamic> traderData;
  const MyHomePage({super.key, required this.traderData,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool up = false;
  int selecteditemindex = 0;
  List live=[
    {
      "Coin":"SUSHI",
      "Leverage":"10x",
      "Short/Long": "L",
      "Profit/Loss":-18.0,
    },
    {
      "Coin":"ZRX",
      "Leverage":"10x",
      "Short/Long": "L",
      "Profit/Loss": 4.0,
    },
    {
      "Coin":"BTC",
      "Leverage":"10x",
      "Short/Long": "S",
      "Profit/Loss": 30.0,
    },
  ];
  List open=[
    {
      "Coin":"SUSHI",
      "Price":"0.0092",
      "Buy/Sell": "LIMIT BUY",
      "Profit/Loss": -18.0,
    },
    {
      "Coin":"ZRX",
      "Price":"0.0192",
      "Buy/Sell": "STOP MARKET SELL",
      "Profit/Loss": -4.0,
    },
    {
      "Coin":"BTC",
      "Price":"0.0052",
      "Buy/Sell": "LIMIT SELL",
      "Profit/Loss": 23.0,
    },
  ];
  List close=[
    {
      "Coin":"SUSHI",
      "P/L":"PROFIT",
      "Short/Long": "LONG",
      "Profit/Loss": 18.0,
    },
    {
      "Coin":"ZRX",
      "P/L":"LOSS",
      "Short/Long": "SHORT",
      "Profit/Loss": -4.0,
    },
    {
      "Coin":"BTC",
      "P/L":"PROFIT",
      "Short/Long": "LONG",
      "Profit/Loss": -23.0,
    },
    {
      "Coin":"BNB",
      "P/L":"LOSS",
      "Short/Long": "LONG",
      "Profit/Loss": 43.0,
    },
  ];

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
      while(wait){
        await Future.delayed(const Duration(seconds: 1));
      }
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
        print(_orders);

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
      print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");

      while(wait && currentUserData.keys.length<2){
        await Future.delayed(const Duration(seconds: 1));
      }
      print(widget.traderData);
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
          print(positions);
          print(tradeHistory);
          pnl=double.tryParse(response.data['pnl'].toString())??0;
          setState(() {

          });
        } else {
          print("here");
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
        leadingWidth: 40,
        title: Text(
          "SKOL",
          style: TextStyle(
            fontSize: 28,
            color: Theme.of(context).splashColor
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.04,
                        ),
                        Text(
                          "TRADING BALANCE (USDT)",
                          style: TextStyle(
                              color: Theme.of(context).textTheme.bodySmall?.color,
                              fontSize: 12,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width*0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.007),
                          child: SvgPicture.asset(
                            "assets/approx.svg",
                            height: MediaQuery.of(context).size.height*0.03,
                            color: darkMode? Theme.of(context).textTheme.titleSmall?.color : Theme.of(context).textTheme.titleSmall?.color,
                          ),
                        ),
                        Text(
                          "154.89",
                          style: TextStyle(
                              fontSize: 16,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.085,
                      width: MediaQuery.of(context).size.width*0.31,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: darkMode? [
                              Color(0xff374454),
                              Color(0xff364655),
                            ] : [
                              Theme.of(context).indicatorColor,
                              Theme.of(context).shadowColor,
                            ]
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WALLET BALANCE",
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "\$15",
                            style: TextStyle(
                              color: Theme.of(context).textTheme.bodyLarge?.color,
                              fontSize: 15,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "RECHARGE",
                                style: TextStyle(
                                  color: Theme.of(context).textTheme.bodyLarge?.color,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 9
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.0025),
                                child: Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  size: 10,
                                  color: Theme.of(context).textTheme.bodyLarge?.color,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.03,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            FlutterCarousel.builder(
              options: CarouselOptions(
                viewportFraction: 1,
                height: MediaQuery.of(context).size.height * 0.15,
                enableInfiniteScroll: true,
                floatingIndicator: false,
                slideIndicator: CircularSlideIndicator(
                    currentIndicatorColor: Theme.of(context).splashColor,
                    indicatorRadius: 3),
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Padding(
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                          colors: [
                            Color(0xff404F4C),
                            Color(0xff364353),
                          ]
                      )
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ConnectExchange()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.056,
                    width: MediaQuery.of(context).size.width*0.355,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: darkMode ? Color.fromRGBO(57, 71, 84, 1) : Theme.of(context).shadowColor
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.015,
                        ),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: darkMode? Theme.of(context).hintColor : Theme.of(context).appBarTheme.backgroundColor,
                          child: SvgPicture.asset(
                            "assets/connection.svg"
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.015,
                        ),
                        Text(
                          "CONNECT WITH\nEXCHANGE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.001,
                ),
                InkWell(
                  onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CopyTrade()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.056,
                    width: MediaQuery.of(context).size.width*0.355,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: darkMode ? Color.fromRGBO(57, 71, 84, 1) : Theme.of(context).shadowColor
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.015,
                        ),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: darkMode? Theme.of(context).hintColor : Theme.of(context).appBarTheme.backgroundColor,
                          child: SvgPicture.asset(
                              "assets/copy.svg"
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.015,
                        ),
                        Text(
                          "COPY TRADE",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  decoration: BoxDecoration(
                    color: darkMode ? Color.fromRGBO(57, 71, 84, 1) : Theme.of(context).shadowColor,
                    borderRadius: BorderRadius.all(Radius.circular(3))
                  ),
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    title: Text(
                      "LIVE TRADE",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13
                      ),
                    ),
                    shape: Border(
                      top: BorderSide.none,
                      bottom: BorderSide.none,
                      left: BorderSide.none,
                      right: BorderSide.none,
                    ),
                    textColor: Theme.of(context).textTheme.bodyLarge?.color,
                    iconColor: Theme.of(context).textTheme.bodyLarge?.color,
                    collapsedIconColor: Theme.of(context).textTheme.bodyLarge?.color,
                    collapsedTextColor: Theme.of(context).textTheme.bodyLarge?.color,
                    children: [
                      SingleChildScrollView(
                        child: positions.isEmpty ? Container(
                          color: darkMode? Theme.of(context).indicatorColor : Theme.of(context).scaffoldBackgroundColor,
                          height: MediaQuery.of(context).size.height * 0.16,
                          width: MediaQuery.of(context).size.width * 1,
                          child: Center(
                            child: Text(
                              "NO LIVE TRADES",
                              style: TextStyle(
                                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).textTheme.bodyLarge?.color,
                              ),
                            ),
                          ),
                        ) : Container(
                          color: darkMode? Theme.of(context).indicatorColor : Theme.of(context).scaffoldBackgroundColor,
                          height: MediaQuery.of(context).size.height * 0.16,
                          width: MediaQuery.of(context).size.width * 1,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: positions.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.trending_up_sharp,
                                            color: (double.tryParse(positions[index]["unRealizedProfit"].toString())??0) < 0 ? Color.fromRGBO(247, 69, 95, 1) : Color.fromRGBO(44, 187, 131, 1),
                                            size: 12,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.02,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                positions[index]["symbol"],
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.01),
                                                child: (double.tryParse(positions[index]["unRealizedProfit"].toString())??0) >= 30  ? SvgPicture.asset("assets/fire.svg") : SizedBox(height: 0,width: 0,),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            positions[index]["leverage"].toString()+"x",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.01,
                                          ),
                                          Container(
                                            height: 15,
                                            width: 15,
                                            child: Center(
                                              child: Text(
                                                (double.tryParse(positions[index]["positionAmt"].toString())??0) > 0 ? "L" : "S",
                                                style: TextStyle(
                                                  fontSize: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.fontSize,
                                                  fontWeight: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.fontWeight,
                                                ),
                                              ),
                                            ),
                                            color: (double.tryParse(positions[index]["positionAmt"].toString())??0) < 0 ? Color.fromRGBO(247, 69, 95, 1) : Color.fromRGBO(44, 187, 131, 1),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.04,
                                          ),
                                          Container(
                                            height: MediaQuery.of(context).size.height*0.03,
                                            width: MediaQuery.of(context).size.width*0.15,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
                                              color: (double.tryParse(positions[index]["unRealizedProfit"].toString())??0) < 0  ? Color.fromRGBO(247, 69, 95, 1) : Color.fromRGBO(44, 187, 131, 1),
                                            ),
                                            child: Center(
                                              child: Text(
                                                (positions[index]["unRealizedProfit"].toString().substring(0,7)+"%"),
                                                style: TextStyle(
                                                  fontSize: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontSize,
                                                  fontWeight: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontWeight,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*0.02,
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.01,
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  decoration: BoxDecoration(
                      color: darkMode ? Color.fromRGBO(57, 71, 84, 1) : Theme.of(context).shadowColor,
                      borderRadius: BorderRadius.all(Radius.circular(3))
                  ),
                  child: ExpansionTile(
                    shape: Border(
                      top: BorderSide.none,
                      bottom: BorderSide.none,
                      left: BorderSide.none,
                      right: BorderSide.none,
                    ),
                    initiallyExpanded: false,
                    title: Text(
                      "OPEN TRADE",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13
                      ),
                    ),
                    textColor: Theme.of(context).textTheme.bodyLarge?.color,
                    iconColor: Theme.of(context).textTheme.bodyLarge?.color,
                    collapsedIconColor: Theme.of(context).textTheme.bodyLarge?.color,
                    collapsedTextColor: Theme.of(context).textTheme.bodyLarge?.color,
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          color: darkMode? Theme.of(context).indicatorColor : Theme.of(context).scaffoldBackgroundColor,
                          height: MediaQuery.of(context).size.height * 0.16,
                          width: MediaQuery.of(context).size.width * 1,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: open.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*0.15,
                                        child: Text(
                                          open[index]["Coin"],
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width*0.35,
                                        child: Text(
                                          open[index]["Buy/Sell"],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: open[index]["Buy/Sell"].toString().contains("SELL") ? Color.fromRGBO(247, 69, 95, 1) : Color.fromRGBO(44, 187, 131, 1),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        open[index]["Price"],
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Container(
                                        height: MediaQuery.of(context).size.height*0.03,
                                        width: MediaQuery.of(context).size.width*0.15,
                                        child: Center(
                                          child: Text(
                                            open[index]["Profit/Loss"].toString()+"%",
                                            style: TextStyle(
                                              fontSize: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.fontSize,
                                              fontWeight: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.fontWeight,
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: open[index]["Profit/Loss"] < 0  ? Color.fromRGBO(247, 69, 95, 1) : Color.fromRGBO(44, 187, 131, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*0.02,
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.01,
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  decoration: BoxDecoration(
                      color: darkMode ? Color.fromRGBO(57, 71, 84, 1) : Theme.of(context).shadowColor,
                      borderRadius: BorderRadius.all(Radius.circular(3))
                  ),
                  child: ExpansionTile(
                    shape: Border(
                      top: BorderSide.none,
                      bottom: BorderSide.none,
                      left: BorderSide.none,
                      right: BorderSide.none,
                    ),
                    initiallyExpanded: false,
                    title: Text(
                      "CLOSED TRADE",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13
                      ),
                    ),
                    textColor: Theme.of(context).textTheme.bodyLarge?.color,
                    iconColor: Theme.of(context).textTheme.bodyLarge?.color,
                    collapsedIconColor: Theme.of(context).textTheme.bodyLarge?.color,
                    collapsedTextColor: Theme.of(context).textTheme.bodyLarge?.color,
                    children: [
                      SingleChildScrollView(
                        child: tradeHistory.isEmpty? Container(
                          color: darkMode? Theme.of(context).indicatorColor : Theme.of(context).scaffoldBackgroundColor,
                          height: MediaQuery.of(context).size.height * 0.16,
                          width: MediaQuery.of(context).size.width * 1,
                          child: Center(
                            child: Text(
                              "NO LIVE TRADES",
                              style: TextStyle(
                                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).textTheme.bodyLarge?.color,
                              ),
                            ),
                          ),
                        ) : Container(
                          color: darkMode? Theme.of(context).indicatorColor : Theme.of(context).scaffoldBackgroundColor,
                          height: MediaQuery.of(context).size.height * 0.16,
                          width: MediaQuery.of(context).size.width * 1,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: tradeHistory.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.18,
                                        child: Text(
                                          tradeHistory[index]["symbol"],
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width*0.11,
                                            child: Text(
                                              tradeHistory[index]["side"]=="SELL" ? "SHORT" : "LONG",
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: tradeHistory[index]["side"]=="SELL" ? Color.fromRGBO(247, 69, 95, 1) : Color.fromRGBO(44, 187, 131, 1),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width*0.03,
                                              child: (double.tryParse(tradeHistory[index]["realizedPnl"].toString())??0) >= 30  ? SvgPicture.asset("assets/fire.svg") : SizedBox(height: 0,width: 0,)),
                                        ],
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context)
                                            .size
                                            .width *
                                            0.01,
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.15,
                                        child: Text(
                                          (double.tryParse(tradeHistory[index]["realizedPnl"].toString())??0) < 0 ? "LOSS" : "PROFIT",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: (double.tryParse(tradeHistory[index]["realizedPnl"].toString())??0) < 0 ? Color.fromRGBO(247, 69, 95, 1) : Color.fromRGBO(44, 187, 131, 1),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context)
                                            .size
                                            .width *
                                            0.04,
                                      ),
                                      Container(
                                        height: MediaQuery.of(context).size.height*0.03,
                                        width: MediaQuery.of(context).size.width*0.15,
                                        child: Center(
                                          child: Text(
                                            (double.tryParse(tradeHistory[index]["realizedPnl"].toString())??0).toString()+"%",
                                            style: TextStyle(
                                              fontSize: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.fontSize,
                                              fontWeight: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.fontWeight,
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          color: (double.tryParse(tradeHistory[index]["realizedPnl"].toString())??0) < 0 ? Color.fromRGBO(247, 69, 95, 1) : Color.fromRGBO(44, 187, 131, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height*0.02,
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                darkMode = !darkMode;
                streamController.sink.add(1);
              },
              icon: Icon(
                darkMode ? iconDark : iconLight,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
