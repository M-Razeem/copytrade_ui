import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import '../main.dart';

class Future1 extends StatefulWidget {
  const Future1({Key? key}) : super(key: key);

  @override
  State<Future1> createState() => _Future1State();
}

class _Future1State extends State<Future1> {
  String dropDownValue = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: darkMode
            ? Theme.of(context).scaffoldBackgroundColor
            : Theme.of(context).scaffoldBackgroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        automaticallyImplyLeading: false,
        title: Text(
          "Futures History",
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
              color: Theme.of(context).textTheme.titleLarge?.color,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              darkMode
                  ? DefaultTabController(
                      length: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 1,
                            child: TabBar(
                              labelPadding: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              indicatorPadding: EdgeInsets.zero,
                              isScrollable: false,
                              dividerColor: Colors.transparent,
                              indicator: MaterialIndicator(
                                  tabPosition: TabPosition.bottom,
                                  color: Theme.of(context).splashColor,
                                  height: MediaQuery.of(context).size.height *
                                      0.004,
                                  horizontalPadding:
                                      MediaQuery.of(context).size.width * 0.1,
                                  bottomLeftRadius: 0,
                                  bottomRightRadius: 0,
                                  topLeftRadius: 0,
                                  topRightRadius: 0),
                              tabs: [
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.035,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  decoration:
                                      BoxDecoration(color: Colors.transparent),
                                  child: Center(
                                    child: Text(
                                      "Open Orders",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Theme.of(context).hoverColor,
                                        fontWeight: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.035,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  decoration:
                                      BoxDecoration(color: Colors.transparent),
                                  child: Center(
                                    child: Text(
                                      "Order History",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Theme.of(context).hoverColor,
                                        fontWeight: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.035,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  decoration:
                                      BoxDecoration(color: Colors.transparent),
                                  child: Center(
                                    child: Text(
                                      "Positions",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Theme.of(context).hoverColor,
                                        fontWeight: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.035,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  decoration:
                                      BoxDecoration(color: Colors.transparent),
                                  child: Center(
                                    child: Text(
                                      "Trade History",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Theme.of(context).hoverColor,
                                        fontWeight: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 1,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: TabBarView(
                                children: [
                                  SingleChildScrollView(
                                    child: Center(
                                      child: Container(
                                        color: Colors.transparent,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                1,
                                        width: MediaQuery.of(context).size.width *
                                            0.9,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    1,
                                                child: ListView.builder(
                                                  physics:
                                                      BouncingScrollPhysics(),
                                                  itemCount: 4,
                                                  itemBuilder: (context, index) {
                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.2,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                1,
                                                            color: Colors
                                                                .transparent,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.01,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "TUSDT Perpetual",
                                                                    ),
                                                                    Text(
                                                                      DateTime.now()
                                                                          .toString()
                                                                          .substring(
                                                                              0,
                                                                              16),
                                                                      style: TextStyle(
                                                                          fontSize: Theme.of(context)
                                                                              .textTheme
                                                                              .bodySmall
                                                                              ?.fontSize,
                                                                          color: Theme.of(context)
                                                                              .hoverColor),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      "Stop Market / Sell",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .red,
                                                                          fontSize: Theme.of(context)
                                                                              .textTheme
                                                                              .bodySmall
                                                                              ?.fontSize),
                                                                    )
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.008,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        CircularPercentIndicator(
                                                                          radius:
                                                                              20,
                                                                          center:
                                                                              Text(
                                                                            "0%",
                                                                            style:
                                                                                TextStyle(color: Colors.red),
                                                                          ),
                                                                          backgroundWidth:
                                                                              4,
                                                                          backgroundColor:
                                                                              Theme.of(context).shadowColor,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              "Amount",
                                                                              style: TextStyle(
                                                                                  fontSize: 11,
                                                                                  color: Theme.of(context).hoverColor,
                                                                                  fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                            ),
                                                                            SizedBox(
                                                                              width:
                                                                                  MediaQuery.of(context).size.width * 0.05,
                                                                            ),
                                                                            Text(
                                                                              "0.00000 / 39.33840",
                                                                              style: TextStyle(
                                                                                  fontSize: 11,
                                                                                  color: Theme.of(context).textTheme.bodySmall?.color,
                                                                                  fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Text(
                                                                          "(USDT)",
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                                  11,
                                                                              color:
                                                                                  Theme.of(context).hoverColor,
                                                                              fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Text(
                                                                              "Price",
                                                                              style: TextStyle(
                                                                                  fontSize: 11,
                                                                                  color: Theme.of(context).hoverColor,
                                                                                  fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                            ),
                                                                            SizedBox(
                                                                              width:
                                                                                  MediaQuery.of(context).size.width * 0.085,
                                                                            ),
                                                                            Text(
                                                                              "--",
                                                                              style: TextStyle(
                                                                                  fontSize: 11,
                                                                                  color: Theme.of(context).textTheme.bodySmall?.color,
                                                                                  fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Text(
                                                                              "Conditions",
                                                                              style: TextStyle(
                                                                                  fontSize: 11,
                                                                                  color: Theme.of(context).hoverColor,
                                                                                  fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                            ),
                                                                            SizedBox(
                                                                              width:
                                                                                  MediaQuery.of(context).size.width * 0.01,
                                                                            ),
                                                                            Text(
                                                                              "Last Price<0.0444000",
                                                                              style: TextStyle(
                                                                                  fontSize: 11,
                                                                                  color: Theme.of(context).textTheme.bodySmall?.color,
                                                                                  fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Text(
                                                                              "Reduce",
                                                                              style: TextStyle(
                                                                                  fontSize: 11,
                                                                                  color: Theme.of(context).hoverColor,
                                                                                  fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                            ),
                                                                            SizedBox(
                                                                              width:
                                                                                  MediaQuery.of(context).size.width * 0.055,
                                                                            ),
                                                                            Text(
                                                                              "True",
                                                                              style: TextStyle(
                                                                                  fontSize: 11,
                                                                                  color: Theme.of(context).textTheme.bodySmall?.color,
                                                                                  fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Text(
                                                                          "Only",
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                                  11,
                                                                              color:
                                                                                  Theme.of(context).hoverColor,
                                                                              fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Container(
                                                                          width: MediaQuery.of(context).size.width *
                                                                              0.12,
                                                                          height: MediaQuery.of(context).size.height *
                                                                              0.025,
                                                                          color: Theme.of(context)
                                                                              .shadowColor,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              "Cancel",
                                                                              style: TextStyle(
                                                                                  fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                                                                                  color: Theme.of(context).textTheme.bodySmall?.color,
                                                                                  fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            height: 0.4,
                                                            thickness: 0.8,
                                                            color: Theme.of(
                                                                context)
                                                                .disabledColor,
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Center(
                                      child: Container(
                                        color: Colors.transparent,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                1,
                                        width: MediaQuery.of(context).size.width *
                                            0.9,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      showModalBottomSheet(
                                                          context: context,
                                                          builder: (BuildContext context) {
                                                            return Container(
                                                              height: MediaQuery.of(context).size.height*0.5,
                                                              color: Theme.of(context).appBarTheme.backgroundColor,
                                                            );
                                                          }
                                                          );
                                                    },
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.24,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.03,
                                                      color: Colors.transparent,
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                              "Symbol: ",
                                                            style: TextStyle(
                                                              color: Theme.of(context).hoverColor,
                                                              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                              fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight
                                                            ),
                                                          ),
                                                          Text(
                                                              "All",
                                                            style: TextStyle(
                                                                color: Theme.of(context).hoverColor,
                                                                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.arrow_drop_down_sharp,
                                                            color: Theme.of(context).hoverColor,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.02,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      showModalBottomSheet(
                                                          context: context,
                                                          builder: (BuildContext context) {
                                                            return Container(
                                                              height: MediaQuery.of(context).size.height*0.5,
                                                              color: Theme.of(context).appBarTheme.backgroundColor,
                                                            );
                                                          }
                                                      );
                                                    },
                                                    child: Container(
                                                      width: MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.24,
                                                      height: MediaQuery.of(context)
                                                              .size
                                                              .height *
                                                          0.03,
                                                      color: Colors.transparent,
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                              "Type: ",
                                                            style: TextStyle(
                                                                color: Theme.of(context).hoverColor,
                                                                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight
                                                            ),
                                                          ),
                                                          Text(
                                                              "All",
                                                            style: TextStyle(
                                                                color: Theme.of(context).hoverColor,
                                                                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight
                                                            ),
                                                          ),
                                                          Icon(
                                                              Icons.arrow_drop_down_sharp,
                                                            color: Theme.of(context).hoverColor,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    1,
                                                child: ListView.builder(
                                                  physics: BouncingScrollPhysics(),
                                                  itemCount: 5,
                                                  itemBuilder: (context, index) {
                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.17,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                1,
                                                            color: Colors
                                                                .transparent,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.01,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                            "TUSDT Perpetual",
                                                                          style: TextStyle(
                                                                            fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                                                                            fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                            DateTime.now().toString().substring(0,16),
                                                                          style: TextStyle(
                                                                            color: Theme.of(context).hoverColor,
                                                                            fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                          ),
                                                                        ),
                                                                        Icon(
                                                                          Icons.arrow_forward_ios_sharp,
                                                                          size: 10,
                                                                          color: Theme.of(context).hintColor,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.015,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "Limit / Buy",
                                                                      style: TextStyle(
                                                                        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                        fontWeight: FontWeight.w600,
                                                                        color: Colors.green
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      height: MediaQuery.of(context).size.height*0.025,
                                                                      width: MediaQuery.of(context).size.width*0.16,
                                                                      color: Theme.of(context).focusColor,
                                                                      child: Center(
                                                                        child: Text(
                                                                          "Cancelled",
                                                                          style: TextStyle(
                                                                            color: Theme.of(context).hoverColor,
                                                                            fontWeight: FontWeight.w600
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.01,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "Amount (USDT)",
                                                                      style: TextStyle(
                                                                          color: Theme.of(context).hoverColor,
                                                                          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                        fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          "0.00000",
                                                                          style: TextStyle(
                                                                              color: Theme.of(context).hintColor,
                                                                              fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                            fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          " / 5.00000",
                                                                          style: TextStyle(
                                                                            color: Theme.of(context).hoverColor,
                                                                            fontSize: 12,
                                                                            fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: MediaQuery.of(context).size.height*0.01,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "Price",
                                                                      style: TextStyle(
                                                                        color: Theme.of(context).hoverColor,
                                                                        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                        fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                      ),
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          "-",
                                                                          style: TextStyle(
                                                                            color: Theme.of(context).hintColor,
                                                                            fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                            fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          " / 0.00400",
                                                                          style: TextStyle(
                                                                            color: Theme.of(context).hoverColor,
                                                                            fontSize: 12,
                                                                            fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                          ),
                                                                        )
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            height: 0.4,
                                                            thickness: 0.8,
                                                            color: Theme.of(
                                                                context)
                                                                .disabledColor,
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Center(
                                      child: Container(
                                        color: Colors.transparent,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                1,
                                        width: MediaQuery.of(context).size.width *
                                            0.9,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    1,
                                                child: ListView.builder(
                                                  physics:
                                                      BouncingScrollPhysics(),
                                                  itemCount: 2,
                                                  itemBuilder: (context, index) {
                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.3,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                1,
                                                            color: Colors
                                                                .transparent,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.01,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          height: MediaQuery.of(context).size.height *
                                                                              0.02,
                                                                          width: MediaQuery.of(context).size.width *
                                                                              0.04,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text("B"),
                                                                          ),
                                                                          color: Colors
                                                                              .green,
                                                                        ),
                                                                        SizedBox(
                                                                          width: MediaQuery.of(context).size.width *
                                                                              0.03,
                                                                        ),
                                                                        Text(
                                                                          "TUSDT Perpetual",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize: Theme.of(context)
                                                                                .textTheme
                                                                                .bodyLarge
                                                                                ?.fontSize,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width: MediaQuery.of(context).size.width *
                                                                              0.03,
                                                                        ),
                                                                        Text(
                                                                          "Isolated 1X",
                                                                          style: TextStyle(
                                                                              color:
                                                                                  Theme.of(context).hoverColor),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.02,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "PNL (USDT)",
                                                                      style: TextStyle(
                                                                          color: Theme.of(context)
                                                                              .hoverColor,
                                                                          fontSize: Theme.of(context)
                                                                              .textTheme
                                                                              .bodyMedium
                                                                              ?.fontSize,
                                                                          fontWeight: Theme.of(context)
                                                                              .textTheme
                                                                              .bodyLarge
                                                                              ?.fontWeight),
                                                                    ),
                                                                    Text(
                                                                      "ROE",
                                                                      style: TextStyle(
                                                                          color: Theme.of(context)
                                                                              .hoverColor,
                                                                          fontSize: Theme.of(context)
                                                                              .textTheme
                                                                              .bodyMedium
                                                                              ?.fontSize,
                                                                          fontWeight: Theme.of(context)
                                                                              .textTheme
                                                                              .bodyLarge
                                                                              ?.fontWeight),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.005,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "-0.04",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .red,
                                                                          fontSize:
                                                                              18),
                                                                    ),
                                                                    Text(
                                                                      "-0.11%",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .red,
                                                                          fontSize:
                                                                              18),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .start,
                                                                        children: [
                                                                          Text(
                                                                            "Size (USDT)",
                                                                            style: TextStyle(
                                                                                color: Theme.of(context).hoverColor,
                                                                                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                                fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                          ),
                                                                          Text(
                                                                            "39.87000",
                                                                            style: TextStyle(
                                                                                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                                fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .start,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Text(
                                                                                  "Margin (USDT)",
                                                                                  style: TextStyle(color: Theme.of(context).hoverColor, fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize, fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: MediaQuery.of(context).size.width * 0.002,
                                                                                ),
                                                                                Icon(
                                                                                  Icons.add_circle_sharp,
                                                                                  size: 16,
                                                                                  color: Theme.of(context).hoverColor,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            "39.91",
                                                                            textAlign:
                                                                                TextAlign.left,
                                                                            style: TextStyle(
                                                                                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                                fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .end,
                                                                        children: [
                                                                          Text(
                                                                            "Risk",
                                                                            style: TextStyle(
                                                                                color: Theme.of(context).hoverColor,
                                                                                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                                fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                          ),
                                                                          Text(
                                                                            "2.00%",
                                                                            style: TextStyle(
                                                                                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                                fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.03,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .start,
                                                                        children: [
                                                                          Text(
                                                                            "Entry Price (USDT)",
                                                                            style: TextStyle(
                                                                                color: Theme.of(context).hoverColor,
                                                                                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                                fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                          ),
                                                                          Text(
                                                                            "0.0450514",
                                                                            style: TextStyle(
                                                                                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                                fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .start,
                                                                        children: [
                                                                          Text(
                                                                            "Mark Price (USDT)",
                                                                            style: TextStyle(
                                                                                color: Theme.of(context).hoverColor,
                                                                                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                                fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                          ),
                                                                          Text(
                                                                            "0.0449506",
                                                                            style: TextStyle(
                                                                                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                                fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .end,
                                                                        children: [
                                                                          Text(
                                                                            "Liq.Price (USDT)",
                                                                            style: TextStyle(
                                                                                color: Theme.of(context).hoverColor,
                                                                                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                                fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                          ),
                                                                          Text(
                                                                            "0.0000091",
                                                                            style: TextStyle(
                                                                                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                                fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.02,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.035,
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.28,
                                                                      decoration: BoxDecoration(
                                                                          color: Theme.of(context)
                                                                              .shadowColor,
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(5))),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          "Adjust Leverage",
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                                  Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                              fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.035,
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.3,
                                                                      decoration: BoxDecoration(
                                                                          color: Theme.of(context)
                                                                              .shadowColor,
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(5))),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          "Stop Profit & Loss",
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                                  Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                              fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      height: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.035,
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.25,
                                                                      decoration: BoxDecoration(
                                                                          color: Theme.of(context)
                                                                              .shadowColor,
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(5))),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          "Close Position",
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                                  Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                              fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            height: 0.4,
                                                            thickness: 0.8,
                                                            color: Theme.of(
                                                                context)
                                                                .disabledColor,
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Center(
                                      child: Container(
                                        color: Colors.transparent,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                1,
                                        width: MediaQuery.of(context).size.width *
                                            0.9,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    1,
                                                child: ListView.builder(
                                                  physics: BouncingScrollPhysics(),
                                                  itemCount: 4,
                                                  itemBuilder: (context, index) {
                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.26,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                1,
                                                            color: Colors
                                                                .transparent,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.01,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          "TUSDT Perpetual",
                                                                          style: TextStyle(
                                                                              fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                                                                              fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Text(
                                                                      DateTime.now().toString().substring(0,16),
                                                                      style: TextStyle(
                                                                          color: Theme.of(context).hoverColor,
                                                                          fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.007,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      "Sell",
                                                                      style: TextStyle(
                                                                        color: Colors.red,
                                                                        fontWeight: FontWeight.w600,
                                                                        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.01,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "Price",
                                                                      style: TextStyle(
                                                                          color: Theme.of(context).hoverColor,
                                                                          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                        fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "0.1438",
                                                                      style: TextStyle(
                                                                          color: Theme.of(context).hintColor,
                                                                          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                          fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: MediaQuery.of(context).size.height*0.01,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "Filled (USDT)",
                                                                      style: TextStyle(
                                                                          color: Theme.of(context).hoverColor,
                                                                          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                        fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "29.1914",
                                                                      style: TextStyle(
                                                                          color: Theme.of(context).hintColor,
                                                                          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                          fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: MediaQuery.of(context).size.height*0.01,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "Fee (USDT)",
                                                                      style: TextStyle(
                                                                          color: Theme.of(context).hoverColor,
                                                                          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                        fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "0.01167656",
                                                                      style: TextStyle(
                                                                          color: Theme.of(context).hintColor,
                                                                          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                          fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: MediaQuery.of(context).size.height*0.01,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "Role",
                                                                      style: TextStyle(
                                                                          color: Theme.of(context).hoverColor,
                                                                          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                        fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "Taker",
                                                                      style: TextStyle(
                                                                          color: Theme.of(context).hintColor,
                                                                          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                          fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: MediaQuery.of(context).size.height*0.01,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "Realized PNL (USDT)",
                                                                      style: TextStyle(
                                                                          color: Theme.of(context).hoverColor,
                                                                          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                        fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      "-0.19220000",
                                                                      style: TextStyle(
                                                                          color: Theme.of(context).hintColor,
                                                                          fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                          fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            height: 0.4,
                                                            thickness: 0.8,
                                                            color: Theme.of(
                                                                context)
                                                                .disabledColor,
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : DefaultTabController(
                    length: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          child: TabBar(
                            labelPadding: EdgeInsets.zero,
                            padding: EdgeInsets.zero,
                            indicatorPadding: EdgeInsets.zero,
                            isScrollable: false,
                            dividerColor: Colors.transparent,
                            indicator: MaterialIndicator(
                                tabPosition: TabPosition.bottom,
                                color: Theme.of(context).splashColor,
                                height: MediaQuery.of(context).size.height *
                                    0.004,
                                horizontalPadding:
                                MediaQuery.of(context).size.width * 0.1,
                                bottomLeftRadius: 0,
                                bottomRightRadius: 0,
                                topLeftRadius: 0,
                                topRightRadius: 0),
                            tabs: [
                              Container(
                                height: MediaQuery.of(context).size.height *
                                    0.035,
                                width:
                                MediaQuery.of(context).size.width * 0.5,
                                decoration:
                                BoxDecoration(color: Colors.transparent),
                                child: Center(
                                  child: Text(
                                    "Open Orders",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Theme.of(context).hoverColor,
                                      fontWeight: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.fontWeight,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height *
                                    0.035,
                                width:
                                MediaQuery.of(context).size.width * 0.5,
                                decoration:
                                BoxDecoration(color: Colors.transparent),
                                child: Center(
                                  child: Text(
                                    "Order History",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Theme.of(context).hoverColor,
                                      fontWeight: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.fontWeight,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height *
                                    0.035,
                                width:
                                MediaQuery.of(context).size.width * 0.5,
                                decoration:
                                BoxDecoration(color: Colors.transparent),
                                child: Center(
                                  child: Text(
                                    "Positions",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Theme.of(context).hoverColor,
                                      fontWeight: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.fontWeight,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height *
                                    0.035,
                                width:
                                MediaQuery.of(context).size.width * 0.5,
                                decoration:
                                BoxDecoration(color: Colors.transparent),
                                child: Center(
                                  child: Text(
                                    "Trade History",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Theme.of(context).hoverColor,
                                      fontWeight: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.fontWeight,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 1,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: TabBarView(
                              children: [
                                SingleChildScrollView(
                                  child: Center(
                                    child: Container(
                                      color: Colors.transparent,
                                      height: MediaQuery.of(context).size.height * 1,
                                      width: MediaQuery.of(context).size.width * 0.9,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: MediaQuery.of(context).size.height * 1,
                                              child: ListView.builder(
                                                physics: BouncingScrollPhysics(),
                                                itemCount: 4,
                                                itemBuilder: (context, index) {
                                                  return SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: MediaQuery.of(
                                                              context)
                                                              .size
                                                              .height *
                                                              0.2,
                                                          width: MediaQuery.of(
                                                              context)
                                                              .size
                                                              .width *
                                                              1,
                                                          color: Colors
                                                              .transparent,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              SizedBox(
                                                                height: MediaQuery.of(
                                                                    context)
                                                                    .size
                                                                    .height *
                                                                    0.01,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "TUSDT Perpetual",
                                                                  ),
                                                                  Text(
                                                                    DateTime.now()
                                                                        .toString()
                                                                        .substring(
                                                                        0,
                                                                        16),
                                                                    style: TextStyle(
                                                                        fontSize: Theme.of(context)
                                                                            .textTheme
                                                                            .bodySmall
                                                                            ?.fontSize,
                                                                        color: Theme.of(context)
                                                                            .hoverColor),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    "Stop Market / Sell",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red,
                                                                        fontSize: Theme.of(context)
                                                                            .textTheme
                                                                            .bodySmall
                                                                            ?.fontSize),
                                                                  )
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: MediaQuery.of(
                                                                    context)
                                                                    .size
                                                                    .height *
                                                                    0.008,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      CircularPercentIndicator(
                                                                        radius:
                                                                        20,
                                                                        center:
                                                                        Text(
                                                                          "0%",
                                                                          style:
                                                                          TextStyle(color: Colors.red),
                                                                        ),
                                                                        backgroundWidth:
                                                                        4,
                                                                        backgroundColor:
                                                                        Theme.of(context).shadowColor,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      Row(
                                                                        crossAxisAlignment:
                                                                        CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            "Amount",
                                                                            style: TextStyle(
                                                                                fontSize: 11,
                                                                                color: Theme.of(context).hoverColor,
                                                                                fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                            MediaQuery.of(context).size.width * 0.05,
                                                                          ),
                                                                          Text(
                                                                            "0.00000 / 39.33840",
                                                                            style: TextStyle(
                                                                                fontSize: 11,
                                                                                color: Theme.of(context).textTheme.bodySmall?.color,
                                                                                fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Text(
                                                                        "(USDT)",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                            11,
                                                                            color:
                                                                            Theme.of(context).hoverColor,
                                                                            fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Price",
                                                                            style: TextStyle(
                                                                                fontSize: 11,
                                                                                color: Theme.of(context).hoverColor,
                                                                                fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                            MediaQuery.of(context).size.width * 0.085,
                                                                          ),
                                                                          Text(
                                                                            "--",
                                                                            style: TextStyle(
                                                                                fontSize: 11,
                                                                                color: Theme.of(context).textTheme.bodySmall?.color,
                                                                                fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Conditions",
                                                                            style: TextStyle(
                                                                                fontSize: 11,
                                                                                color: Theme.of(context).hoverColor,
                                                                                fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                            MediaQuery.of(context).size.width * 0.01,
                                                                          ),
                                                                          Text(
                                                                            "Last Price<0.0444000",
                                                                            style: TextStyle(
                                                                                fontSize: 11,
                                                                                color: Theme.of(context).textTheme.bodySmall?.color,
                                                                                fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Reduce",
                                                                            style: TextStyle(
                                                                                fontSize: 11,
                                                                                color: Theme.of(context).hoverColor,
                                                                                fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                            MediaQuery.of(context).size.width * 0.055,
                                                                          ),
                                                                          Text(
                                                                            "True",
                                                                            style: TextStyle(
                                                                                fontSize: 11,
                                                                                color: Theme.of(context).textTheme.bodySmall?.color,
                                                                                fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Text(
                                                                        "Only",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                            11,
                                                                            color:
                                                                            Theme.of(context).hoverColor,
                                                                            fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.12,
                                                                        height: MediaQuery.of(context).size.height *
                                                                            0.025,
                                                                        color: Theme.of(context)
                                                                            .shadowColor,
                                                                        child:
                                                                        Center(
                                                                          child:
                                                                          Text(
                                                                            "Cancel",
                                                                            style: TextStyle(
                                                                                fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                                                                                color: Theme.of(context).textTheme.bodySmall?.color,
                                                                                fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Divider(
                                                          height: 0.4,
                                                          thickness: 0.8,
                                                          color: Theme.of(
                                                              context)
                                                              .focusColor,
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Center(
                                    child: Container(
                                      color: Colors.transparent,
                                      height:
                                      MediaQuery.of(context).size.height *
                                          1,
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    showModalBottomSheet(
                                                        context: context,
                                                        builder: (BuildContext context) {
                                                          return Container(
                                                            height: MediaQuery.of(context).size.height*0.5,
                                                            color: Theme.of(context).appBarTheme.backgroundColor,
                                                          );
                                                        }
                                                    );
                                                  },
                                                  child: Container(
                                                    width:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        0.24,
                                                    height:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                        0.03,
                                                    color: Colors.transparent,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Symbol: ",
                                                          style: TextStyle(
                                                              color: Theme.of(context).hoverColor,
                                                              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                              fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight
                                                          ),
                                                        ),
                                                        Text(
                                                          "All",
                                                          style: TextStyle(
                                                              color: Theme.of(context).hoverColor,
                                                              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                              fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons.arrow_drop_down_sharp,
                                                          color: Theme.of(context).hoverColor,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                      0.02,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    showModalBottomSheet(
                                                        context: context,
                                                        builder: (BuildContext context) {
                                                          return Container(
                                                            height: MediaQuery.of(context).size.height*0.5,
                                                            color: Theme.of(context).appBarTheme.backgroundColor,
                                                          );
                                                        }
                                                    );
                                                  },
                                                  child: Container(
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        0.24,
                                                    height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                        0.03,
                                                    color: Colors.transparent,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Type: ",
                                                          style: TextStyle(
                                                              color: Theme.of(context).hoverColor,
                                                              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                              fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight
                                                          ),
                                                        ),
                                                        Text(
                                                          "All",
                                                          style: TextStyle(
                                                              color: Theme.of(context).hoverColor,
                                                              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                              fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons.arrow_drop_down_sharp,
                                                          color: Theme.of(context).hoverColor,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  1,
                                              child: ListView.builder(
                                                physics: BouncingScrollPhysics(),
                                                itemCount: 5,
                                                itemBuilder: (context, index) {
                                                  return SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: MediaQuery.of(
                                                              context)
                                                              .size
                                                              .height *
                                                              0.17,
                                                          width: MediaQuery.of(
                                                              context)
                                                              .size
                                                              .width *
                                                              1,
                                                          color: Colors
                                                              .transparent,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              SizedBox(
                                                                height: MediaQuery.of(
                                                                    context)
                                                                    .size
                                                                    .height *
                                                                    0.01,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        "TUSDT Perpetual",
                                                                        style: TextStyle(
                                                                            fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                                                                            fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        DateTime.now().toString().substring(0,16),
                                                                        style: TextStyle(
                                                                            color: Theme.of(context).hoverColor,
                                                                            fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                        ),
                                                                      ),
                                                                      Icon(
                                                                        Icons.arrow_forward_ios_sharp,
                                                                        size: 10,
                                                                        color: Theme.of(context).hintColor,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: MediaQuery.of(
                                                                    context)
                                                                    .size
                                                                    .height *
                                                                    0.015,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Limit / Buy",
                                                                    style: TextStyle(
                                                                        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                        fontWeight: FontWeight.w600,
                                                                        color: Colors.green
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height: MediaQuery.of(context).size.height*0.025,
                                                                    width: MediaQuery.of(context).size.width*0.16,
                                                                    color: Theme.of(context).focusColor,
                                                                    child: Center(
                                                                      child: Text(
                                                                        "Cancelled",
                                                                        style: TextStyle(
                                                                            color: Theme.of(context).textTheme.bodyLarge?.color,
                                                                            fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: MediaQuery.of(
                                                                    context)
                                                                    .size
                                                                    .height *
                                                                    0.01,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Amount (USDT)",
                                                                    style: TextStyle(
                                                                        color: Theme.of(context).hoverColor,
                                                                        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                        fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        "0.00000",
                                                                        style: TextStyle(
                                                                            color: Theme.of(context).textTheme.bodyLarge?.color,
                                                                            fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                            fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        " / 5.00000",
                                                                        style: TextStyle(
                                                                            color: Theme.of(context).hoverColor,
                                                                            fontSize: 12,
                                                                            fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: MediaQuery.of(context).size.height*0.01,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Price",
                                                                    style: TextStyle(
                                                                        color: Theme.of(context).hoverColor,
                                                                        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                        fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        "-",
                                                                        style: TextStyle(
                                                                            color: Theme.of(context).textTheme.bodyLarge?.color,
                                                                            fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                            fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        " / 0.00400",
                                                                        style: TextStyle(
                                                                            color: Theme.of(context).hoverColor,
                                                                            fontSize: 12,
                                                                            fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Divider(
                                                          height: 0.4,
                                                          thickness: 0.8,
                                                          color: Theme.of(
                                                              context)
                                                              .focusColor,
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Center(
                                    child: Container(
                                      color: Colors.transparent,
                                      height:
                                      MediaQuery.of(context).size.height *
                                          1,
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  1,
                                              child: ListView.builder(
                                                physics:
                                                BouncingScrollPhysics(),
                                                itemCount: 2,
                                                itemBuilder: (context, index) {
                                                  return SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: MediaQuery.of(
                                                              context)
                                                              .size
                                                              .height *
                                                              0.3,
                                                          width: MediaQuery.of(
                                                              context)
                                                              .size
                                                              .width *
                                                              1,
                                                          color: Colors
                                                              .transparent,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              SizedBox(
                                                                height: MediaQuery.of(
                                                                    context)
                                                                    .size
                                                                    .height *
                                                                    0.01,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        height: MediaQuery.of(context).size.height *
                                                                            0.02,
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.04,
                                                                        child:
                                                                        Center(
                                                                          child:
                                                                          Text("B"),
                                                                        ),
                                                                        color: Colors
                                                                            .green,
                                                                      ),
                                                                      SizedBox(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.03,
                                                                      ),
                                                                      Text(
                                                                        "TUSDT Perpetual",
                                                                        style:
                                                                        TextStyle(
                                                                          fontSize: Theme.of(context)
                                                                              .textTheme
                                                                              .bodyLarge
                                                                              ?.fontSize,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.03,
                                                                      ),
                                                                      Text(
                                                                        "Isolated 1X",
                                                                        style: TextStyle(
                                                                            color:
                                                                            Theme.of(context).hoverColor),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: MediaQuery.of(
                                                                    context)
                                                                    .size
                                                                    .height *
                                                                    0.02,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "PNL (USDT)",
                                                                    style: TextStyle(
                                                                        color: Theme.of(context)
                                                                            .hoverColor,
                                                                        fontSize: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium
                                                                            ?.fontSize,
                                                                        fontWeight: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyLarge
                                                                            ?.fontWeight),
                                                                  ),
                                                                  Text(
                                                                    "ROE",
                                                                    style: TextStyle(
                                                                        color: Theme.of(context)
                                                                            .hoverColor,
                                                                        fontSize: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium
                                                                            ?.fontSize,
                                                                        fontWeight: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyLarge
                                                                            ?.fontWeight),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: MediaQuery.of(
                                                                    context)
                                                                    .size
                                                                    .height *
                                                                    0.005,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "-0.04",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red,
                                                                        fontSize:
                                                                        18),
                                                                  ),
                                                                  Text(
                                                                    "-0.11%",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red,
                                                                        fontSize:
                                                                        18),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    color: Colors
                                                                        .transparent,
                                                                    child:
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                      children: [
                                                                        Text(
                                                                          "Size (USDT)",
                                                                          style: TextStyle(
                                                                              color: Theme.of(context).hoverColor,
                                                                              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                              fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                        ),
                                                                        Text(
                                                                          "39.87000",
                                                                          style: TextStyle(
                                                                              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                              fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    color: Colors
                                                                        .transparent,
                                                                    child:
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                          EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.05),
                                                                          child:
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                "Margin (USDT)",
                                                                                style: TextStyle(color: Theme.of(context).hoverColor, fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize, fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                              ),
                                                                              SizedBox(
                                                                                width: MediaQuery.of(context).size.width * 0.002,
                                                                              ),
                                                                              Icon(
                                                                                Icons.add_circle_sharp,
                                                                                size: 16,
                                                                                color: Theme.of(context).hoverColor,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          "39.91",
                                                                          textAlign:
                                                                          TextAlign.left,
                                                                          style: TextStyle(
                                                                              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                              fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    color: Colors
                                                                        .transparent,
                                                                    child:
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                      children: [
                                                                        Text(
                                                                          "Risk",
                                                                          style: TextStyle(
                                                                              color: Theme.of(context).hoverColor,
                                                                              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                              fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                        ),
                                                                        Text(
                                                                          "2.00%",
                                                                          style: TextStyle(
                                                                              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                              fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: MediaQuery.of(
                                                                    context)
                                                                    .size
                                                                    .height *
                                                                    0.03,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    color: Colors
                                                                        .transparent,
                                                                    child:
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                      children: [
                                                                        Text(
                                                                          "Entry Price (USDT)",
                                                                          style: TextStyle(
                                                                              color: Theme.of(context).hoverColor,
                                                                              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                              fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                        ),
                                                                        Text(
                                                                          "0.0450514",
                                                                          style: TextStyle(
                                                                              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                              fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    color: Colors
                                                                        .transparent,
                                                                    child:
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                      children: [
                                                                        Text(
                                                                          "Mark Price (USDT)",
                                                                          style: TextStyle(
                                                                              color: Theme.of(context).hoverColor,
                                                                              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                              fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                        ),
                                                                        Text(
                                                                          "0.0449506",
                                                                          style: TextStyle(
                                                                              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                              fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    color: Colors
                                                                        .transparent,
                                                                    child:
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                      children: [
                                                                        Text(
                                                                          "Liq.Price (USDT)",
                                                                          style: TextStyle(
                                                                              color: Theme.of(context).hoverColor,
                                                                              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                              fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                        ),
                                                                        Text(
                                                                          "0.0000091",
                                                                          style: TextStyle(
                                                                              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                              fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: MediaQuery.of(
                                                                    context)
                                                                    .size
                                                                    .height *
                                                                    0.02,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    height: MediaQuery.of(context)
                                                                        .size
                                                                        .height *
                                                                        0.035,
                                                                    width: MediaQuery.of(context)
                                                                        .size
                                                                        .width *
                                                                        0.28,
                                                                    decoration: BoxDecoration(
                                                                        color: Theme.of(context)
                                                                            .shadowColor,
                                                                        borderRadius:
                                                                        BorderRadius.all(Radius.circular(5))),
                                                                    child:
                                                                    Center(
                                                                      child:
                                                                      Text(
                                                                        "Adjust Leverage",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                            Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                            fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height: MediaQuery.of(context)
                                                                        .size
                                                                        .height *
                                                                        0.035,
                                                                    width: MediaQuery.of(context)
                                                                        .size
                                                                        .width *
                                                                        0.3,
                                                                    decoration: BoxDecoration(
                                                                        color: Theme.of(context)
                                                                            .shadowColor,
                                                                        borderRadius:
                                                                        BorderRadius.all(Radius.circular(5))),
                                                                    child:
                                                                    Center(
                                                                      child:
                                                                      Text(
                                                                        "Stop Profit & Loss",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                            Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                            fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height: MediaQuery.of(context)
                                                                        .size
                                                                        .height *
                                                                        0.035,
                                                                    width: MediaQuery.of(context)
                                                                        .size
                                                                        .width *
                                                                        0.25,
                                                                    decoration: BoxDecoration(
                                                                        color: Theme.of(context)
                                                                            .shadowColor,
                                                                        borderRadius:
                                                                        BorderRadius.all(Radius.circular(5))),
                                                                    child:
                                                                    Center(
                                                                      child:
                                                                      Text(
                                                                        "Close Position",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                            Theme.of(context).textTheme.bodyMedium?.fontSize,
                                                                            fontWeight: Theme.of(context).textTheme.bodyMedium?.fontWeight),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Divider(
                                                          height: 0.4,
                                                          thickness: 0.8,
                                                          color: Theme.of(
                                                              context)
                                                              .focusColor,
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Center(
                                    child: Container(
                                      color: Colors.transparent,
                                      height:
                                      MediaQuery.of(context).size.height *
                                          1,
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  1,
                                              child: ListView.builder(
                                                physics: BouncingScrollPhysics(),
                                                itemCount: 4,
                                                itemBuilder: (context, index) {
                                                  return SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: MediaQuery.of(
                                                              context)
                                                              .size
                                                              .height *
                                                              0.26,
                                                          width: MediaQuery.of(
                                                              context)
                                                              .size
                                                              .width *
                                                              1,
                                                          color: Colors
                                                              .transparent,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              SizedBox(
                                                                height: MediaQuery.of(
                                                                    context)
                                                                    .size
                                                                    .height *
                                                                    0.01,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        "TUSDT Perpetual",
                                                                        style: TextStyle(
                                                                            fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                                                                            fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Text(
                                                                    DateTime.now().toString().substring(0,16),
                                                                    style: TextStyle(
                                                                        color: Theme.of(context).hoverColor,
                                                                        fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: MediaQuery.of(
                                                                    context)
                                                                    .size
                                                                    .height *
                                                                    0.007,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Text(
                                                                    "Sell",
                                                                    style: TextStyle(
                                                                        color: Colors.red,
                                                                        fontWeight: FontWeight.w600,
                                                                        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: MediaQuery.of(
                                                                    context)
                                                                    .size
                                                                    .height *
                                                                    0.01,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Price",
                                                                    style: TextStyle(
                                                                        color: Theme.of(context).hoverColor,
                                                                        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                        fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "0.1438",
                                                                    style: TextStyle(
                                                                        color: Theme.of(context).textTheme.bodyLarge?.color,
                                                                        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                        fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: MediaQuery.of(context).size.height*0.01,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Filled (USDT)",
                                                                    style: TextStyle(
                                                                        color: Theme.of(context).hoverColor,
                                                                        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                        fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "29.1914",
                                                                    style: TextStyle(
                                                                        color: Theme.of(context).textTheme.bodyLarge?.color,
                                                                        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                        fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: MediaQuery.of(context).size.height*0.01,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Fee (USDT)",
                                                                    style: TextStyle(
                                                                        color: Theme.of(context).hoverColor,
                                                                        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                        fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "0.01167656",
                                                                    style: TextStyle(
                                                                        color: Theme.of(context).textTheme.bodyLarge?.color,
                                                                        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                        fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: MediaQuery.of(context).size.height*0.01,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Role",
                                                                    style: TextStyle(
                                                                        color: Theme.of(context).hoverColor,
                                                                        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                        fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "Taker",
                                                                    style: TextStyle(
                                                                        color: Theme.of(context).textTheme.bodyLarge?.color,
                                                                        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                        fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: MediaQuery.of(context).size.height*0.01,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Realized PNL (USDT)",
                                                                    style: TextStyle(
                                                                        color: Theme.of(context).hoverColor,
                                                                        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                        fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "-0.19220000",
                                                                    style: TextStyle(
                                                                        color: Theme.of(context).textTheme.bodyLarge?.color,
                                                                        fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                                                                        fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Divider(
                                                          height: 0.4,
                                                          thickness: 0.8,
                                                          color: Theme.of(
                                                              context)
                                                              .focusColor,
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
