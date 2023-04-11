import 'package:copytrade_ui/Navbar/menu.dart';
import 'package:copytrade_ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool up = false;
  bool sorl = false;
  int selecteditemindex = 0;
  var show;

  @override
  void initState() {
    show=true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: darkMode? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).scaffoldBackgroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        leadingWidth: 40,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Menu()));
          },
          icon: Icon(
            Icons.menu_outlined,
            color: Theme.of(context).textTheme.bodyLarge?.color,
            size: 36,
          ),
        ),
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
                Container(
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
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.001,
                ),
                Container(
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
                        child: Container(
                          color: Theme.of(context).indicatorColor,
                          height: MediaQuery.of(context).size.height * 0.16,
                          width: MediaQuery.of(context).size.width * 1,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: 3,
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
                                            color: Colors.red,
                                            size: 12,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.02,
                                          ),
                                          Text(
                                            "SUSHI",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "10x",
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
                                                "L",
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
                                            color: sorl
                                                ? Color.fromRGBO(247, 69, 95, 1)
                                                : Color.fromRGBO(
                                                44, 187, 131, 1),
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
                                                "-18.0%",
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
                                              color: up ? Color.fromRGBO(247, 69, 95, 1) : Color.fromRGBO(44, 187, 131, 1),
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
                          color: Theme.of(context).indicatorColor,
                          height: MediaQuery.of(context).size.height * 0.16,
                          width: MediaQuery.of(context).size.width * 1,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: 3,
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
                                            color: Colors.red,
                                            size: 12,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.02,
                                          ),
                                          Text(
                                            "SUSHI",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "10x",
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
                                                "L",
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
                                            color: sorl
                                                ? Color.fromRGBO(247, 69, 95, 1)
                                                : Color.fromRGBO(
                                                44, 187, 131, 1),
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
                                                "-18.0%",
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
                                              color: up ? Color.fromRGBO(247, 69, 95, 1) : Color.fromRGBO(44, 187, 131, 1),
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
                        child: Container(
                          color: Theme.of(context).indicatorColor,
                          height: MediaQuery.of(context).size.height * 0.16,
                          width: MediaQuery.of(context).size.width * 1,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: 3,
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
                                            color: Colors.red,
                                            size: 12,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.02,
                                          ),
                                          Text(
                                            "SUSHI",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "10x",
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
                                                "L",
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
                                            color: sorl
                                                ? Color.fromRGBO(247, 69, 95, 1)
                                                : Color.fromRGBO(
                                                44, 187, 131, 1),
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
                                                "-18.0%",
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
                                              color: up ? Color.fromRGBO(247, 69, 95, 1) : Color.fromRGBO(44, 187, 131, 1),
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
          ],
        ),
      ),
    );
  }
}
