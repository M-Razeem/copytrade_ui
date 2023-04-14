import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import 'main.dart';

List _orders = [];
List fullOrders = [];
List<dynamic> positions = [];
List<dynamic> tradeHistory = [];
double pnl = 0;
DateTime? selectedDate;

class Future1 extends StatefulWidget {

  final Map<String, dynamic> traderData;
  const Future1({Key? key, required this.traderData}) : super(key: key);

  @override
  State<Future1> createState() => _Future1State();
}

class _Future1State extends State<Future1> {
  @override
  void initState() {
    _orders = [];
    fullOrders = [];
    positions = [];
    tradeHistory = [];

    selectedDate = DateTime.now();
    getUserData();
    getUserPnl();
    super.initState();
  }

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
        setState(() {});
        return true;
      } else {
        return await getUserData();
      }
    } catch (err) {
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
      DateTime now = DateTime.now();
      Response response = await dio1.get('', queryParameters: {
        'key': widget.traderData['api_key'],
        'secret': widget.traderData['api_secret'],
        'fromYear': selectedDate?.year ?? now.year,
        'fromMonth': selectedDate?.month ?? now.month,
        'fromDay': 1,
        'toYear': selectedDate?.year ?? now.year,
        'toMonth': (selectedDate?.month ?? now.month) + 1,
        'toDay': 1,
      });

      if (!response.data.toString().contains("Access-Control-Allow-Origin") &&
          !response.data.toString().contains("CORS policy")) {
        print("startttttt");
        if (response.data.toString() != "error" &&
            response.data.toString() != "An error occurred") {
          tradeHistory = response.data['trades'];
          fullOrders = response.data['fullOrders'];

          tradeHistory.sort((a, b) => (int.tryParse(b['time'].toString()) ?? 0)
              .compareTo(int.tryParse(a['time'].toString()) ?? 0));
          fullOrders.sort((a, b) => (int.tryParse(b['time'].toString()) ?? 0)
              .compareTo(int.tryParse(a['time'].toString()) ?? 0));

          print(fullOrders[4]);
          print(fullOrders[5]);

          pnl = double.tryParse(response.data['pnl'].toString()) ?? 0;
          setState(() {});
        } else {
          print(response.data.toString());
        }
        return true;
      } else {
        print(response.data.toString());
        await Future.delayed(Duration(seconds: 2));
        return await getUserPnl();
      }
    } catch (err) {
      print(err);
      await Future.delayed(Duration(seconds: 2));
      return await getUserPnl();
    }
  }

  Future<void> refresh() async {
    getUserData();
    getUserPnl();
  }



  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refresh,
      child: darkMode
          ? DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            automaticallyImplyLeading: true,
            leadingWidth: 24,
            backgroundColor: darkMode
                ? Theme.of(context).scaffoldBackgroundColor
                : Theme.of(context).scaffoldBackgroundColor,
            elevation: 0.0,
            title: Text(
              'User Details',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: TabBar(
              labelPadding: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              isScrollable: false,
              dividerColor: Colors.transparent,
              indicator: MaterialIndicator(
                  tabPosition: TabPosition.bottom,
                  color: Theme.of(context).splashColor,
                  height: MediaQuery.of(context).size.height * 0.004,
                  horizontalPadding:
                  MediaQuery.of(context).size.width * 0.1,
                  bottomLeftRadius: 0,
                  bottomRightRadius: 0,
                  topLeftRadius: 0,
                  topRightRadius: 0),
              tabs: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.035,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(color: Colors.transparent),
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
                  height: MediaQuery.of(context).size.height * 0.035,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(color: Colors.transparent),
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
                  height: MediaQuery.of(context).size.height * 0.035,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(color: Colors.transparent),
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
                  height: MediaQuery.of(context).size.height * 0.035,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(color: Colors.transparent),
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
          body: TabBarView(
            children: [
              OpenOrdersTab(
                refresh: refresh,
                traderData: widget.traderData,
              ),
              AllOrdersTab(
                refresh: refresh,
                traderData: widget.traderData,
              ),
              OpenPositionsTab1(
                refresh: refresh,
                traderData: widget.traderData,
              ),
              TradeHistoryTab(
                refresh: refresh,
                traderData: widget.traderData,
              ),
            ],
          ),
        ),
      )
          : DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            automaticallyImplyLeading: true,
            leadingWidth: 24,
            backgroundColor: darkMode
                ? Theme.of(context).scaffoldBackgroundColor
                : Theme.of(context).scaffoldBackgroundColor,
            elevation: 0.0,
            title: Text(
              'User Details',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: TabBar(
              labelPadding: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              indicatorPadding: EdgeInsets.zero,
              isScrollable: false,
              dividerColor: Colors.transparent,
              indicator: MaterialIndicator(
                  tabPosition: TabPosition.bottom,
                  color: Theme.of(context).splashColor,
                  height: MediaQuery.of(context).size.height * 0.004,
                  horizontalPadding:
                  MediaQuery.of(context).size.width * 0.1,
                  bottomLeftRadius: 0,
                  bottomRightRadius: 0,
                  topLeftRadius: 0,
                  topRightRadius: 0),
              tabs: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.035,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(color: Colors.transparent),
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
                  height: MediaQuery.of(context).size.height * 0.035,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(color: Colors.transparent),
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
                  height: MediaQuery.of(context).size.height * 0.035,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(color: Colors.transparent),
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
                  height: MediaQuery.of(context).size.height * 0.035,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(color: Colors.transparent),
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
          body: TabBarView(
            children: [
              OpenOrdersTab(
                refresh: refresh,
                traderData: widget.traderData,
              ),
              AllOrdersTab(
                refresh: refresh,
                traderData: widget.traderData,
              ),
              OpenPositionsTab1(
                refresh: refresh,
                traderData: widget.traderData,
              ),
              TradeHistoryTab(
                refresh: refresh,
                traderData: widget.traderData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AllOrdersTab extends StatefulWidget {
  final Function refresh;
  final Map<String, dynamic> traderData;

  const AllOrdersTab(
      {Key? key, required this.refresh, required this.traderData})
      : super(key: key);

  @override
  _AllOrdersTabState createState() => _AllOrdersTabState();
}

class _AllOrdersTabState extends State<AllOrdersTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: fullOrders.length,
      itemBuilder: (context, index) {
        final order = fullOrders[index];
        return AllOrderCard(
          symbol: order['symbol'],
          orderType: order['type'],
          side: order['side'],
          price: order['price'],
          traderData: widget.traderData,
          amount: order['origQty'],
          time: order['time'].toString(),
          executedQty: order['executedQty'],
          conditions: order['stopPrice'] == "0"
              ? "-"
              : "${order['workingType']}:  ${order['stopPrice']}",
          reduceOnly: order['reduceOnly'],
          refresh: widget.refresh,
          status: order['status'],
          cumQuote: order['cumQuote'],
          order: order,
        );
      },
    );
  }
}

class AllOrderCard extends StatelessWidget {
  final String symbol;
  final String orderType;
  final String side;
  final String amount;
  final String cumQuote;
  final String price;
  final String time;
  final String executedQty;
  final String conditions;
  final bool reduceOnly;
  final Map<String, dynamic> traderData;
  final Map<String, dynamic> order;
  final Function refresh;
  final String status;

  const AllOrderCard({
    required this.symbol,
    required this.orderType,
    required this.side,
    required this.amount,
    required this.price,
    required this.time,
    required this.executedQty,
    required this.conditions,
    required this.reduceOnly,
    required this.traderData,
    required this.refresh,
    required this.status,
    required this.cumQuote,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height:
                    MediaQuery.of(context).size.height *
                        0.5,
                    color: Theme.of(context)
                        .appBarTheme
                        .backgroundColor,
                  );
                });
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.24,
            height: MediaQuery.of(context).size.height * 0.03,
            color: Colors.transparent,
            child: Row(
              children: [
                Text(
                  "Symbol: ",
                  style: TextStyle(
                      color: Theme.of(context).hoverColor,
                      fontSize: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.fontSize,
                      fontWeight: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.fontWeight),
                ),
                Text(
                  "All",
                  style: TextStyle(
                      color: Theme.of(context).hoverColor,
                      fontSize: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.fontSize,
                      fontWeight: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.fontWeight),
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
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height:
                    MediaQuery.of(context).size.height *
                        0.5,
                    color: Theme.of(context)
                        .appBarTheme
                        .backgroundColor,
                  );
                });
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.24,
            height: MediaQuery.of(context).size.height * 0.03,
            color: Colors.transparent,
            child: Row(
              children: [
                Text(
                  "Type: ",
                  style: TextStyle(
                      color: Theme.of(context).hoverColor,
                      fontSize: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.fontSize,
                      fontWeight: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.fontWeight),
                ),
                Text(
                  "All",
                  style: TextStyle(
                      color: Theme.of(context).hoverColor,
                      fontSize: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.fontSize,
                      fontWeight: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.fontWeight),
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
    ); //dark mode
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height:
                    MediaQuery.of(context).size.height *
                        0.5,
                    color: Theme.of(context)
                        .appBarTheme
                        .backgroundColor,
                  );
                });
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.24,
            height: MediaQuery.of(context).size.height * 0.03,
            color: Colors.transparent,
            child: Row(
              children: [
                Text(
                  "Symbol: ",
                  style: TextStyle(
                      color: Theme.of(context).hoverColor,
                      fontSize: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.fontSize,
                      fontWeight: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.fontWeight),
                ),
                Text(
                  "All",
                  style: TextStyle(
                      color: Theme.of(context).hoverColor,
                      fontSize: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.fontSize,
                      fontWeight: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.fontWeight),
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
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height:
                    MediaQuery.of(context).size.height *
                        0.5,
                    color: Theme.of(context)
                        .appBarTheme
                        .backgroundColor,
                  );
                });
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.24,
            height: MediaQuery.of(context).size.height * 0.03,
            color: Colors.transparent,
            child: Row(
              children: [
                Text(
                  "Type: ",
                  style: TextStyle(
                      color: Theme.of(context).hoverColor,
                      fontSize: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.fontSize,
                      fontWeight: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.fontWeight),
                ),
                Text(
                  "All",
                  style: TextStyle(
                      color: Theme.of(context).hoverColor,
                      fontSize: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.fontSize,
                      fontWeight: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.fontWeight),
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
    ); //light mode
    DateTime orderTime =
    DateTime.fromMillisecondsSinceEpoch(int.tryParse(time) ?? 0);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            darkMode ? Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height * 0.26,
              width: MediaQuery.of(context).size.width * 0.9,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height *
                          0.24,
                      width:
                      MediaQuery.of(context).size.width * 1,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context)
                                .size
                                .height *
                                0.01,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    order['symbol'],
                                    style: TextStyle(
                                        fontSize:
                                        Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.fontSize,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    orderTime
                                        .toString()
                                        .substring(0, 19),
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .hoverColor,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context)
                                .size
                                .height *
                                0.015,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '$orderType / $side',
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontSize,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green),
                              ),
                              Text(
                                status,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .hintColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontSize,
                                    fontWeight: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontWeight),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context)
                                .size
                                .height *
                                0.01,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Amount (USDT)",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .hoverColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontSize,
                                    fontWeight: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontWeight),
                              ),
                              Row(
                                children: [
                                  Text(
                                    order['status'] == "FILLED"
                                        ? '${(double.tryParse(executedQty) ?? 0) * (double.tryParse(cumQuote) ?? 0) / (double.tryParse(amount) ?? 1)}/$cumQuote'
                                        : "0/${(double.tryParse(order['origQty'].toString()) ?? 0) * ((double.tryParse(order['stopPrice'].toString()) != 0 ? double.tryParse(order['stopPrice'].toString()) : double.tryParse(order['price'].toString())) ?? 0)}",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .hintColor,
                                        fontSize:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontSize,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context)
                                .size
                                .height *
                                0.01,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Price",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .hoverColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontSize,
                                    fontWeight: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontWeight),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${order['avgPrice']}/$price',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .hintColor,
                                        fontSize:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontSize,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context)
                                .size
                                .height *
                                0.01,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Conditions",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .hoverColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontSize,
                                    fontWeight: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontWeight),
                              ),
                              Row(
                                children: [
                                  Text(
                                    conditions,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .hintColor,
                                        fontSize:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontSize,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context)
                                .size
                                .height *
                                0.01,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Reduce Only",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .hoverColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontSize,
                                    fontWeight: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontWeight),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "$reduceOnly",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .hintColor,
                                        fontSize:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontSize,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
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
                      color: Theme.of(context).disabledColor,
                    ),
                  ],
                ),
              ),
            )
                : Container(
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height * 0.26,
              width: MediaQuery.of(context).size.width * 0.9,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height *
                          0.24,
                      width:
                      MediaQuery.of(context).size.width * 1,
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context)
                                .size
                                .height *
                                0.01,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    order['symbol'],
                                    style: TextStyle(
                                        fontSize:
                                        Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.fontSize,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    orderTime
                                        .toString()
                                        .substring(0, 19),
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .hoverColor,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context)
                                .size
                                .height *
                                0.015,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '$orderType / $side',
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontSize,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green),
                              ),
                              Text(
                                status,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontSize,
                                    fontWeight: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontWeight),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context)
                                .size
                                .height *
                                0.01,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Amount (USDT)",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .hoverColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontSize,
                                    fontWeight: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontWeight),
                              ),
                              Row(
                                children: [
                                  Text(
                                    order['status'] == "FILLED"
                                        ? '${(double.tryParse(executedQty) ?? 0) * (double.tryParse(cumQuote) ?? 0) / (double.tryParse(amount) ?? 1)}/$cumQuote'
                                        : "0/${(double.tryParse(order['origQty'].toString()) ?? 0) * ((double.tryParse(order['stopPrice'].toString()) != 0 ? double.tryParse(order['stopPrice'].toString()) : double.tryParse(order['price'].toString())) ?? 0)}",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.color,
                                        fontSize:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontSize,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context)
                                .size
                                .height *
                                0.01,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Price",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .hoverColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontSize,
                                    fontWeight: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontWeight),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${order['avgPrice']}/$price",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.color,
                                        fontSize:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontSize,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context)
                                .size
                                .height *
                                0.01,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Conditions",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .hoverColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontSize,
                                    fontWeight: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontWeight),
                              ),
                              Row(
                                children: [
                                  Text(
                                    conditions,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.color,
                                        fontSize:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontSize,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context)
                                .size
                                .height *
                                0.01,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Reduce Only",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .hoverColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontSize,
                                    fontWeight: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontWeight),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "$reduceOnly",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.color,
                                        fontSize:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontSize,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
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
                      color: Theme.of(context).focusColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OpenOrdersTab extends StatefulWidget {
  final Function refresh;
  final Map<String, dynamic> traderData;

  const OpenOrdersTab(
      {Key? key, required this.refresh, required this.traderData})
      : super(key: key);

  @override
  _OpenOrdersTabState createState() => _OpenOrdersTabState();
}

class _OpenOrdersTabState extends State<OpenOrdersTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _orders.length,
      itemBuilder: (context, index) {
        final order = _orders[index];
        return OpenOrderCard(
          symbol: order['symbol'],
          orderType: order['type'],
          side: order['side'],
          price: order['price'],
          traderData: widget.traderData,
          amount: order['origQty'],
          time: order['time'].toString(),
          executedQty: order['executedQty'],
          conditions: order['stopPrice'] == "0"
              ? "-"
              : "${order['workingType']}:  ${order['stopPrice']}",
          reduceOnly: order['reduceOnly'],
          refresh: widget.refresh,
        );
      },
    );
  }
}

class OpenOrderCard extends StatelessWidget {
  final String symbol;
  final String orderType;
  final String side;
  final String amount;
  final String price;
  final String time;
  final String executedQty;
  final String conditions;
  final bool reduceOnly;
  final Map<String, dynamic> traderData;
  final Function refresh;

  const OpenOrderCard({
    required this.symbol,
    required this.orderType,
    required this.side,
    required this.amount,
    required this.price,
    required this.time,
    required this.executedQty,
    required this.conditions,
    required this.reduceOnly,
    required this.traderData,
    required this.refresh,
  });

  @override
  Widget build(BuildContext context) {
    DateTime orderTime =
    DateTime.fromMillisecondsSinceEpoch(int.tryParse(time) ?? 0);
    return SingleChildScrollView(
      child: Center(
        child: darkMode
            ? Container(
          color: Colors.transparent,
          height: MediaQuery.of(context).size.height * 0.22,
          width: MediaQuery.of(context).size.width * 0.9,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height *
                      0.2,
                  width:
                  MediaQuery.of(context).size.width * 1,
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context)
                            .size
                            .height *
                            0.01,
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            symbol,
                          ),
                          Text(
                            orderTime.toString(),
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
                            '$orderType / $side',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.fontSize),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context)
                            .size
                            .height *
                            0.008,
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.end,
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: [
                              CircularPercentIndicator(
                                radius: 20,
                                center: Text(
                                  "0%",
                                  style: TextStyle(
                                      color: Colors.red),
                                ),
                                backgroundWidth: 4,
                                backgroundColor:
                                Theme.of(context)
                                    .shadowColor,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Amount",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color:
                                        Theme.of(context)
                                            .hoverColor,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                  SizedBox(
                                    width:
                                    MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.05,
                                  ),
                                  Text(
                                    '$executedQty/$amount',
                                    style: TextStyle(
                                        fontSize: 11,
                                        color:
                                        Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.color,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                ],
                              ),
                              Text(
                                "(USDT)",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Theme.of(context)
                                        .hoverColor,
                                    fontWeight:
                                    Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontWeight),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Price",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color:
                                        Theme.of(context)
                                            .hoverColor,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                  SizedBox(
                                    width:
                                    MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.085,
                                  ),
                                  Text(
                                    price,
                                    style: TextStyle(
                                        fontSize: 11,
                                        color:
                                        Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.color,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Conditions",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color:
                                        Theme.of(context)
                                            .hoverColor,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                  SizedBox(
                                    width:
                                    MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.01,
                                  ),
                                  Text(
                                    conditions,
                                    style: TextStyle(
                                        fontSize: 11,
                                        color:
                                        Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.color,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Reduce",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color:
                                        Theme.of(context)
                                            .hoverColor,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                  SizedBox(
                                    width:
                                    MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.055,
                                  ),
                                  Text(
                                    '$reduceOnly',
                                    style: TextStyle(
                                        fontSize: 11,
                                        color:
                                        Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.color,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                ],
                              ),
                              Text(
                                "Only",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Theme.of(context)
                                        .hoverColor,
                                    fontWeight:
                                    Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontWeight),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.end,
                            mainAxisAlignment:
                            MainAxisAlignment.end,
                            children: [
                              Container(
                                width: MediaQuery.of(context)
                                    .size
                                    .width *
                                    0.12,
                                height: MediaQuery.of(context)
                                    .size
                                    .height *
                                    0.025,
                                color: Theme.of(context)
                                    .shadowColor,
                                child: Center(
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                        fontSize:
                                        Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.fontSize,
                                        color:
                                        Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.color,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.fontWeight),
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
                  color: Theme.of(context).disabledColor,
                ),
              ],
            ),
          ),
        )
            : Container(
          color: Colors.transparent,
          height: MediaQuery.of(context).size.height * 0.22,
          width: MediaQuery.of(context).size.width * 0.9,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height *
                      0.2,
                  width:
                  MediaQuery.of(context).size.width * 1,
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context)
                            .size
                            .height *
                            0.01,
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            symbol,
                          ),
                          Text(
                            orderTime.toString(),
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
                            "$orderType / $side",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.fontSize),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context)
                            .size
                            .height *
                            0.008,
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.end,
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: [
                              CircularPercentIndicator(
                                radius: 20,
                                center: Text(
                                  "0%",
                                  style: TextStyle(
                                      color: Colors.red),
                                ),
                                backgroundWidth: 4,
                                backgroundColor:
                                Theme.of(context)
                                    .shadowColor,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Amount",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color:
                                        Theme.of(context)
                                            .hoverColor,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                  SizedBox(
                                    width:
                                    MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.05,
                                  ),
                                  Text(
                                    "$executedQty/$amount",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color:
                                        Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.color,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                ],
                              ),
                              Text(
                                "(USDT)",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Theme.of(context)
                                        .hoverColor,
                                    fontWeight:
                                    Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontWeight),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Price",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color:
                                        Theme.of(context)
                                            .hoverColor,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                  SizedBox(
                                    width:
                                    MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.085,
                                  ),
                                  Text(
                                    price,
                                    style: TextStyle(
                                        fontSize: 11,
                                        color:
                                        Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.color,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Conditions",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color:
                                        Theme.of(context)
                                            .hoverColor,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                  SizedBox(
                                    width:
                                    MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.01,
                                  ),
                                  Text(
                                    conditions,
                                    style: TextStyle(
                                        fontSize: 11,
                                        color:
                                        Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.color,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Reduce",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color:
                                        Theme.of(context)
                                            .hoverColor,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                  SizedBox(
                                    width:
                                    MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.055,
                                  ),
                                  Text(
                                    "$reduceOnly",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color:
                                        Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.color,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.fontWeight),
                                  ),
                                ],
                              ),
                              Text(
                                "Only",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Theme.of(context)
                                        .hoverColor,
                                    fontWeight:
                                    Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.fontWeight),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.end,
                            mainAxisAlignment:
                            MainAxisAlignment.end,
                            children: [
                              Container(
                                width: MediaQuery.of(context)
                                    .size
                                    .width *
                                    0.12,
                                height: MediaQuery.of(context)
                                    .size
                                    .height *
                                    0.025,
                                color: Theme.of(context)
                                    .shadowColor,
                                child: Center(
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                        fontSize:
                                        Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.fontSize,
                                        color:
                                        Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.color,
                                        fontWeight:
                                        Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.fontWeight),
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
                  color: Theme.of(context).focusColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OpenPositionsTab1 extends StatefulWidget {
  final Function refresh;
  final Map<String, dynamic> traderData;

  const OpenPositionsTab1(
      {Key? key, required this.refresh, required this.traderData})
      : super(key: key);

  @override
  _OpenPositionsTab1State createState() => _OpenPositionsTab1State();
}

class _OpenPositionsTab1State extends State<OpenPositionsTab1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: darkMode
            ? Container(
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
                    itemCount: positions.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height *
                                  0.7,
                              width:
                              MediaQuery.of(context).size.width * 1,
                              color: Colors.transparent,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            positions[index]['symbol'],
                                            style: TextStyle(
                                              fontSize: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.fontSize,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.03,
                                          ),
                                          Text(
                                            positions[index]['marginType']
                                                .toString() +
                                                " " +
                                                positions[index]
                                                ['leverage']
                                                    .toString() +
                                                "x",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .hoverColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.005,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        (double.tryParse(positions[index][
                                        'unRealizedProfit']) ??
                                            0)
                                            .toStringAsFixed(2),
                                        style: TextStyle(
                                          color: (double.tryParse(positions[
                                          index][
                                          'unRealizedProfit']) ??
                                              0) <
                                              0
                                              ? Color(0xFFF64D51)
                                              : Color(0xFF1CD28B),
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      Text(
                                        ((double.tryParse(positions[index]
                                        [
                                        'unRealizedProfit']) ??
                                            0) >
                                            0
                                            ? "+ "
                                            : "- ") +
                                            (((double.tryParse(positions[index]['unRealizedProfit']) ??
                                                0) *
                                                (double.tryParse(
                                                    positions[index]['leverage']
                                                        .toString()) ??
                                                    0)) /
                                                (double.tryParse(positions[index]
                                                ['notional']
                                                    .toString()) ??
                                                    1)
                                                    .abs())
                                                .abs()
                                                .toStringAsFixed(2) +
                                            "%",
                                        style: TextStyle(
                                          color: (double.tryParse(positions[
                                          index][
                                          'unRealizedProfit']) ??
                                              0) <
                                              0
                                              ? Color(0xFFF64D51)
                                              : Color(0xFF1CD28B),
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Size (USDT)",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .hoverColor,
                                                  fontSize:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontSize,
                                                  fontWeight:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.fontWeight),
                                            ),
                                            Text(
                                              positions[index]['notional']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontSize,
                                                  fontWeight:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.fontWeight),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        color: Colors.transparent,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: MediaQuery.of(
                                                      context)
                                                      .size
                                                      .width *
                                                      0.05),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Margin (USDT)",
                                                    style: TextStyle(
                                                        color: Theme.of(
                                                            context)
                                                            .hoverColor,
                                                        fontSize: Theme.of(
                                                            context)
                                                            .textTheme
                                                            .bodyMedium
                                                            ?.fontSize,
                                                        fontWeight: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .bodyLarge
                                                            ?.fontWeight),
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.of(
                                                        context)
                                                        .size
                                                        .width *
                                                        0.002,
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .add_circle_sharp,
                                                    size: 16,
                                                    color:
                                                    Theme.of(context)
                                                        .hoverColor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              ((double.tryParse(positions[
                                              index]
                                              [
                                              'notional']
                                                  .toString()) ??
                                                  0) /
                                                  (double.tryParse(positions[
                                                  index]
                                                  [
                                                  'leverage']
                                                      .toString()) ??
                                                      1))
                                                  .toString(),
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontSize,
                                                  fontWeight:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.fontWeight),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Container(
                                      //   color: Colors
                                      //       .transparent,
                                      //   child:
                                      //   Column(
                                      //     crossAxisAlignment:
                                      //     CrossAxisAlignment
                                      //         .end,
                                      //     children: [
                                      //       Text(
                                      //         "Risk",
                                      //         style: TextStyle(
                                      //             color: Theme.of(context).hoverColor,
                                      //             fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                      //             fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                      //       ),
                                      //       Text(
                                      //         "2.00%",
                                      //         style: TextStyle(
                                      //             fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                                      //             fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.03,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Entry Price (USDT)",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .hoverColor,
                                                  fontSize:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontSize,
                                                  fontWeight:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.fontWeight),
                                            ),
                                            Text(
                                              positions[index]
                                              ['entryPrice']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontSize,
                                                  fontWeight:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.fontWeight),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        color: Colors.transparent,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Mark Price (USDT)",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .hoverColor,
                                                  fontSize:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontSize,
                                                  fontWeight:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.fontWeight),
                                            ),
                                            Text(
                                              positions[index]
                                              ['markPrice']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontSize,
                                                  fontWeight:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.fontWeight),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        color: Colors.transparent,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "Liq.Price (USDT)",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .hoverColor,
                                                  fontSize:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontSize,
                                                  fontWeight:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.fontWeight),
                                            ),
                                            Text(
                                              positions[index]
                                              ['liquidationPrice']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontSize,
                                                  fontWeight:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.fontWeight),
                                            ),
                                          ],
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
                              color: Theme.of(context).disabledColor,
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
        )
            : Container(
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
                    itemCount: positions.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height *
                                  0.3,
                              width:
                              MediaQuery.of(context).size.width * 1,
                              color: Colors.transparent,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            positions[index]['symbol'],
                                            style: TextStyle(
                                              fontSize: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.fontSize,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width *
                                                0.03,
                                          ),
                                          Text(
                                            positions[index]['marginType']
                                                .toString() +
                                                " " +
                                                positions[index]
                                                ['leverage']
                                                    .toString() +
                                                "x",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .hoverColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.005,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        (double.tryParse(positions[index][
                                        'unRealizedProfit']) ??
                                            0)
                                            .toStringAsFixed(2),
                                        style: TextStyle(
                                          color: (double.tryParse(positions[
                                          index][
                                          'unRealizedProfit']) ??
                                              0) <
                                              0
                                              ? Color(0xFFF64D51)
                                              : Color(0xFF1CD28B),
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      Text(
                                        ((double.tryParse(positions[index]
                                        [
                                        'unRealizedProfit']) ??
                                            0) >
                                            0
                                            ? "+ "
                                            : "- ") +
                                            (((double.tryParse(positions[index]['unRealizedProfit']) ??
                                                0) *
                                                (double.tryParse(
                                                    positions[index]['leverage']
                                                        .toString()) ??
                                                    0)) /
                                                (double.tryParse(positions[index]
                                                ['notional']
                                                    .toString()) ??
                                                    1)
                                                    .abs())
                                                .abs()
                                                .toStringAsFixed(2) +
                                            "%",
                                        style: TextStyle(
                                          color: (double.tryParse(positions[
                                          index][
                                          'unRealizedProfit']) ??
                                              0) <
                                              0
                                              ? Color(0xFFF64D51)
                                              : Color(0xFF1CD28B),
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Size (USDT)",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .hoverColor,
                                                  fontSize:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontSize,
                                                  fontWeight:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.fontWeight),
                                            ),
                                            Text(
                                              positions[index]['notional']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontSize,
                                                  fontWeight:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.fontWeight),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        color: Colors.transparent,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: MediaQuery.of(
                                                      context)
                                                      .size
                                                      .width *
                                                      0.05),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Margin (USDT)",
                                                    style: TextStyle(
                                                        color: Theme.of(
                                                            context)
                                                            .hoverColor,
                                                        fontSize: Theme.of(
                                                            context)
                                                            .textTheme
                                                            .bodyMedium
                                                            ?.fontSize,
                                                        fontWeight: Theme
                                                            .of(context)
                                                            .textTheme
                                                            .bodyLarge
                                                            ?.fontWeight),
                                                  ),
                                                  SizedBox(
                                                    width: MediaQuery.of(
                                                        context)
                                                        .size
                                                        .width *
                                                        0.002,
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .add_circle_sharp,
                                                    size: 16,
                                                    color:
                                                    Theme.of(context)
                                                        .hoverColor,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              ((double.tryParse(positions[
                                              index]
                                              [
                                              'notional']
                                                  .toString()) ??
                                                  0) /
                                                  (double.tryParse(positions[
                                                  index]
                                                  [
                                                  'leverage']
                                                      .toString()) ??
                                                      1))
                                                  .toString(),
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontSize,
                                                  fontWeight:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.fontWeight),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.03,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Entry Price (USDT)",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .hoverColor,
                                                  fontSize:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontSize,
                                                  fontWeight:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.fontWeight),
                                            ),
                                            Text(
                                              positions[index]
                                              ['entryPrice']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontSize,
                                                  fontWeight:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.fontWeight),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        color: Colors.transparent,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Mark Price (USDT)",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .hoverColor,
                                                  fontSize:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontSize,
                                                  fontWeight:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.fontWeight),
                                            ),
                                            Text(
                                              positions[index]
                                              ['markPrice']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontSize,
                                                  fontWeight:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.fontWeight),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        color: Colors.transparent,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "Liq.Price (USDT)",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .hoverColor,
                                                  fontSize:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontSize,
                                                  fontWeight:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.fontWeight),
                                            ),
                                            Text(
                                              positions[index]
                                              ['liquidationPrice']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.fontSize,
                                                  fontWeight:
                                                  Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.fontWeight),
                                            ),
                                          ],
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
                              color: Theme.of(context).focusColor,
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
    );
  }
}

class TradeHistoryTab extends StatelessWidget {
  final Function refresh;
  final Map<String, dynamic> traderData;

  const TradeHistoryTab(
      {Key? key, required this.refresh, required this.traderData})
      : super(key: key);

  Future<void> _onPressed({required BuildContext context}) async {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
    // final localeObj = Locale("in");
    selectedDate = await showMonthYearPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(DateTime.now().year),
    );
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: darkMode
            ? Container(
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
                    itemCount: tradeHistory.length,
                    itemBuilder: (context, index) {
                      DateTime orderTime =
                      DateTime.fromMillisecondsSinceEpoch(
                          int.tryParse(tradeHistory[index]['time']
                              .toString()) ??
                              0);
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height *
                                  0.26,
                              width:
                              MediaQuery.of(context).size.width * 1,
                              color: Colors.transparent,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            tradeHistory[index]['symbol'],
                                            style: TextStyle(
                                                fontSize:
                                                Theme.of(context)
                                                    .textTheme
                                                    .titleSmall
                                                    ?.fontSize,
                                                fontWeight:
                                                Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.fontWeight),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        orderTime.toString(),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .hoverColor,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontWeight),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.007,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        tradeHistory[index]['side']
                                            .toString(),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.color,
                                            fontWeight: FontWeight.w600,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontSize),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Price",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .hoverColor,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontSize,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontWeight),
                                      ),
                                      Text(
                                        tradeHistory[index]['price']
                                            .toString(),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .hintColor,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontSize,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontWeight),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Filled (USDT)",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .hoverColor,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontSize,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontWeight),
                                      ),
                                      Text(
                                        tradeHistory[index]['quoteQty']
                                            .toString(),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .hintColor,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontSize,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontWeight),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Fee (USDT)",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .hoverColor,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontSize,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontWeight),
                                      ),
                                      Text(
                                        tradeHistory[index]['commission']
                                            .toString(),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .hintColor,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontSize,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontWeight),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Role",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .hoverColor,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontSize,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontWeight),
                                      ),
                                      Text(
                                        tradeHistory[index]['maker']
                                            ? "Maker"
                                            : "Taker",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .hintColor,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontSize,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontWeight),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Realized PNL (USDT)",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .hoverColor,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontSize,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontWeight),
                                      ),
                                      Text(
                                        tradeHistory[index]['realizedPnl']
                                            .toString(),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .hintColor,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontSize,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontWeight),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 0.4,
                              thickness: 0.8,
                              color: Theme.of(context).disabledColor,
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
        )
            : Container(
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
                    itemCount: tradeHistory.length,
                    itemBuilder: (context, index) {
                      DateTime orderTime =
                      DateTime.fromMillisecondsSinceEpoch(
                          int.tryParse(tradeHistory[index]['time']
                              .toString()) ??
                              0);
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height *
                                  0.26,
                              width:
                              MediaQuery.of(context).size.width * 1,
                              color: Colors.transparent,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            tradeHistory[index]['symbol'],
                                            style: TextStyle(
                                                fontSize:
                                                Theme.of(context)
                                                    .textTheme
                                                    .titleSmall
                                                    ?.fontSize,
                                                fontWeight:
                                                Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.fontWeight),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        orderTime.toString(),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .hoverColor,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontWeight),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.007,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        tradeHistory[index]['side']
                                            .toString(),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.color,
                                            fontWeight: FontWeight.w600,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontSize),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Price",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .hoverColor,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontSize,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontWeight),
                                      ),
                                      Text(
                                        tradeHistory[index]['price']
                                            .toString(),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.color,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontSize,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontWeight),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Filled (USDT)",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .hoverColor,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontSize,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontWeight),
                                      ),
                                      Text(
                                        tradeHistory[index]['quoteQty']
                                            .toString(),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.color,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontSize,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontWeight),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Fee (USDT)",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .hoverColor,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontSize,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontWeight),
                                      ),
                                      Text(
                                        tradeHistory[index]['commission']
                                            .toString(),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.color,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontSize,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontWeight),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Role",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .hoverColor,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontSize,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontWeight),
                                      ),
                                      Text(
                                        tradeHistory[index]['maker']
                                            ? "Maker"
                                            : "Taker",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.color,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontSize,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontWeight),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context)
                                        .size
                                        .height *
                                        0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Realized PNL (USDT)",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .hoverColor,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontSize,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontWeight),
                                      ),
                                      Text(
                                        tradeHistory[index]['realizedPnl']
                                            .toString(),
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.color,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontSize,
                                            fontWeight: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.fontWeight),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 0.4,
                              thickness: 0.8,
                              color: Theme.of(context).focusColor,
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
    );
  }
}
